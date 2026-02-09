import type { AstNode } from './AstNode.js';
export interface ErrorNode extends AstNode {
    readonly type: 'error';
}
export declare namespace ErrorNode {
    function is(obj: AstNode): obj is ErrorNode;
}
//# sourceMappingURL=ErrorNode.d.ts.map