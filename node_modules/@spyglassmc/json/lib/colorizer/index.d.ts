import type { Colorizer, MetaRegistry } from '@spyglassmc/core';
import type { JsonBooleanNode, JsonNullNode, JsonObjectNode, JsonStringNode } from '../node/index.js';
export declare const boolean: Colorizer<JsonBooleanNode>;
export declare const null_: Colorizer<JsonNullNode>;
export declare const object: Colorizer<JsonObjectNode>;
export declare const string: Colorizer<JsonStringNode>;
export declare function register(meta: MetaRegistry): void;
//# sourceMappingURL=index.d.ts.map