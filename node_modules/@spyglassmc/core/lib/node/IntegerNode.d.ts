import type { RangeLike } from '../source/index.js';
import type { AstNode } from './AstNode.js';
export interface IntegerBaseNode extends AstNode {
    value: number;
}
export interface IntegerNode extends IntegerBaseNode {
    readonly type: 'integer';
}
export declare namespace IntegerNode {
    function is(obj: object): obj is IntegerNode;
    function mock(range: RangeLike): IntegerNode;
}
//# sourceMappingURL=IntegerNode.d.ts.map