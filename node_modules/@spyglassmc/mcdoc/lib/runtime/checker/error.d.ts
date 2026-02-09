import type { AstNode, CheckerContext, Range } from '@spyglassmc/core';
import { NumericRange } from '../../type/index.js';
import type { CheckerTreeDefinitionGroupNode, CheckerTreeDefinitionNode, ErrorReporter, RuntimeNode, SimplifiedMcdocTypeNoUnion } from './index.js';
export type McdocRuntimeError<T> = SimpleError<T> | UnknownKeyError<T> | RangeError<T> | TypeMismatchError<T> | MissingKeyError<T>;
export interface McdocRuntimeBaseError<T> {
    node: RuntimeNode<T>;
    /**
     * This is set when this error may not need to be fixed if another error of the same kind is
     * fixed instead. This contains a list of nodes with conflicting
     */
    nodesWithConflictingErrors?: RuntimeNode<T>[];
}
export interface SimpleError<T> extends McdocRuntimeBaseError<T> {
    kind: 'duplicate_key' | 'unknown_key' | 'expected_key_value_pair' | 'unknown_tuple_element' | 'internal';
}
export declare namespace SimpleError {
    function is<T>(error: McdocRuntimeError<T> | undefined): error is SimpleError<T>;
}
export interface UnknownKeyError<T> extends McdocRuntimeBaseError<T> {
    kind: 'unknown_key';
}
export declare namespace UnknownKeyError {
    function is<T>(error: McdocRuntimeError<T> | undefined): error is UnknownKeyError<T>;
}
export interface RangeError<T> extends McdocRuntimeBaseError<T> {
    kind: 'invalid_collection_length' | 'invalid_string_length' | 'number_out_of_range';
    /**
     * A list of multiple mean the number (or length) has to be within one of these ranges. This is
     * a result of merging errors from two conflicting definitions for the same value.
     */
    ranges: NumericRange[];
}
export declare namespace RangeError {
    function is<T>(error: McdocRuntimeError<T> | undefined): error is RangeError<T>;
}
export interface MissingKeyError<T> extends McdocRuntimeBaseError<T> {
    kind: 'missing_key';
    /**
     * A list of multiple are an alternative, and at least on e needs to be fixed, not neccessarily
     * all of them.
     *
     * In case there are multiple non-conflicting missing keys, multiple errors will be reported on
     * the same node instead.
     *
     * If this has a length > 1, there is at least one error that needs to be fixed, and at least one
     * error that does not neccassarily need to be fixed.
     */
    keys: string[];
}
export declare namespace MissingKeyError {
    function is<T>(error: McdocRuntimeError<T> | undefined): error is MissingKeyError<T>;
}
export interface TypeMismatchError<T> extends McdocRuntimeBaseError<T> {
    kind: 'type_mismatch';
    /**
     * These are all valid definitions. The node needs to only fullfill one of them.
     */
    expected: SimplifiedMcdocTypeNoUnion[];
}
export declare namespace TypeMismatchError {
    function is<T>(error: McdocRuntimeError<T> | undefined): error is TypeMismatchError<T>;
}
export interface ErrorCondensingDefinition<T> {
    definition: CheckerTreeDefinitionNode<T>;
    errors: McdocRuntimeError<T>[];
}
export declare function condenseAndPropagate<T>(definitionGroup: CheckerTreeDefinitionGroupNode<T>, definitionErrors: ErrorCondensingDefinition<T>[]): void;
export declare function getDefaultErrorRange<T extends AstNode>(node: RuntimeNode<T>, error: McdocRuntimeError<T>['kind']): Range;
export declare function getDefaultErrorReporter<T>(ctx: CheckerContext, getErrorRange: (node: RuntimeNode<T>, error: McdocRuntimeError<T>['kind']) => Range): ErrorReporter<T>;
//# sourceMappingURL=error.d.ts.map