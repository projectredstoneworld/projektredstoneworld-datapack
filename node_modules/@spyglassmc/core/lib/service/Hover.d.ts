import type { RangeLike } from '../source/index.js';
import { Range } from '../source/index.js';
export interface Hover {
    range: Range;
    markdown: string;
}
export declare namespace Hover {
    function create(range: RangeLike, markdown: string): Hover;
}
//# sourceMappingURL=Hover.d.ts.map