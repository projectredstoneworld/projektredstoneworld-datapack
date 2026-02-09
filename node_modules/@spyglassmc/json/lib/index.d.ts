import type * as core from '@spyglassmc/core';
export * as checker from './checker/index.js';
export * as colorizer from './colorizer/index.js';
export * as completer from './completer/index.js';
export * as formatter from './formatter/index.js';
export * from './node/index.js';
export * as parser from './parser/index.js';
/**
 * @param jsonUriPredicate If provided, JSON file URIs must pass this predicate for them to be of
 * proper `json` language.
 */
export declare function getInitializer(jsonUriPredicate?: core.UriPredicate): core.SyncProjectInitializer;
//# sourceMappingURL=index.d.ts.map