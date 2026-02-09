export class Operations {
    parent;
    constructor(parent) {
        this.parent = parent;
    }
    undoOps = [];
    redoOps = [];
    addUndoOp(op) {
        this.undoOps.push(op);
        this.parent?.addUndoOp(op);
    }
    addRedoOp(op) {
        this.redoOps.push(op);
        this.parent?.addRedoOp(op);
    }
    set(obj, key, value, receiver = obj) {
        const oldValue = Reflect.get(obj, key, receiver);
        const op = () => {
            Reflect.set(obj, key, value, receiver);
        };
        const undoOp = () => {
            Reflect.set(obj, key, oldValue, receiver);
        };
        this.addRedoOp(op);
        this.addUndoOp(undoOp);
        op();
    }
    undo() {
        for (let i = this.undoOps.length - 1; i >= 0; i--) {
            this.undoOps[i]();
        }
    }
    redo() {
        this.redoOps.forEach((op) => op());
    }
}
//# sourceMappingURL=Operations.js.map