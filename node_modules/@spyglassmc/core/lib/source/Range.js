import { Offset } from './Offset.js';
export var Range;
(function (Range) {
    /**
     * Gets a range from `RangeLike`.
     *
     * @returns
     * - `Range`: a clone of it.
     * - `RangeContainer`: a clone of its range.
     * - `OffsetLike`: a range with both positions set to the offset.
     */
    function get(range) {
        const evaluated = typeof range === 'function' ? range() : range;
        if (Range.is(evaluated)) {
            return Range.create(evaluated.start, evaluated.end);
        }
        if (RangeContainer.is(evaluated)) {
            return Range.create(evaluated.range.start, evaluated.range.end);
        }
        return Range.create(evaluated);
    }
    Range.get = get;
    /**
     * Creates a range from `OffsetLike`. If only `start` is passed in, `end` will be the same value as `start`.
     */
    function create(start, end) {
        start = Offset.get(start);
        return { start, end: end !== undefined ? Offset.get(end) : start };
    }
    Range.create = create;
    /**
     * Creates a range that covers the area between `from.start` and `to.end`.
     */
    function span(from, to) {
        return { start: Range.get(from).start, end: Range.get(to).end };
    }
    Range.span = span;
    function is(obj) {
        return (!!obj
            && typeof obj === 'object'
            && typeof obj.start === 'number'
            && typeof obj.end === 'number');
    }
    Range.is = is;
    /**
     * ```typescript
     * { start: 0, end: 1 }
     * ```
     */
    Range.Beginning = Object.freeze(Range.create(0, 1));
    /**
     * ```typescript
     * { start: 0, end: Infinity }
     * ```
     */
    Range.Full = Object.freeze(Range.create(0, Number.POSITIVE_INFINITY));
    function toString(range) {
        return `[${range.start}, ${range.end})`;
    }
    Range.toString = toString;
    function contains(range, offset, endInclusive = false) {
        range = get(range);
        return (range.start <= offset && (endInclusive ? offset <= range.end : offset < range.end));
    }
    Range.contains = contains;
    function containsRange(a, b, endInclusive = false) {
        a = get(a);
        b = get(b);
        return contains(a, b.start, endInclusive) && contains(a, b.end, true);
    }
    Range.containsRange = containsRange;
    function intersects(a, b) {
        return Range.contains(a, b.start) || Range.contains(b, a.start);
    }
    Range.intersects = intersects;
    function equals(a, b) {
        return a.start === b.start && a.end === b.end;
    }
    Range.equals = equals;
    function endsBefore(range, target, endInclusive = false) {
        return endInclusive
            ? range.end < Range.get(target).start
            : range.end <= Range.get(target).start;
    }
    Range.endsBefore = endsBefore;
    function isEmpty(range) {
        range = get(range);
        return range.start === range.end;
    }
    Range.isEmpty = isEmpty;
    function length(range) {
        return range.end - range.start;
    }
    Range.length = length;
    /**
     * @returns Negative when `a` is before `b`, `0` if they intersect, and positive if it's after.
     */
    function compare(a, b, endInclusive = false) {
        if (endInclusive ? a.end < b.start : a.end <= b.start) {
            return -1;
        }
        else if (endInclusive ? a.start > b.end : a.start >= b.end) {
            return 1;
        }
        else {
            return 0;
        }
    }
    Range.compare = compare;
    /**
     * @returns Negative when `range` is before `offset`, `0` if it {@link contains} `offset`, and positive if it's after.
     */
    function compareOffset(range, offset, endInclusive = false) {
        if (endInclusive ? range.end < offset : range.end <= offset) {
            return -1;
        }
        else if (range.start > offset) {
            return 1;
        }
        else {
            return 0;
        }
    }
    Range.compareOffset = compareOffset;
    /**
     * @param startOffset The number to offset the start of the `range`.
     * @param endOffset The number to offset the end of the `range`. Default: `startOffset`.
     * @returns A copy of `range`.
     */
    function translate(range, startOffset, endOffset = startOffset) {
        range = get(range);
        return { start: range.start + startOffset, end: range.end + endOffset };
    }
    Range.translate = translate;
})(Range || (Range = {}));
export var RangeContainer;
(function (RangeContainer) {
    function is(obj) {
        return (!!obj && typeof obj === 'object' && Range.is(obj.range));
    }
    RangeContainer.is = is;
})(RangeContainer || (RangeContainer = {}));
//# sourceMappingURL=Range.js.map