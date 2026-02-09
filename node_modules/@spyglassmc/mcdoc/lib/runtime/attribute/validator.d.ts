import * as core from '@spyglassmc/core';
import type { AttributeValue } from '../../type/index.js';
export type McdocAttributeValidator<C extends core.Returnable> = (value: core.DeepReadonly<AttributeValue> | undefined, ctx: core.ContextBase) => core.Result<C>;
export declare const string: McdocAttributeValidator<string>;
export declare const number: McdocAttributeValidator<number>;
export declare const boolean: McdocAttributeValidator<boolean>;
export declare function options<C extends string>(...options: C[]): McdocAttributeValidator<C>;
export declare function tree<C extends {
    [K in keyof C]: core.Returnable;
}>(properties: {
    [K in keyof C]: McdocAttributeValidator<C[K]>;
}): McdocAttributeValidator<C>;
export declare function list<C extends core.Returnable>(itemValidator: McdocAttributeValidator<C>): McdocAttributeValidator<C[]>;
export declare function optional<C extends core.Returnable>(validator: McdocAttributeValidator<C>): McdocAttributeValidator<C | undefined>;
export declare function map<C extends core.Returnable, D extends core.Returnable>(validator: McdocAttributeValidator<C>, mapper: (value: C) => D | typeof core.Failure): McdocAttributeValidator<D>;
export declare function alternatives<C extends core.Returnable>(...validators: McdocAttributeValidator<C>[]): McdocAttributeValidator<C>;
//# sourceMappingURL=validator.d.ts.map