import { Range } from '../source/index.js';
export var FloatNode;
(function (FloatNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj.type === 'float';
    }
    FloatNode.is = is;
    function mock(range) {
        return { type: 'float', range: Range.get(range), value: 0 };
    }
    FloatNode.mock = mock;
})(FloatNode || (FloatNode = {}));
//# sourceMappingURL=FloatNode.js.map