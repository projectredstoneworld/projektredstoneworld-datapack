export interface Position {
    line: number;
    character: number;
}
export declare namespace Position {
    function create(line: number, character: number): Position;
    function create(partial: Partial<Position>): Position;
    /**
     * ```typescript
     * { line: 0, character: 0 }
     * ```
     */
    const Beginning: Position;
    /**
     * ```typescript
     * { line: Infinity, character: Infinity }
     * ```
     */
    const Infinity: Position;
    function toString(pos: Position): string;
    function isBefore(pos1: Position, pos2: Position): boolean;
}
//# sourceMappingURL=Position.d.ts.map