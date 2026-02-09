import type { TextDocument } from 'vscode-languageserver-textdocument';
import type { Location } from './Location.js';
import { PositionRange } from './PositionRange.js';
import type { Range } from './Range.js';
export interface LanguageErrorData {
    message: string;
    severity: ErrorSeverity;
    info?: LanguageErrorInfo;
    source?: string;
}
export interface LanguageError extends LanguageErrorData {
    range: Range;
}
/**
 * A language error that uses {@link PositionRange} instead of {@link Range} to represent the span of the error.
 */
export interface PosRangeLanguageError extends LanguageErrorData {
    posRange: PositionRange;
}
export declare namespace LanguageError {
    function create(message: string, range: Range, severity?: ErrorSeverity, info?: LanguageErrorInfo, source?: string): LanguageError;
    /**
     * @returns A {@link PosRangeLanguageError}.
     */
    function withPosRange(error: LanguageError, doc: TextDocument): PosRangeLanguageError;
}
export declare enum ErrorSeverity {
    Hint = 0,
    Information = 1,
    Warning = 2,
    Error = 3
}
export interface LanguageErrorInfo {
    codeAction?: LanguageErrorAction;
    deprecated?: boolean;
    unnecessary?: boolean;
    related?: {
        location: Location;
        message: string;
    }[];
}
export interface LanguageErrorAction {
    title: string;
    isPreferred?: boolean;
    changes?: CodeActionChange[];
}
export type CodeActionChange = {
    type: 'edit';
    range: Range;
    text: string;
} | {
    type: 'create';
    uri: string;
};
//# sourceMappingURL=LanguageError.d.ts.map