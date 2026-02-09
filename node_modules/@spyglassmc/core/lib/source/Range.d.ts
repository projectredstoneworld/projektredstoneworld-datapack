import type { OffsetLike } from './Offset.js';
export type RangeLike = Range | RangeContainer | OffsetLike | ((this: void) => Range | RangeContainer | OffsetLike);
export interface Range {
    start: number;
    end: number;
}
export declare namespace Range {
    /**
     * Gets a range from `RangeLike`.
     *
     * @returns
     * - `Range`: a clone of it.
     * - `RangeContainer`: a clone of its range.
     * - `OffsetLike`: a range with both positions set to the offset.
     */
    function get(range: RangeLike): Range;
    /**
     * Creates a range from `OffsetLike`. If only `start` is passed in, `end` will be the same value as `start`.
     */
    function create(start: OffsetLike, end?: OffsetLike): Range;
    /**
     * Creates a range that covers the area between `from.start` and `to.end`.
     */
    function span(from: RangeLike, to: RangeLike): Range;
    function is(obj: unknown): obj is Range;
    /**
     * ```typescript
     * { start: 0, end: 1 }
     * ```
     */
    const Beginning: Readonly<Range>;
    /**
     * ```typescript
     * { start: 0, end: Infinity }
     * ```
     */
    const Full: Readonly<Range>;
    function toString(range: Range): string;
    function contains(range: RangeLike, offset: number, endInclusive?: boolean): boolean;
    function containsRange(a: RangeLike, b: RangeLike, endInclusive?: boolean): boolean;
    function intersects(a: Range, b: Range): boolean;
    function equals(a: Range, b: Range): boolean;
    function endsBefore(range: Range, target: RangeLike, endInclusive?: boolean): boolean;
    function isEmpty(range: RangeLike): boolean;
    function length(range: Range): number;
    /**
     * @returns Negative when `a` is before `b`, `0` if they intersect, and positive if it's after.
     */
    function compare(a: Range, b: Range, endInclusive?: boolean): number;
    /**
     * @returns Negative when `range` is before `offset`, `0` if it {@link contains} `offset`, and positive if it's after.
     */
    function compareOffset(range: Range, offset: number, endInclusive?: boolean): number;
    /**
     * @param startOffset The number to offset the start of the `range`.
     * @param endOffset The number to offset the end of the `range`. Default: `startOffset`.
     * @returns A copy of `range`.
     */
    function translate(range: RangeLike, startOffset: number, endOffset?: number): Range;
}
export interface RangeContainer {
    range: Range;
    [key: string]: any;
}
export declare namespace RangeContainer {
    function is(obj: unknown): obj is RangeContainer;
}
//# sourceMappingURL=Range.d.ts.map