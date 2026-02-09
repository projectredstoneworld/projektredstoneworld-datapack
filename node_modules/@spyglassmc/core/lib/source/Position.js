export var Position;
(function (Position) {
    function create(param1, param2) {
        if (typeof param1 === 'object') {
            return _createFromPartial(param1);
        }
        else {
            return _createFromNumbers(param1, param2);
        }
    }
    Position.create = create;
    function _createFromPartial(partial) {
        return { line: partial.line ?? 0, character: partial.character ?? 0 };
    }
    function _createFromNumbers(line, character) {
        return _createFromPartial({ line, character });
    }
    /**
     * ```typescript
     * { line: 0, character: 0 }
     * ```
     */
    Position.Beginning = Position.create(0, 0);
    /**
     * ```typescript
     * { line: Infinity, character: Infinity }
     * ```
     */
    Position.Infinity = Position.create(Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY);
    function toString(pos) {
        return `<${pos.line}, ${pos.character}>`;
    }
    Position.toString = toString;
    function isBefore(pos1, pos2) {
        return (pos1.line < pos2.line || (pos1.line === pos2.line && pos1.character < pos2.character));
    }
    Position.isBefore = isBefore;
})(Position || (Position = {}));
//# sourceMappingURL=Position.js.map