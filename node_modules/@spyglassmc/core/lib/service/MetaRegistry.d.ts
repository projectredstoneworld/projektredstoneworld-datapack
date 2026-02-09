import type { Logger } from '../common/index.js';
import { Lazy } from '../common/index.js';
import type { AstNode } from '../node/index.js';
import type { Parser } from '../parser/index.js';
import type { Formatter } from '../processor/formatter/index.js';
import type { Binder, Checker, CodeActionProvider, Colorizer, Completer, InlayHintProvider } from '../processor/index.js';
import type { Linter } from '../processor/linter/Linter.js';
import type { SignatureHelpProvider } from '../processor/SignatureHelpProvider.js';
import type { UriPredicateContext } from '../service/index.js';
import type { DependencyKey, DependencyProvider } from './Dependency.js';
import type { FileExtension } from './fileUtil.js';
import type { SymbolRegistrar } from './SymbolRegistrar.js';
import type { UriBuilder } from './UriBuilder.js';
import type { UriBinder, UriSorter, UriSorterRegistration } from './UriProcessor.js';
export interface LanguageOptions {
    /**
     * An array of extensions of files corresponding to the language. Each extension should include the leading dot (`.`).
     */
    extensions: FileExtension[];
    /**
     * If specified, the URI of the file must pass the predicate for it to be considered to be a file
     * of this language.
     */
    uriPredicate?: UriPredicate;
    triggerCharacters?: string[];
    parser?: Parser<AstNode>;
    completer?: Completer<any>;
}
export type UriPredicate = (uri: string, ctx: UriPredicateContext) => boolean;
interface LinterRegistration {
    configValidator: (ruleName: string, ruleValue: unknown, logger: Logger) => unknown;
    linter: Linter<AstNode>;
    nodePredicate: (node: AstNode) => unknown;
}
interface SymbolRegistrarRegistration {
    registrar: SymbolRegistrar;
    /**
     * A checksum associated with this symbol registrar.
     * If the cached checksum is equal to this provided checksum,
     * the symbol registrar is not executed.
     */
    checksum: string | undefined;
}
/**
 * The meta registry of Spyglass. You can register new parsers, processors, and languages here.
 */
export declare class MetaRegistry {
    #private;
    constructor();
    /**
     * Registers a new language.
     * @param languageID The language ID. e.g. `"mcfunction"`
     * @param options The language options for this language.
     */
    registerLanguage(languageID: string, options: LanguageOptions): void;
    /**
     * An array of all registered language IDs.
     */
    getLanguages(): string[];
    getLanguageOptions(language: string): LanguageOptions | undefined;
    /**
     * An array of characters that trigger a completion request.
     */
    getTriggerCharacters(): string[];
    /**
     * @param fileExtension The file extension including the leading dot. e.g. `".mcfunction"`.
     * @returns The language ID registered for the file extension, or `undefined`.
     */
    getLanguageID(fileExtension: FileExtension): string | undefined;
    hasBinder<N extends AstNode>(type: N['type']): boolean;
    getBinder<N extends AstNode>(type: N['type']): Binder<N>;
    registerBinder<N extends AstNode>(type: N['type'], binder: Binder<N>): void;
    hasChecker<N extends AstNode>(type: N['type']): boolean;
    getChecker<N extends AstNode>(type: N['type']): Checker<N>;
    registerChecker<N extends AstNode>(type: N['type'], checker: Checker<N>): void;
    hasCodeActionProvider<N extends AstNode>(type: N['type']): boolean;
    getCodeActionProvider<N extends AstNode>(type: N['type']): CodeActionProvider<N>;
    registerCodeActionProvider<N extends AstNode>(type: N['type'], codeActionProvider: CodeActionProvider<N>): void;
    hasColorizer<N extends AstNode>(type: N['type']): boolean;
    getColorizer<N extends AstNode>(type: N['type']): Colorizer<N>;
    registerColorizer<N extends AstNode>(type: N['type'], colorizer: Colorizer<N>): void;
    hasCompleter<N extends AstNode>(type: N['type']): boolean;
    getCompleter<N extends AstNode>(type: N['type']): Completer<N>;
    registerCompleter<N extends AstNode>(type: N['type'], completer: Completer<N>): void;
    registerCompleter(type: string, completer: Completer<any>): void;
    shouldComplete(languageID: string, triggerCharacter?: string): boolean;
    getCompleterForLanguageID(languageID: string): Completer<any>;
    getDependencyProvider(key: DependencyKey): DependencyProvider | undefined;
    registerDependencyProvider(key: DependencyKey, provider: DependencyProvider): void;
    hasFormatter<N extends AstNode>(type: N['type']): boolean;
    getFormatter<N extends AstNode>(type: N['type']): Formatter<N>;
    registerFormatter<N extends AstNode>(type: N['type'], formatter: Formatter<N>): void;
    registerInlayHintProvider(provider: InlayHintProvider<any>): void;
    get inlayHintProviders(): Set<InlayHintProvider<any>>;
    getLinter(ruleName: string): LinterRegistration;
    registerLinter(ruleName: string, options: LinterRegistration): void;
    hasParser<N extends AstNode>(id: N['type']): boolean;
    hasParser(id: string): boolean;
    /**
     * @throws When no parser is registered for the node type.
     */
    getParser<N extends AstNode>(id: N['type']): Parser<N>;
    getParser<N extends AstNode>(id: string): Parser<N>;
    getParserLazily<N extends AstNode>(id: N['type']): Lazy.UnresolvedLazy<Parser<N>>;
    getParserLazily<N extends AstNode>(id: string): Lazy.UnresolvedLazy<Parser<N>>;
    registerParser<N extends AstNode>(id: N['type'], parser: Parser<N>): void;
    registerParser(id: string, parser: Parser): void;
    /**
     * @returns The corresponding `Parser` for the language ID.
     * @throws If there's no such language in the registry.
     */
    getParserForLanguageId<N extends AstNode>(languageID: string): Parser<N> | undefined;
    registerSignatureHelpProvider(provider: SignatureHelpProvider<any>): void;
    get signatureHelpProviders(): Set<SignatureHelpProvider<any>>;
    registerSymbolRegistrar(id: string, registrar: SymbolRegistrarRegistration): void;
    get symbolRegistrars(): Map<string, SymbolRegistrarRegistration>;
    registerCustom<T>(group: string, id: string, object: T): void;
    getCustom<T>(group: string): Map<string, T> | undefined;
    registerUriBinder(uriBinder: UriBinder): void;
    get uriBinders(): Set<UriBinder>;
    hasUriBuilder(category: string): boolean;
    getUriBuilder(category: string): UriBuilder | undefined;
    registerUriBuilder(category: string, builder: UriBuilder): void;
    setUriSorter(uriSorter: UriSorterRegistration): void;
    get uriSorter(): UriSorter;
}
export {};
//# sourceMappingURL=MetaRegistry.d.ts.map