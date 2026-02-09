import type { TextDocument } from 'vscode-languageserver-textdocument';
import type { Logger } from '../common/index.js';
import type { FileNode } from '../node/index.js';
import { AstNode } from '../node/index.js';
import type { CodeAction, Color, ColorInfo, ColorToken, InlayHint, SignatureHelp } from '../processor/index.js';
import { ColorPresentation } from '../processor/index.js';
import { Range } from '../source/index.js';
import type { SymbolUsageType } from '../symbol/index.js';
import { Hover } from './Hover.js';
import { ProfilerFactory } from './Profiler.js';
import type { ProjectOptions } from './Project.js';
import { Project } from './Project.js';
import { SymbolLocations } from './SymbolLocations.js';
interface Options {
    isDebugging?: boolean;
    logger: Logger;
    profilers?: ProfilerFactory;
    project: ProjectOptions;
}
export declare class Service {
    readonly isDebugging: boolean;
    readonly logger: Logger;
    readonly profilers: ProfilerFactory;
    readonly project: Project;
    constructor({ isDebugging, logger, profilers, project }: Options);
    private debug;
    colorize(node: FileNode<AstNode>, doc: TextDocument, range?: Range): readonly ColorToken[];
    getCodeActions(node: FileNode<AstNode>, doc: TextDocument, range: Range): readonly CodeAction[];
    getColorInfo(node: FileNode<AstNode>, doc: TextDocument): ColorInfo[];
    getColorPresentation(file: FileNode<AstNode>, doc: TextDocument, range: Range, color: Color): ColorPresentation[];
    complete(node: FileNode<AstNode>, doc: TextDocument, offset: number, triggerCharacter?: string): import("../processor/index.js").CompletionItem[];
    dataHackPubify(initialism: string): string;
    format(node: FileNode<AstNode>, doc: TextDocument, tabSize: number, insertSpaces: boolean): string;
    getHover(file: FileNode<AstNode>, doc: TextDocument, offset: number): Hover | undefined;
    getInlayHints(node: FileNode<AstNode>, doc: TextDocument, range?: Range): InlayHint[];
    getSignatureHelp(node: FileNode<AstNode>, doc: TextDocument, offset: number): SignatureHelp | undefined;
    /**
     * @param searchedUsages Type of symbol usages that should be included in the result. Defaults to all usages.
     * @param currentFileOnly Whether only symbol locations in the current file should be returned.
     *
     * @returns Symbol locations of the selected symbol at `offset`, or `undefined` if there's no symbol at `offset`.
     */
    getSymbolLocations(file: FileNode<AstNode>, doc: TextDocument, offset: number, searchedUsages?: readonly SymbolUsageType[], currentFileOnly?: boolean): Promise<SymbolLocations | undefined>;
}
export {};
//# sourceMappingURL=Service.d.ts.map