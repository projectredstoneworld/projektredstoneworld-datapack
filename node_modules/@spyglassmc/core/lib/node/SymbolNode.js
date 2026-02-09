import { Range } from '../source/index.js';
export var SymbolNode;
(function (SymbolNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj?.type === 'symbol';
    }
    SymbolNode.is = is;
    function mock(range, options) {
        return { type: 'symbol', range: Range.get(range), options, value: '' };
    }
    SymbolNode.mock = mock;
})(SymbolNode || (SymbolNode = {}));
//# sourceMappingURL=SymbolNode.js.map