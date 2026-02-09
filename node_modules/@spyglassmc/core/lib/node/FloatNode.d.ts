import type { RangeLike } from '../source/index.js';
import type { AstNode } from './AstNode.js';
export interface FloatBaseNode extends AstNode {
    value: number;
}
export interface FloatNode extends FloatBaseNode {
    readonly type: 'float';
}
export declare namespace FloatNode {
    function is(obj: object): obj is FloatNode;
    function mock(range: RangeLike): FloatNode;
}
//# sourceMappingURL=FloatNode.d.ts.map