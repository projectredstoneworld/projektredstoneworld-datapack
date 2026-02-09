import type { AstNode, BooleanBaseNode, CommentNode, ErrorNode, FileNode, FloatBaseNode, IntegerNode, LiteralBaseNode, LongNode, ResourceLocationBaseNode, StringBaseNode } from '../../node/index.js';
import type { MetaRegistry } from '../../service/index.js';
import type { Formatter } from './Formatter.js';
export declare const fallback: Formatter;
export declare const error: Formatter<ErrorNode>;
export declare const file: Formatter<FileNode<AstNode>>;
export declare const boolean: Formatter<BooleanBaseNode>;
export declare const comment: Formatter<CommentNode>;
export declare const float: Formatter<FloatBaseNode>;
export declare const integer: Formatter<IntegerNode>;
export declare const literal: Formatter<LiteralBaseNode>;
export declare const long: Formatter<LongNode>;
export declare const resourceLocation: Formatter<ResourceLocationBaseNode>;
export declare const string: Formatter<StringBaseNode>;
export declare function registerFormatters(meta: MetaRegistry): void;
//# sourceMappingURL=builtin.d.ts.map