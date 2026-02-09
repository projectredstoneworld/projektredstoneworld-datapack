import type { RangeLike } from '../source/index.js';
import type { AstNode } from './AstNode.js';
export interface LongBaseNode extends AstNode {
    value: bigint;
}
export interface LongNode extends LongBaseNode {
    readonly type: 'long';
}
export declare namespace LongNode {
    function is(obj: object): obj is LongNode;
    function mock(range: RangeLike): LongNode;
}
//# sourceMappingURL=LongNode.d.ts.map