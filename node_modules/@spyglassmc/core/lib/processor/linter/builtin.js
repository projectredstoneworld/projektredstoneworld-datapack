import { localeQuote, localize } from '@spyglassmc/locales';
import { isAllowedCharacter } from '../../parser/index.js';
import { SymbolLinterConfig } from '../../service/index.js';
import { McdocCategories } from '../../symbol/index.js';
import { undeclaredSymbol } from './builtin/undeclaredSymbol.js';
export const noop = () => { };
/**
 * @param key The name of the key on the {@link AstNode} that contains the value to be validated.
 */
export function nameConvention(key) {
    return (node, ctx) => {
        if (typeof node[key] !== 'string') {
            throw new Error(`Trying to access property "${key}" of node type "${node.type}"`);
        }
        const name = node[key];
        try {
            // SECURITY: ReDoS attack. The risk is acceptable at the moment.
            const regex = new RegExp(ctx.ruleValue);
            if (!name.match(regex)) {
                ctx.err.lint(localize('linter.name-convention.illegal', localeQuote(name), localeQuote(ctx.ruleValue)), node);
            }
        }
        catch (e) {
            ctx.logger.error(`[nameConvention linter] The value “${ctx.ruleValue}” set for rule “${ctx.ruleName}” is not a valid regular expression.`, e);
        }
    };
}
export const quote = (node, ctx) => {
    const config = ctx.ruleValue;
    const mustValueBeQuoted = node.options.unquotable
        ? [...node.value].some((c) => !isAllowedCharacter(c, node.options.unquotable))
        : true;
    const isQuoteRequired = config.always || mustValueBeQuoted;
    const isQuoteProhibited = config.always === false && !mustValueBeQuoted;
    const firstChar = ctx.src.slice(node.range.start, node.range.start + 1);
    const isFirstCharQuote = !!node.options.quotes?.includes(firstChar);
    if (isQuoteRequired) {
        if (isFirstCharQuote) {
            // TODO: Check type
            config.avoidEscape;
            config.type;
        }
        else {
            // TODO: Error quote expected
        }
    }
    else if (isQuoteProhibited && isFirstCharQuote) {
        // TODO: Error no quote expected
    }
};
export var configValidator;
(function (configValidator) {
    function getDocLink(name) {
        return `https://spyglassmc.com/user/lint/${name}`;
    }
    function wrapError(name, msg) {
        return `[Invalid Linter Config] [${name}] ${localize('linter-config-validator.wrapper', msg, getDocLink(name))}`;
    }
    function nameConvention(name, val, logger) {
        if (typeof val !== 'string') {
            logger.error(wrapError(name, localize('linter-config-validator.name-convention.type')));
            return false;
        }
        try {
            // SECURITY: ReDoS attack. The risk is acceptable at the moment.
            new RegExp(val);
        }
        catch (e) {
            logger.error(wrapError(name, localize('')), e);
            return false;
        }
        return true;
    }
    configValidator.nameConvention = nameConvention;
    function symbolLinterConfig(_name, value, _logger) {
        return SymbolLinterConfig.is(value);
    }
    configValidator.symbolLinterConfig = symbolLinterConfig;
})(configValidator || (configValidator = {}));
export function registerLinters(meta) {
    meta.registerLinter('nameOfObjective', {
        configValidator: configValidator.nameConvention,
        linter: nameConvention('value'),
        nodePredicate: (n) => n.symbol && n.symbol.category === 'objective',
    });
    meta.registerLinter('nameOfScoreHolder', {
        configValidator: configValidator.nameConvention,
        linter: nameConvention('value'),
        nodePredicate: (n) => n.symbol && n.symbol.category === 'score_holder',
    });
    meta.registerLinter('nameOfTag', {
        configValidator: configValidator.nameConvention,
        linter: nameConvention('value'),
        nodePredicate: (n) => n.symbol && n.symbol.category === 'tag',
    });
    meta.registerLinter('nameOfTeam', {
        configValidator: configValidator.nameConvention,
        linter: nameConvention('value'),
        nodePredicate: (n) => n.symbol && n.symbol.category === 'team',
    });
    meta.registerLinter('undeclaredSymbol', {
        configValidator: configValidator.symbolLinterConfig,
        linter: undeclaredSymbol,
        nodePredicate: (n) => n.symbol && !McdocCategories.includes(n.symbol.category),
    });
}
//# sourceMappingURL=builtin.js.map