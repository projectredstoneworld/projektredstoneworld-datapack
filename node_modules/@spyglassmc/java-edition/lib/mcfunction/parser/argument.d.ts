import * as core from '@spyglassmc/core';
import * as json from '@spyglassmc/json';
import * as mcf from '@spyglassmc/mcfunction';
import * as nbt from '@spyglassmc/nbt';
import type { BlockNode, EntityNode, ParticleNode, ScoreHolderNode, UuidNode } from '../node/index.js';
import { EntitySelectorNode } from '../node/index.js';
/**
 * @returns The parser for the specified argument tree node. All argument parsers used in the `mcfunction` package
 * fail on empty input.
 */
export declare const argument: mcf.ArgumentParserGetter;
export declare const blockPredicate: core.InfallibleParser<BlockNode>;
export declare function criterion(advancement: core.FullResourceLocation, usageType?: core.SymbolUsageType, terminators?: string[]): core.InfallibleParser<core.SymbolNode>;
export declare function entity(amount: 'multiple' | 'single', type: 'entities' | 'players'): core.Parser<EntityNode>;
export declare function typeRefParser(typeRef: `::${string}::${string}`): core.Parser<json.TypedJsonNode | nbt.TypedNbtNode>;
export declare function jsonParser(typeRef: `::${string}::${string}`): core.Parser<json.TypedJsonNode>;
export declare function nbtParser(typeRef: `::${string}::${string}`): core.Parser<nbt.TypedNbtNode>;
export declare const particle: core.InfallibleParser<ParticleNode>;
/**
 * Failure when not beginning with `@[parse]`
 */
export declare function selector(ignoreInvalidPrefix?: boolean): core.Parser<EntitySelectorNode>;
export declare function scoreHolderFakeName(usageType: core.SymbolUsageType): core.Parser<core.SymbolNode>;
export declare function scoreHolder(usageType: core.SymbolUsageType, amount: 'multiple' | 'single'): core.Parser<ScoreHolderNode>;
export declare function objective(usageType?: core.SymbolUsageType, terminators?: string[]): core.InfallibleParser<core.SymbolNode>;
export declare function tag(usageType?: core.SymbolUsageType, terminators?: string[]): core.InfallibleParser<core.SymbolNode>;
export declare function team(usageType?: core.SymbolUsageType, terminators?: string[]): core.InfallibleParser<core.SymbolNode>;
export declare const uuid: core.InfallibleParser<UuidNode>;
//# sourceMappingURL=argument.d.ts.map