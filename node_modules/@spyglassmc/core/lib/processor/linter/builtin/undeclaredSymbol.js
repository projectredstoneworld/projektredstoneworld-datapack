import { localeQuote, localize } from '@spyglassmc/locales';
import { Arrayable, ResourceLocation } from '../../../common/index.js';
import { LinterSeverity, SymbolLinterConfig as Config } from '../../../service/index.js';
import { SymbolUtil } from '../../../symbol/index.js';
export const undeclaredSymbol = (node, ctx) => {
    if (!node.symbol || SymbolUtil.isDeclared(node.symbol)) {
        return;
    }
    const action = getAction(ctx.ruleValue, node.symbol, ctx);
    if (Config.Action.isDeclare(action)) {
        ctx.symbols.query({ doc: ctx.doc, node }, node.symbol.category, ...node.symbol.path).amend({
            data: { visibility: getVisibility(action.declare) },
            usage: { type: 'declaration', node },
        });
    }
    if (Config.Action.isReport(action)) {
        const info = {};
        const uriBuilder = ctx.meta.getUriBuilder(node.symbol.category);
        if (uriBuilder) {
            const uri = uriBuilder(node.symbol.identifier, ctx);
            if (uri) {
                info.codeAction = {
                    title: localize('code-action.create-undeclared-file', node.symbol.category, localeQuote(node.symbol.identifier)),
                    changes: [{ type: 'create', uri }],
                };
            }
        }
        const severityOverride = action.report === 'inherit'
            ? undefined
            : LinterSeverity.toErrorSeverity(action.report);
        ctx.err.lint(localize('linter.undeclared-symbol.message', node.symbol.category, localeQuote(node.symbol.identifier)), node, info, severityOverride);
    }
};
function getAction(config, symbol, ctx) {
    if (Config.Action.is(config)) {
        return config;
    }
    function test(conditions) {
        function testSingleCondition(condition) {
            const resourceLocation = ResourceLocation.lengthen(symbol.identifier);
            const namespace = resourceLocation.slice(0, resourceLocation.indexOf(ResourceLocation.NamespacePathSep));
            return ((condition.category
                ? Arrayable.toArray(condition.category).includes(symbol.category)
                : true)
                && (condition.namespace
                    ? Arrayable.toArray(condition.namespace).includes(namespace)
                    : true)
                && (condition.excludeNamespace
                    ? !Arrayable.toArray(condition.excludeNamespace).includes(namespace)
                    : true)
                && (condition.pattern
                    ? Arrayable.toArray(condition.pattern).some((p) => new RegExp(p).test(symbol.identifier))
                    : true)
                && (condition.excludePattern
                    ? !Arrayable.toArray(condition.excludePattern).some((p) => new RegExp(p).test(symbol.identifier))
                    : true));
        }
        try {
            return Arrayable.toArray(conditions).some(testSingleCondition);
        }
        catch (e) {
            // Illegal RegExp.
            ctx.logger.error('[undeclaredSymbol#getAction] Likely encountered an illegal regular expression in the config', e);
            return false;
        }
    }
    function evaluateComplexes(complexes) {
        for (const complex of Arrayable.toArray(complexes)) {
            if (complex.if && !test(complex.if)) {
                continue;
            }
            return complex.override
                ? evaluateComplexes(complex.override) ?? complex.then
                : complex.then;
        }
        return undefined;
    }
    return evaluateComplexes(config);
}
function getVisibility(input) {
    switch (input) {
        case 'block':
            return 0 /* SymbolVisibility.Block */;
        case 'file':
            return 1 /* SymbolVisibility.File */;
        case 'public':
            return 2 /* SymbolVisibility.Public */;
    }
}
//# sourceMappingURL=undeclaredSymbol.js.map