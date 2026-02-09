import { Range } from '../source/index.js';
export var IntegerNode;
(function (IntegerNode) {
    function is(obj) {
        return obj.type === 'integer';
    }
    IntegerNode.is = is;
    function mock(range) {
        return { type: 'integer', range: Range.get(range), value: 0 };
    }
    IntegerNode.mock = mock;
})(IntegerNode || (IntegerNode = {}));
//# sourceMappingURL=IntegerNode.js.map