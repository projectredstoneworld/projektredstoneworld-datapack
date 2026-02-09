import * as core from '@spyglassmc/core';
import { localize } from '@spyglassmc/locales';
export function literal(names, isRoot = false) {
    const options = {
        pool: names,
        colorTokenType: isRoot ? 'keyword' : 'literal',
    };
    return (src, ctx) => {
        const start = src.cursor;
        const value = src.readUntil(' ', '\r', '\n');
        if (!value.length) {
            return core.Failure;
        }
        const ans = {
            type: 'mcfunction:command_child/literal',
            range: core.Range.create(start, src),
            options,
            value,
        };
        if (!names.includes(value)) {
            ctx.err.report(localize('expected', names), ans);
        }
        return ans;
    };
}
//# sourceMappingURL=literal.js.map