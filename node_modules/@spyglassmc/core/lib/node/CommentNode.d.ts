import type { DeepReadonly, InheritReadonly } from '../common/index.js';
import type { AstNode } from './AstNode.js';
export interface CommentNode extends AstNode {
    readonly type: 'comment';
    /**
     * The actual comment with prefixes and suffixes removed.
     */
    comment: string;
    /**
     * The prefix used to start the comment
     */
    prefix: string;
}
export declare namespace CommentNode {
    function is<T extends DeepReadonly<AstNode> | undefined>(obj: T): obj is InheritReadonly<CommentNode, T>;
}
//# sourceMappingURL=CommentNode.d.ts.map