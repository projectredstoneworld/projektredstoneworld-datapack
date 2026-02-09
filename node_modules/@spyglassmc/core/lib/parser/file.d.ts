import type { FileNode } from '../node/index.js';
import { AstNode } from '../node/index.js';
import type { InfallibleParser, Parser } from './Parser.js';
/**
 * Dispatches to the corresponding parser for the language.
 * @throws If there's no parser registered for this language ID.
 */
export declare function file(parser: Parser<AstNode>): InfallibleParser<FileNode<AstNode>>;
//# sourceMappingURL=file.d.ts.map