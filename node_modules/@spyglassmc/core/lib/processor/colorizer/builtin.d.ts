import type { LiteralBaseNode, ResourceLocationBaseNode, StringBaseNode, SymbolBaseNode } from '../../node/index.js';
import type { MetaRegistry } from '../../service/index.js';
import type { Colorizer } from './Colorizer.js';
/**
 * Use the shallowest children that have their own colorizers to provide the color tokens.
 */
export declare const fallback: Colorizer;
export declare const boolean: Colorizer;
export declare const comment: Colorizer;
export declare const error: Colorizer;
export declare const literal: Colorizer<LiteralBaseNode>;
export declare const number: Colorizer;
export declare const resourceLocation: Colorizer<ResourceLocationBaseNode>;
export declare const string: Colorizer<StringBaseNode>;
export declare const symbol: Colorizer<SymbolBaseNode>;
export declare function registerColorizers(meta: MetaRegistry): void;
//# sourceMappingURL=builtin.d.ts.map