import { localize } from '@spyglassmc/locales';
import { ResourceLocation, StateProxy } from '../../common/index.js';
import { ResourceLocationNode } from '../../node/index.js';
import { ErrorReporter } from '../../service/index.js';
import { ErrorSeverity } from '../../source/index.js';
import { traversePreOrder } from '../util.js';
import { AsyncBinder, SyncBinder } from './Binder.js';
export function attempt(binder, node, ctx) {
    const tempCtx = {
        ...ctx,
        err: new ErrorReporter(ctx.err.source),
        symbols: ctx.symbols.clone(),
    };
    const processAfterBinder = () => {
        StateProxy.undoChanges(node);
        const totalErrorSpan = tempCtx.err.errors.map((e) => e.range.end - e.range.start).reduce((a, b) => a + b, 0);
        return {
            errorAmount: tempCtx.err.errors.length,
            totalErrorSpan,
            updateNodeAndCtx: () => {
                ctx.err.absorb(tempCtx.err);
                StateProxy.redoChanges(node);
                tempCtx.symbols.applyDelayedEdits();
            },
        };
    };
    if (SyncBinder.is(binder)) {
        binder(node, tempCtx);
        return processAfterBinder();
    }
    else {
        return (async () => {
            await binder(node, tempCtx);
            return processAfterBinder();
        })();
    }
}
export function any(binders) {
    if (binders.length === 0) {
        throw new Error('Expected at least one binder');
    }
    const attemptSorter = (a, b) => a.errorAmount - b.errorAmount || a.totalErrorSpan - b.totalErrorSpan;
    if (binders.every(SyncBinder.is)) {
        return SyncBinder.create((node, ctx) => {
            const attempts = binders.map((binder) => attempt(binder, node, ctx)).sort(attemptSorter);
            attempts[0].updateNodeAndCtx();
        });
    }
    else {
        return AsyncBinder.create(async (node, ctx) => {
            const attempts = (await Promise.all(binders.map((binder) => attempt(binder, node, ctx))))
                .sort(attemptSorter);
            attempts[0].updateNodeAndCtx();
        });
    }
}
/**
 * No operation.
 */
export const noop = SyncBinder.create(() => { });
/**
 * Use the shallowest children that have their own binder to validate.
 */
export const fallback = AsyncBinder.create(async (node, ctx) => {
    const promises = [];
    traversePreOrder(node, (node) => !ctx.meta.hasBinder(node.type), (node) => ctx.meta.hasBinder(node.type), (node) => {
        const binder = ctx.meta.getBinder(node.type);
        const result = binder(node, ctx);
        if (result instanceof Promise) {
            promises.push(result);
        }
    });
    await Promise.all(promises);
});
export const fallbackSync = SyncBinder.create((node, ctx) => {
    traversePreOrder(node, (node) => !ctx.meta.hasBinder(node.type), (node) => ctx.meta.hasBinder(node.type), (node) => {
        const binder = ctx.meta.getBinder(node.type);
        if (SyncBinder.is(binder)) {
            binder(node, ctx);
        }
        else {
            ctx.logger.warn(`[fallbackSync] Trying to run async binder for "${node.type}"`);
        }
    });
});
export const dispatchSync = SyncBinder.create((node, ctx) => {
    for (const child of node.children ?? []) {
        if (ctx.meta.hasBinder(child.type)) {
            const binder = ctx.meta.getBinder(child.type);
            binder(child, ctx);
        }
    }
});
export const resourceLocation = SyncBinder.create((node, ctx) => {
    const raw = ResourceLocationNode.toString(node, 'full');
    let sanitizedRaw = ResourceLocation.lengthen(node.options.namespacePathSep === '.'
        ? raw.replace(/\./g, ResourceLocation.NamespacePathSep)
        : raw);
    if (node.options.implicitPath) {
        const sepIndex = sanitizedRaw.indexOf(ResourceLocation.NamespacePathSep);
        sanitizedRaw = sanitizedRaw.substring(0, sepIndex + 1) + node.options.implicitPath
            + sanitizedRaw.substring(sepIndex + 1);
    }
    if (node.options.category) {
        ctx.symbols.query(ctx.doc, node.isTag ? `tag/${node.options.category}` : node.options.category, sanitizedRaw).enter({
            usage: { type: node.options.usageType, node, accessType: node.options.accessType },
        });
    }
    if (node.options.pool && !node.options.allowUnknown) {
        if (!node.options.pool.includes(sanitizedRaw)) {
            ctx.err.report(localize('expected', node.options.pool), node, ErrorSeverity.Error);
        }
        return;
    }
});
export const symbol = SyncBinder.create((node, ctx) => {
    if (node.value) {
        const path = node.options.parentPath ? [...node.options.parentPath, node.value] : [node.value];
        ctx.symbols.query(ctx.doc, node.options.category, ...path).enter({
            data: { subcategory: node.options.subcategory },
            usage: { type: node.options.usageType, node, accessType: node.options.accessType },
        });
    }
});
export function registerBinders(meta) {
    meta.registerBinder('resource_location', resourceLocation);
    meta.registerBinder('symbol', symbol);
}
//# sourceMappingURL=builtin.js.map