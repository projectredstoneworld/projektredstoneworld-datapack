import { ReadonlySource } from './Source.js';
export var Offset;
(function (Offset) {
    /**
     * Get an offset from a `OffsetLike`.
     *
     * @returns
     * - `number`: itself.
     * - `Source`: its `cursor`.
     */
    function get(offset) {
        if (typeof offset === 'function') {
            offset = offset();
        }
        if (offset instanceof ReadonlySource) {
            offset = offset.cursor;
        }
        return offset;
    }
    Offset.get = get;
})(Offset || (Offset = {}));
//# sourceMappingURL=Offset.js.map