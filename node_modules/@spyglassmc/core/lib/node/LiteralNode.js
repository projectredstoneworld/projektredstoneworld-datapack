import { Range } from '../source/index.js';
export var LiteralNode;
(function (LiteralNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj?.type === 'literal';
    }
    LiteralNode.is = is;
    function mock(range, options) {
        return { type: 'literal', range: Range.get(range), options, value: '' };
    }
    LiteralNode.mock = mock;
})(LiteralNode || (LiteralNode = {}));
//# sourceMappingURL=LiteralNode.js.map