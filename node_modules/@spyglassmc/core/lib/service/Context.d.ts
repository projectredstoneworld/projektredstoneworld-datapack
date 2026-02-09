import type { TextDocument } from 'vscode-languageserver-textdocument';
import type { Logger } from '../common/index.js';
import type { Range } from '../source/index.js';
import { ReadonlySource } from '../source/index.js';
import type { SymbolUtil } from '../symbol/index.js';
import type { Config } from './Config.js';
import { ErrorReporter } from './ErrorReporter.js';
import type { FileService } from './FileService.js';
import type { RootUriString } from './fileUtil.js';
import type { LinterErrorReporter } from './index.js';
import type { MetaRegistry } from './MetaRegistry.js';
import type { ProfilerFactory } from './Profiler.js';
import type { ProjectData } from './Project.js';
export interface ContextBase {
    fs: FileService;
    isDebugging: boolean;
    logger: Logger;
    meta: MetaRegistry;
    profilers: ProfilerFactory;
    project: Record<string, string>;
    roots: readonly RootUriString[];
}
export declare namespace ContextBase {
    function create(project: ProjectData): ContextBase;
}
export interface ParserContext extends ContextBase {
    config: Config;
    doc: TextDocument;
    err: ErrorReporter;
}
interface ParserContextOptions {
    doc: TextDocument;
    err?: ErrorReporter;
}
export declare namespace ParserContext {
    function create(project: ProjectData, opts: ParserContextOptions): ParserContext;
}
export interface ProcessorContext extends ContextBase {
    config: Config;
    doc: TextDocument;
    src: ReadonlySource;
    symbols: SymbolUtil;
}
interface ProcessorContextOptions {
    doc: TextDocument;
    src?: ReadonlySource;
}
export declare namespace ProcessorContext {
    function create(project: ProjectData, opts: ProcessorContextOptions): ProcessorContext;
}
interface ProcessorWithRangeContext extends ProcessorContext {
    range?: Range;
}
interface ProcessorWithRangeContextOptions extends ProcessorContextOptions {
    range?: Range;
}
declare namespace ProcessorWithRangeContext {
    function create(project: ProjectData, opts: ProcessorWithRangeContextOptions): ProcessorWithRangeContext;
}
interface ProcessorWithOffsetContext extends ProcessorContext {
    offset: number;
}
interface ProcessorWithOffsetContextOptions extends ProcessorContextOptions {
    offset: number;
}
declare namespace ProcessorWithOffsetContext {
    function create(project: ProjectData, opts: ProcessorWithOffsetContextOptions): ProcessorWithOffsetContext;
}
export interface BinderContext extends ProcessorContext {
    err: ErrorReporter;
    ensureBindingStarted: (this: void, uri: string) => Promise<unknown>;
}
interface BinderContextOptions extends ProcessorContextOptions {
    err?: ErrorReporter;
}
export declare namespace BinderContext {
    function create(project: ProjectData, opts: BinderContextOptions): BinderContext;
}
export interface CheckerContext extends ProcessorContext {
    err: ErrorReporter;
    ensureBindingStarted: (this: void, uri: string) => Promise<unknown>;
}
interface CheckerContextOptions extends ProcessorContextOptions {
    err?: ErrorReporter;
}
export declare namespace CheckerContext {
    function create(project: ProjectData, opts: CheckerContextOptions): CheckerContext;
}
export interface LinterContext extends ProcessorContext {
    err: LinterErrorReporter;
    ruleName: string;
    ruleValue: unknown;
}
interface LinterContextOptions extends ProcessorContextOptions {
    err: LinterErrorReporter;
    ruleName: string;
    ruleValue: unknown;
}
export declare namespace LinterContext {
    function create(project: ProjectData, opts: LinterContextOptions): LinterContext;
}
export interface FormatterContext extends ProcessorContext {
    tabSize: number;
    insertSpaces: boolean;
    indentLevel: number;
    indent: (additionalLevels?: number) => string;
}
interface FormatterContextOptions extends ProcessorContextOptions {
    tabSize: number;
    insertSpaces: boolean;
}
export declare namespace FormatterContext {
    function create(project: ProjectData, opts: FormatterContextOptions): FormatterContext;
}
export interface CodeActionProviderContext extends ProcessorContext {
    range: Range;
}
export interface CodeActionProviderContextOptions extends ProcessorContextOptions {
    range: Range;
}
export declare namespace CodeActionProviderContext {
    function create(project: ProjectData, opts: CodeActionProviderContextOptions): CodeActionProviderContext;
}
export interface ColorizerContext extends ProcessorWithRangeContext {
}
export interface ColorizerContextOptions extends ProcessorWithRangeContextOptions {
}
export declare namespace ColorizerContext {
    function create(project: ProjectData, opts: ColorizerContextOptions): ColorizerContext;
}
export interface CompleterContext extends ProcessorContext {
    offset: number;
    triggerCharacter?: string;
}
interface CompleterContextOptions extends ProcessorContextOptions {
    offset: number;
    triggerCharacter?: string;
}
export declare namespace CompleterContext {
    function create(project: ProjectData, opts: CompleterContextOptions): CompleterContext;
}
export interface SignatureHelpProviderContext extends ProcessorWithOffsetContext {
}
export interface SignatureHelpProviderContextOptions extends ProcessorWithOffsetContextOptions {
}
export declare namespace SignatureHelpProviderContext {
    function create(project: ProjectData, opts: SignatureHelpProviderContextOptions): SignatureHelpProviderContext;
}
export interface UriBinderContext extends ContextBase {
    config: Config;
    symbols: SymbolUtil;
}
export declare namespace UriBinderContext {
    function create(project: ProjectData): UriBinderContext;
}
export interface UriPredicateContext extends ContextBase {
}
export declare namespace UriPredicateContext {
    function create(project: ProjectData): UriPredicateContext;
}
export {};
//# sourceMappingURL=Context.d.ts.map