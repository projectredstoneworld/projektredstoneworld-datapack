import { Range } from '../source/index.js';
export var LongNode;
(function (LongNode) {
    function is(obj) {
        return obj.type === 'long';
    }
    LongNode.is = is;
    function mock(range) {
        return { type: 'long', range: Range.get(range), value: 0n };
    }
    LongNode.mock = mock;
})(LongNode || (LongNode = {}));
//# sourceMappingURL=LongNode.js.map