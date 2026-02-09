import { localize } from '@spyglassmc/locales';
import { Range } from '../source/index.js';
export function literal(...param) {
    const options = getOptions(param);
    return (src, ctx) => {
        const ans = { type: 'literal', range: Range.create(src), options, value: '' };
        for (const expected of options.pool) {
            if (src.trySkip(expected)) {
                ans.value = expected;
                ans.range.end = src.cursor;
                return ans;
            }
        }
        ctx.err.report(localize('expected', options.pool), ans);
        return ans;
    };
}
function getOptions(param) {
    let ans;
    if (typeof param[0] === 'object') {
        ans = param[0];
    }
    else {
        ans = { pool: param };
    }
    // Sort the pool from longest to shortest.
    ans.pool = ans.pool.sort((a, b) => b.length - a.length);
    return ans;
}
//# sourceMappingURL=literal.js.map