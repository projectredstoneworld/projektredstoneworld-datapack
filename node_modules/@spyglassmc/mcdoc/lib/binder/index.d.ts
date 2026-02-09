import type { BinderContext, MetaRegistry } from '@spyglassmc/core';
import { AsyncBinder } from '@spyglassmc/core';
import type { ModuleNode } from '../node/index.js';
import type { SimplifiedMcdocType } from '../runtime/checker/index.js';
import type { McdocType } from '../type/index.js';
interface McdocBinderContext extends BinderContext {
    moduleIdentifier: string;
    isHoisting?: boolean;
}
export interface TypeDefSymbolData {
    typeDef: McdocType;
    simplifiedTypeDef?: SimplifiedMcdocType;
}
export declare namespace TypeDefSymbolData {
    function is(data: unknown): data is TypeDefSymbolData;
}
export declare const fileModule: AsyncBinder<ModuleNode>;
export declare function module_(node: ModuleNode, ctx: McdocBinderContext): Promise<void>;
export declare function registerMcdocBinders(meta: MetaRegistry): void;
export {};
//# sourceMappingURL=index.d.ts.map