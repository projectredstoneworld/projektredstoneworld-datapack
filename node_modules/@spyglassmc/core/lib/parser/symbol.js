import { Range } from '../source/index.js';
export function symbol(param) {
    const options = getOptions(param);
    return (src, _ctx) => {
        const ans = {
            type: 'symbol',
            range: Range.create(src),
            options,
            value: src.readRemaining(),
        };
        ans.range.end = src.cursor;
        return ans;
    };
}
function getOptions(param) {
    if (typeof param === 'string') {
        return { category: param };
    }
    else {
        return param;
    }
}
//# sourceMappingURL=symbol.js.map