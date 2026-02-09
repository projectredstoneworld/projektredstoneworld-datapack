import type { TextDocument } from 'vscode-languageserver-textdocument';
import { Position } from './Position.js';
import type { RangeLike } from './Range.js';
export interface PositionRange {
    start: Position;
    end: Position;
}
export declare namespace PositionRange {
    function create(startLine: number, startCharacter: number, endLine: number, endCharacter: number): PositionRange;
    function create(start: Position, end: Position): PositionRange;
    function create(partial: Partial<PositionRange>): PositionRange;
    /**
     * @returns A `PositionRange` converted from a `RangeLike`.
     */
    function from(rangeLike: RangeLike, doc: TextDocument): PositionRange;
    /**
     * ```typescript
     * {
     * 	start: { line: 0, character: 0 },
     * 	end: { line: 0, character: 1 }
     * }
     * ```
     */
    const Beginning: Readonly<PositionRange>;
    /**
     * ```typescript
     * {
     * 	start: { line: 0, character: 0 },
     * 	end: { line: Infinity, character: Infinity }
     * }
     * ```
     */
    const Full: Readonly<PositionRange>;
    function toString(range: PositionRange): string;
    function contains(range: PositionRange, pos: Position): boolean;
    function endsBefore(range: PositionRange, pos: Position): boolean;
}
//# sourceMappingURL=PositionRange.d.ts.map