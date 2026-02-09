import { Lazy } from '../common/index.js';
import { binder, checker, codeActions, colorizer, completer, formatter, linter, } from '../processor/index.js';
/* istanbul ignore next */
/**
 * The meta registry of Spyglass. You can register new parsers, processors, and languages here.
 */
export class MetaRegistry {
    /**
     * A map from language IDs to language options.
     */
    #languages = new Map();
    #binders = new Map();
    #checkers = new Map();
    #colorizers = new Map();
    #codeActionProviders = new Map();
    #completers = new Map();
    #dependencyProviders = new Map();
    #formatters = new Map();
    #inlayHintProviders = new Set();
    #linters = new Map();
    #parsers = new Map();
    #signatureHelpProviders = new Set();
    #symbolRegistrars = new Map();
    #custom = new Map();
    #uriBinders = new Set();
    #uriBuilders = new Map();
    #uriSorter = () => 0;
    constructor() {
        binder.registerBinders(this);
        checker.registerCheckers(this);
        codeActions.registerProviders(this);
        colorizer.registerColorizers(this);
        completer.registerCompleters(this);
        formatter.registerFormatters(this);
        linter.registerLinters(this);
    }
    /**
     * Registers a new language.
     * @param languageID The language ID. e.g. `"mcfunction"`
     * @param options The language options for this language.
     */
    registerLanguage(languageID, options) {
        this.#languages.set(languageID, options);
    }
    /**
     * An array of all registered language IDs.
     */
    getLanguages() {
        return Array.from(this.#languages.keys());
    }
    getLanguageOptions(language) {
        return this.#languages.get(language);
    }
    /**
     * An array of characters that trigger a completion request.
     */
    getTriggerCharacters() {
        return Array.from(this.#languages.values()).flatMap((v) => v.triggerCharacters ?? []);
    }
    /**
     * @param fileExtension The file extension including the leading dot. e.g. `".mcfunction"`.
     * @returns The language ID registered for the file extension, or `undefined`.
     */
    getLanguageID(fileExtension) {
        for (const [languageID, { extensions }] of this.#languages) {
            if (extensions.includes(fileExtension)) {
                return languageID;
            }
        }
        return undefined;
    }
    hasBinder(type) {
        return this.#binders.has(type);
    }
    getBinder(type) {
        return this.#binders.get(type) ?? binder.fallback;
    }
    registerBinder(type, binder) {
        this.#binders.set(type, binder);
    }
    hasChecker(type) {
        return this.#checkers.has(type);
    }
    getChecker(type) {
        return this.#checkers.get(type) ?? checker.fallback;
    }
    registerChecker(type, checker) {
        this.#checkers.set(type, checker);
    }
    hasCodeActionProvider(type) {
        return this.#codeActionProviders.has(type);
    }
    getCodeActionProvider(type) {
        return this.#codeActionProviders.get(type) ?? codeActions.fallback;
    }
    registerCodeActionProvider(type, codeActionProvider) {
        this.#codeActionProviders.set(type, codeActionProvider);
    }
    hasColorizer(type) {
        return this.#colorizers.has(type);
    }
    getColorizer(type) {
        return this.#colorizers.get(type) ?? colorizer.fallback;
    }
    registerColorizer(type, colorizer) {
        this.#colorizers.set(type, colorizer);
    }
    hasCompleter(type) {
        return this.#completers.has(type);
    }
    getCompleter(type) {
        return this.#completers.get(type) ?? completer.fallback;
    }
    registerCompleter(type, completer) {
        this.#completers.set(type, completer);
    }
    shouldComplete(languageID, triggerCharacter) {
        const language = this.#languages.get(languageID);
        return (!triggerCharacter || !!language?.triggerCharacters?.includes(triggerCharacter));
    }
    getCompleterForLanguageID(languageID) {
        return this.#languages.get(languageID)?.completer ?? completer.fallback;
    }
    getDependencyProvider(key) {
        return this.#dependencyProviders.get(key);
    }
    registerDependencyProvider(key, provider) {
        this.#dependencyProviders.set(key, provider);
    }
    hasFormatter(type) {
        return this.#formatters.has(type);
    }
    getFormatter(type) {
        return this.#formatters.get(type) ?? formatter.fallback;
    }
    registerFormatter(type, formatter) {
        this.#formatters.set(type, formatter);
    }
    registerInlayHintProvider(provider) {
        this.#inlayHintProviders.add(provider);
    }
    get inlayHintProviders() {
        return this.#inlayHintProviders;
    }
    getLinter(ruleName) {
        return (this.#linters.get(ruleName)
            ?? { configValidator: () => false, linter: linter.noop, nodePredicate: () => false });
    }
    registerLinter(ruleName, options) {
        this.#linters.set(ruleName, options);
    }
    hasParser(id) {
        return this.#parsers.has(id);
    }
    getParser(id) {
        const ans = this.#parsers.get(id);
        if (!ans) {
            throw new Error(`There is no parser '${id}'`);
        }
        return ans;
    }
    getParserLazily(id) {
        return Lazy.create(() => this.getParser(id));
    }
    registerParser(id, parser) {
        this.#parsers.set(id, parser);
    }
    /**
     * @returns The corresponding `Parser` for the language ID.
     * @throws If there's no such language in the registry.
     */
    getParserForLanguageId(languageID) {
        if (this.#languages.has(languageID)) {
            return this.#languages.get(languageID).parser;
        }
        throw new Error(`There is no parser registered for language ID '${languageID}'`);
    }
    registerSignatureHelpProvider(provider) {
        this.#signatureHelpProviders.add(provider);
    }
    get signatureHelpProviders() {
        return this.#signatureHelpProviders;
    }
    registerSymbolRegistrar(id, registrar) {
        this.#symbolRegistrars.set(id, registrar);
    }
    get symbolRegistrars() {
        return this.#symbolRegistrars;
    }
    registerCustom(group, id, object) {
        let groupRegistry = this.#custom.get(group);
        if (!groupRegistry) {
            groupRegistry = new Map();
            this.#custom.set(group, groupRegistry);
        }
        groupRegistry.set(id, object);
    }
    getCustom(group) {
        return this.#custom.get(group);
    }
    registerUriBinder(uriBinder) {
        this.#uriBinders.add(uriBinder);
    }
    get uriBinders() {
        return this.#uriBinders;
    }
    hasUriBuilder(category) {
        return this.#uriBuilders.has(category);
    }
    getUriBuilder(category) {
        return this.#uriBuilders.get(category);
    }
    registerUriBuilder(category, builder) {
        this.#uriBuilders.set(category, builder);
    }
    setUriSorter(uriSorter) {
        const nextSorter = this.#uriSorter;
        this.#uriSorter = (a, b) => uriSorter(a, b, nextSorter);
    }
    get uriSorter() {
        return this.#uriSorter;
    }
}
//# sourceMappingURL=MetaRegistry.js.map