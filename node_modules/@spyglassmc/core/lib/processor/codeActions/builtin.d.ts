import type { AstNode } from '../../node/index.js';
import { FileNode } from '../../node/index.js';
import type { MetaRegistry } from '../../service/index.js';
import type { CodeActionProvider } from './CodeAction.js';
export declare const fallback: CodeActionProvider<AstNode>;
export declare const file: CodeActionProvider<FileNode<AstNode>>;
export declare function registerProviders(meta: MetaRegistry): void;
//# sourceMappingURL=builtin.d.ts.map