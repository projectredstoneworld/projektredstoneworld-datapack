import * as core from '@spyglassmc/core';
import * as mcdoc from '@spyglassmc/mcdoc';
import type { JsonNode, TypedJsonNode } from '../node/index.js';
export declare const typed: core.SyncChecker<TypedJsonNode>;
export declare function register(meta: core.MetaRegistry): void;
export interface JsonCheckerOptions {
    discardDuplicateKeyErrors?: true;
}
export declare function index(type: mcdoc.McdocType, options?: JsonCheckerOptions): core.SyncChecker<JsonNode>;
//# sourceMappingURL=index.d.ts.map