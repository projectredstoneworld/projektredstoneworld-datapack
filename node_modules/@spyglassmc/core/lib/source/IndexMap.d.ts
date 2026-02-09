import { Range } from './Range.js';
/**
 * The pairs should be in ascending order.
 */
export type IndexMap = {
    outer: Range;
    inner: Range;
}[];
export declare namespace IndexMap {
    function toInnerOffset(map: IndexMap, offset: number): number;
    function toInnerRange(map: IndexMap, outer: Range): Range;
    function toOuterOffset(map: IndexMap, offset: number): number;
    function toOuterRange(map: IndexMap, inner: Range): Range;
}
//# sourceMappingURL=IndexMap.d.ts.map