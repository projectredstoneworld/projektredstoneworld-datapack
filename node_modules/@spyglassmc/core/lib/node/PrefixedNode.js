import { Range } from '../source/index.js';
import { LiteralNode } from './LiteralNode.js';
export var PrefixedNode;
(function (PrefixedNode) {
    function is(obj) {
        return obj.type === 'prefixed';
    }
    PrefixedNode.is = is;
    function mock(range, prefix, child) {
        return {
            type: 'prefixed',
            range: Range.get(range),
            prefix,
            children: [
                LiteralNode.mock(range, { pool: [prefix] }),
                child,
            ],
        };
    }
    PrefixedNode.mock = mock;
})(PrefixedNode || (PrefixedNode = {}));
//# sourceMappingURL=PrefixedNode.js.map