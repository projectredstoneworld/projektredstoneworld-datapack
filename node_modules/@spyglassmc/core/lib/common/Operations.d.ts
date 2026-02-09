export declare class Operations {
    private readonly parent?;
    constructor(parent?: Operations | undefined);
    private readonly undoOps;
    private readonly redoOps;
    private addUndoOp;
    private addRedoOp;
    set<O extends object, K extends keyof O>(obj: O, key: K, value: O[K], receiver?: any): void;
    undo(): void;
    redo(): void;
}
//# sourceMappingURL=Operations.d.ts.map