import * as core from '@spyglassmc/core';
import type { Attribute, McdocType, StructTypePairField, UnionType } from '../../type/index.js';
import type { McdocCheckerContext, SimplifiedMcdocType, SimplifiedMcdocTypeNoUnion } from '../checker/index.js';
import type { McdocCompleterContext } from '../completer/index.js';
import type { McdocAttributeValidator } from './validator.js';
export * as validator from './validator.js';
export interface McdocAttribute<C = unknown> {
    checkInferred?: <T>(config: C, inferred: SimplifiedMcdocTypeNoUnion, ctx: McdocCheckerContext<T>) => boolean;
    mapType?: <T>(config: C, typeDef: SimplifiedMcdocType, ctx: McdocCheckerContext<T>) => SimplifiedMcdocType;
    mapField?: <T>(config: C, field: StructTypePairField, ctx: McdocCheckerContext<T>) => StructTypePairField;
    filterElement?: (config: C, ctx: core.ContextBase) => boolean;
    stringParser?: <T>(config: C, typeDef: SimplifiedMcdocTypeNoUnion, ctx: McdocCheckerContext<T>) => core.InfallibleParser<core.AstNode | undefined> | undefined;
    checker?: <T>(config: C, inferred: Exclude<McdocType, UnionType>, ctx: McdocCheckerContext<T>) => core.SyncChecker<core.AstNode> | undefined;
    stringMocker?: (config: C, typeDef: core.DeepReadonly<SimplifiedMcdocTypeNoUnion>, ctx: McdocCompleterContext) => core.AstNode | undefined;
    numericCompleter?: (config: C, ctx: McdocCompleterContext) => core.CompletionItem[];
}
export declare function registerAttribute<C extends core.Returnable>(meta: core.MetaRegistry, name: string, validator: McdocAttributeValidator<C>, attribute: McdocAttribute<C>): void;
interface AttributeInfo {
    validator: McdocAttributeValidator<core.Returnable>;
    attribute: McdocAttribute;
}
export declare function getAttribute(meta: core.MetaRegistry, name: string): AttributeInfo | undefined;
export declare function handleAttributes(attributes: core.DeepReadonly<Attribute[]> | undefined, ctx: core.ContextBase, fn: <C>(handler: McdocAttribute<C>, config: C) => void): void;
export declare function shouldKeepAccordingToAttributeFilters(attributes: core.DeepReadonly<Attribute[]> | undefined, ctx: core.ContextBase): boolean;
//# sourceMappingURL=index.d.ts.map