import type { RangeLike } from '../source/index.js';
import type { AstNode } from './AstNode.js';
export interface BooleanBaseNode extends AstNode {
    readonly value?: boolean;
}
export interface BooleanNode extends BooleanBaseNode {
    readonly type: 'boolean';
}
export declare namespace BooleanNode {
    function is(obj: AstNode): obj is BooleanNode;
    function mock(range: RangeLike): BooleanNode;
}
//# sourceMappingURL=BooleanNode.d.ts.map