import { StateProxy } from '../../common/index.js';
import { ErrorReporter } from '../../service/index.js';
import { traversePreOrder } from '../util.js';
export function attempt(checker, node, ctx) {
    const tempCtx = {
        ...ctx,
        err: new ErrorReporter(ctx.err.source),
        symbols: ctx.symbols.clone(),
    };
    // FIXME: await
    checker(node, tempCtx);
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
}
export function any(checkers) {
    if (checkers.length === 0) {
        throw new Error('Expected at least one checker');
    }
    return (node, ctx) => {
        const attempts = checkers.map((checker) => attempt(checker, node, ctx)).sort((a, b) => a.errorAmount - b.errorAmount || a.totalErrorSpan - b.totalErrorSpan);
        attempts[0].updateNodeAndCtx();
    };
}
/**
 * No operation.
 */
export const noop = () => { };
/**
 * Use the shallowest children that have their own checker to validate.
 */
export const fallback = async (node, ctx) => {
    const promises = [];
    traversePreOrder(node, (node) => !ctx.meta.hasChecker(node.type), (node) => ctx.meta.hasChecker(node.type), (node) => {
        const checker = ctx.meta.getChecker(node.type);
        const result = checker(node, ctx);
        if (result instanceof Promise) {
            promises.push(result);
        }
    });
    await Promise.all(promises);
};
export const fallbackSync = async (node, ctx) => {
    const promises = [];
    traversePreOrder(node, (node) => !ctx.meta.hasChecker(node.type), (node) => ctx.meta.hasChecker(node.type), (node) => {
        const checker = ctx.meta.getChecker(node.type);
        const result = checker(node, ctx);
        if (result instanceof Promise) {
            ctx.logger.warn(`[fallbackSync] Trying to run async checker for "${node.type}"`);
        }
    });
    await Promise.all(promises);
};
export const dispatchSync = (node, ctx) => {
    for (const child of node.children ?? []) {
        if (ctx.meta.hasChecker(child.type)) {
            const checker = ctx.meta.getChecker(child.type);
            checker(child, ctx);
        }
    }
};
export const resourceLocation = (node, ctx) => {
    // const full = ResourceLocationNode.toString(node, 'full')
    // if (node.options.pool) {
    // 	if (!node.options.pool.includes(full)) {
    // 		ctx.err.report(localize('expected', node.options.pool), node, ErrorSeverity.Error)
    // 	}
    // 	return
    // }
};
export const symbol = (_node, _ctx) => {
    // TODO
};
export function registerCheckers(meta) {
    meta.registerChecker('resource_location', resourceLocation);
    meta.registerChecker('symbol', symbol);
}
//# sourceMappingURL=builtin.js.map