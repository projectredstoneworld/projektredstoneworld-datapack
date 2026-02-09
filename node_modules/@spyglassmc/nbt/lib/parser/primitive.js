import * as core from '@spyglassmc/core';
import { localize } from '@spyglassmc/locales';
import { localizeTag, newSyntax } from '../util.js';
const FloatMaximum = (2 - 2 ** -23) * 2 ** 127;
const NumeralPatterns = [
    {
        pattern: /^[-+]?(?:0|[1-9][0-9]*)b$/i,
        type: 'nbt:byte',
        hasSuffix: true,
        group: 2 /* Group.IntegerAlike */,
        min: -128,
        max: 127,
    },
    {
        pattern: /^[-+]?(?:0|[1-9][0-9]*)s$/i,
        type: 'nbt:short',
        hasSuffix: true,
        group: 2 /* Group.IntegerAlike */,
        min: -32768,
        max: 32767,
    },
    {
        pattern: /^[-+]?(?:0|[1-9][0-9]*)$/,
        type: 'nbt:int',
        hasSuffix: false,
        group: 2 /* Group.IntegerAlike */,
        min: -2147483648,
        max: 2147483647,
    },
    {
        pattern: /^[-+]?(?:0|[1-9][0-9]*)l$/i,
        type: 'nbt:long',
        hasSuffix: true,
        group: 3 /* Group.LongAlike */,
        min: -9223372036854775808n,
        max: 9223372036854775807n,
    },
    {
        pattern: /^[-+]?(?:[0-9]+\.?|[0-9]*\.[0-9]+)(?:e[-+]?[0-9]+)?f$/i,
        type: 'nbt:float',
        hasSuffix: true,
        group: 1 /* Group.FloatAlike */,
        min: -FloatMaximum,
        max: FloatMaximum,
    },
    {
        pattern: /^[-+]?(?:[0-9]+\.|[0-9]*\.[0-9]+)(?:e[-+]?[0-9]+)?$/i,
        type: 'nbt:double',
        hasSuffix: false,
        group: 1 /* Group.FloatAlike */,
        min: -Number.MAX_VALUE,
        max: Number.MAX_VALUE,
    },
    {
        pattern: /^[-+]?(?:[0-9]+\.?|[0-9]*\.[0-9]+)(?:e[-+]?[0-9]+)?d$/i,
        type: 'nbt:double',
        hasSuffix: true,
        group: 1 /* Group.FloatAlike */,
        min: -Number.MAX_VALUE,
        max: Number.MAX_VALUE,
    },
    { pattern: /^true$/i, type: 'nbt:byte', value: 1, group: 0 /* Group.Boolean */ },
    { pattern: /^false$/i, type: 'nbt:byte', value: 0, group: 0 /* Group.Boolean */ },
];
const NbtStringOptions = {
    escapable: { characters: ['b', 'f', 'n', 'r', 's', 't'], unicode: true },
    quotes: ['"', "'"],
    unquotable: core.BrigadierUnquotableOption,
};
export const string = (src, ctx) => {
    const options = newSyntax(ctx) ? NbtStringOptions : core.BrigadierStringOptions;
    return core.setType('nbt:string', core.string(options))(src, ctx);
};
export const primitive = (src, ctx) => {
    if (core.Source.isBrigadierQuote(src.peek())) {
        return string(src, ctx);
    }
    const { result: unquotedResult, updateSrcAndCtx: updateUnquoted } = core.attempt(string, src, ctx);
    for (const e of NumeralPatterns) {
        if (e.pattern.test(unquotedResult.value)) {
            if (e.group === 0 /* Group.Boolean */) {
                const ans = {
                    type: 'nbt:byte',
                    range: unquotedResult.range,
                    value: e.value,
                };
                updateUnquoted();
                return ans;
            }
            let isOutOfRange = false;
            const onOutOfRange = () => (isOutOfRange = true);
            const numeralParser = e.group === 2 /* Group.IntegerAlike */
                // As we already checked the format of the value with `e.pattern` in the if-block, there is no need to check
                // it again here in the parser, therefore we just pass in a simple /./ regex.
                ? core.integer({ pattern: /./, min: e.min, max: e.max, onOutOfRange })
                : e.group === 3 /* Group.LongAlike */
                    ? core.long({ pattern: /./, min: e.min, max: e.max, onOutOfRange })
                    : core.float({ pattern: /./, min: e.min, max: e.max, onOutOfRange });
            const { result: numeralResult, updateSrcAndCtx: updateNumeral } = core.attempt(numeralParser, src, ctx);
            if (isOutOfRange) {
                ctx.err.report(localize('nbt.parser.number.out-of-range', localizeTag(e.type), localize('nbt.node.string'), e.min, e.max), unquotedResult, core.ErrorSeverity.Warning);
                break;
            }
            updateNumeral();
            if (e.hasSuffix) {
                src.skip();
                numeralResult.range.end++;
            }
            return { ...numeralResult, type: e.type };
        }
    }
    updateUnquoted();
    return unquotedResult;
};
//# sourceMappingURL=primitive.js.map