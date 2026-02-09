import * as core from '@spyglassmc/core';
import { entry } from './entry.js';
import { string } from './string.js';
export const object = (src, ctx) => core.setType('json:object', core.record({
    start: '{',
    pair: { key: string, sep: ':', value: entry, end: ',', trailingEnd: false },
    end: '}',
}))(src, ctx);
//# sourceMappingURL=object.js.map