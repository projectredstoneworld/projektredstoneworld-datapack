import * as core from '@spyglassmc/core';
import { Range } from '@spyglassmc/core';
export const null_ = (src, ctx) => {
    const start = src.cursor;
    if (src.trySkip('null')) {
        return { type: 'json:null', range: Range.create(start, src) };
    }
    return core.Failure;
};
//# sourceMappingURL=null.js.map