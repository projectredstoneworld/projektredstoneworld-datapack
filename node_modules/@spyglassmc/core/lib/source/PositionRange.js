import { Position } from './Position.js';
import { Range } from './Range.js';
export var PositionRange;
(function (PositionRange) {
    function create(param1, param2, param3, param4) {
        if (typeof param1 === 'number') {
            return {
                start: Position.create(param1, param2),
                end: Position.create(param3, param4),
            };
        }
        else if (param2 !== undefined) {
            return {
                start: Position.create(param1),
                end: Position.create(param2),
            };
        }
        else {
            const partial = param1;
            return {
                start: Position.create(partial.start ?? {}),
                end: Position.create(partial.end ?? {}),
            };
        }
    }
    PositionRange.create = create;
    /**
     * @returns A `PositionRange` converted from a `RangeLike`.
     */
    function from(rangeLike, doc) {
        const range = Range.get(rangeLike);
        const ans = {
            start: doc.positionAt(range.start),
            end: doc.positionAt(range.end),
        };
        return ans;
    }
    PositionRange.from = from;
    /**
     * ```typescript
     * {
     * 	start: { line: 0, character: 0 },
     * 	end: { line: 0, character: 1 }
     * }
     * ```
     */
    PositionRange.Beginning = Object.freeze(PositionRange.create(0, 0, 0, 1));
    /**
     * ```typescript
     * {
     * 	start: { line: 0, character: 0 },
     * 	end: { line: Infinity, character: Infinity }
     * }
     * ```
     */
    PositionRange.Full = Object.freeze(PositionRange.create(Position.Beginning, Position.Infinity));
    function toString(range) {
        return `[${Position.toString(range.start)}, ${Position.toString(range.end)})`;
    }
    PositionRange.toString = toString;
    function contains(range, pos) {
        const { start, end } = range;
        // Check range of line number.
        if (pos.line < start.line || pos.line > end.line) {
            return false;
        }
        if (start.line < pos.line && pos.line < end.line) {
            return true;
        }
        // Now `pos` is in the same line as `start` and/or `end`.
        return ((pos.line === start.line ? pos.character >= start.character : true)
            && (pos.line === end.line ? pos.character < end.character : true));
    }
    PositionRange.contains = contains;
    function endsBefore(range, pos) {
        return Position.isBefore(Position.create(range.end.line, range.end.character - 1), pos);
    }
    PositionRange.endsBefore = endsBefore;
})(PositionRange || (PositionRange = {}));
//# sourceMappingURL=PositionRange.js.map