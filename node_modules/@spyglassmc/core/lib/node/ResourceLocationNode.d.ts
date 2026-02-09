import type { DeepReadonly, FullResourceLocation } from '../common/index.js';
import { ResourceLocation } from '../common/index.js';
import type { RangeLike } from '../source/index.js';
import type { ResourceLocationCategory, SymbolAccessType, SymbolUsageType, TaggableResourceLocationCategory } from '../symbol/index.js';
import type { AstNode } from './AstNode.js';
export type ResourceLocationOptions = {
    accessType?: SymbolAccessType;
    requireCanonical?: boolean;
    usageType?: SymbolUsageType;
    namespacePathSep?: ':' | '.';
    implicitPath?: string;
} & ({
    category: ResourceLocationCategory;
    pool?: undefined;
    allowTag?: false;
    requireTag?: false;
    allowUnknown?: false;
} | {
    category: TaggableResourceLocationCategory;
    pool?: undefined;
    allowTag?: boolean;
    requireTag?: boolean;
    allowUnknown?: false;
} | {
    category?: undefined;
    pool: string[];
    allowTag?: false;
    requireTag?: false;
    allowUnknown?: boolean;
});
export interface ResourceLocationBaseNode extends AstNode, Partial<ResourceLocation> {
    readonly options: ResourceLocationOptions;
}
export interface ResourceLocationNode extends ResourceLocationBaseNode {
    readonly type: 'resource_location';
}
export declare namespace ResourceLocationNode {
    function is(obj: AstNode | undefined): obj is ResourceLocationNode;
    function mock(range: RangeLike, options: ResourceLocationOptions): ResourceLocationNode;
    function toString(node: DeepReadonly<ResourceLocationBaseNode>, type?: 'full', includesTagPrefix?: false): FullResourceLocation;
    function toString(node: DeepReadonly<ResourceLocationBaseNode>, type?: 'origin' | 'full' | 'short', includesTagPrefix?: boolean): string;
}
//# sourceMappingURL=ResourceLocationNode.d.ts.map