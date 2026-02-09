import * as core from '@spyglassmc/core';
import * as mcdoc from '@spyglassmc/mcdoc';
import type { NbtPathNode, TypedNbtNode } from '../node/index.js';
import { NbtNode } from '../node/index.js';
export declare const typed: core.SyncChecker<TypedNbtNode>;
export declare function register(meta: core.MetaRegistry): void;
interface Options {
    isPredicate?: boolean;
    isMerge?: boolean;
}
/**
 * @param id If the registry is under the `custom` namespace, `id` can only be a string. Otherwise it can be a string, string array, or `undefined`.
 * If set to `undefined` or an empty array, all mcdoc compound definitions for this registry will be merged for checking, and unknown keys are allowed.
 */
export declare function index(registry: core.FullResourceLocation, id?: core.FullResourceLocation | readonly core.FullResourceLocation[] | undefined, options?: Options): core.SyncChecker<NbtNode>;
/**
 * @param identifier An identifier of mcdoc compound definition. e.g. `::minecraft::util::invitem::InventoryItem`
 */
export declare function typeDefinition(typeDef: mcdoc.McdocType, options?: Options): core.SyncChecker<NbtNode>;
export declare function blockStates(blocks: string[], _options?: Options): core.SyncChecker<NbtNode>;
export declare function path(registry: core.FullResourceLocation, id: core.FullResourceLocation | readonly core.FullResourceLocation[] | undefined): core.SyncChecker<NbtPathNode>;
export {};
//# sourceMappingURL=index.d.ts.map