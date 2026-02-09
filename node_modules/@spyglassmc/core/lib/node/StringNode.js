import { Range } from '../source/index.js';
export const EscapeChars = ['"', "'", '\\', 'b', 'f', 'n', 'r', 's', 't'];
export var EscapeChar;
(function (EscapeChar) {
    /* istanbul ignore next */
    function is(expected, c) {
        return expected ? expected.includes(c) : false;
    }
    EscapeChar.is = is;
})(EscapeChar || (EscapeChar = {}));
export const EscapeTable = new Map([
    ['"', '"'],
    ["'", "'"],
    ['\\', '\\'],
    ['b', '\b'],
    ['f', '\f'],
    ['n', '\n'],
    ['r', '\r'],
    ['s', ' '],
    ['t', '\t'],
]);
export var StringBaseNode;
(function (StringBaseNode) {
    function is(obj) {
        return Array.isArray(obj?.valueMap)
            && typeof obj?.options === 'object';
    }
    StringBaseNode.is = is;
})(StringBaseNode || (StringBaseNode = {}));
export var StringNode;
(function (StringNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj?.type === 'string';
    }
    StringNode.is = is;
    function mock(range, options) {
        range = Range.get(range);
        return {
            type: 'string',
            range,
            options,
            value: '',
            valueMap: [{ inner: Range.create(0), outer: Range.create(range.start) }],
        };
    }
    StringNode.mock = mock;
})(StringNode || (StringNode = {}));
//# sourceMappingURL=StringNode.js.map