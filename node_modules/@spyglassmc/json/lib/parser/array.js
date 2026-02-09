import * as core from '@spyglassmc/core';
import { entry } from './entry.js';
export const array = (ctx, src) => core.setType('json:array', core.list({ start: '[', value: entry, sep: ',', trailingSep: false, end: ']' }))(ctx, src);
//# sourceMappingURL=array.js.map