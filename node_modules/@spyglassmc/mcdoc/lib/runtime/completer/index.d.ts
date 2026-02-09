import type * as core from '@spyglassmc/core';
import type { McdocType, StructTypePairField } from '../../type/index.js';
import type { SimplifiedMcdocType } from '../checker/index.js';
export type SimpleCompletionField = {
    key: string;
    field: core.DeepReadonly<StructTypePairField>;
};
export interface McdocCompleterContext extends core.CompleterContext {
    requireCanonical?: boolean;
}
export declare function getFields(typeDef: core.DeepReadonly<SimplifiedMcdocType>, ctx: McdocCompleterContext): SimpleCompletionField[];
export type SimpleCompletionValue = {
    value: string;
    detail?: string;
    documentation?: string;
    labelSuffix?: string;
    kind?: McdocType['kind'];
    completionKind?: core.CompletionKind;
    insertText?: string;
    sortText?: string;
};
export declare function getValues(typeDef: core.DeepReadonly<McdocType>, ctx: McdocCompleterContext): SimpleCompletionValue[];
//# sourceMappingURL=index.d.ts.map