import { Range } from '../source/index.js';
export var BooleanNode;
(function (BooleanNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj.type === 'boolean';
    }
    BooleanNode.is = is;
    function mock(range) {
        return { type: 'boolean', range: Range.get(range) };
    }
    BooleanNode.mock = mock;
})(BooleanNode || (BooleanNode = {}));
//# sourceMappingURL=BooleanNode.js.map