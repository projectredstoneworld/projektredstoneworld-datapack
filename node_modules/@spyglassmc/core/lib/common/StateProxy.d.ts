declare const BranchOff: unique symbol;
declare const Is: unique symbol;
declare const Origin: unique symbol;
declare const Redo: unique symbol;
declare const Undo: unique symbol;
type Wrap<T> = T extends object ? StateProxy<T> : T;
/**
 * A proxy wrapped around an arbitrary object value.
 * You can access and mutate the value as normal, but you also have the ability to revert all changes ever since the
 * proxy was created using {@link StateProxy.redoChanges} and {@link StateProxy.undoChanges}.
 *
 * A new proxy can be branched off of an existing proxy using {@link StateProxy.branchOff} to have finer control
 * over what changes to be reverted.
 */
export type StateProxy<T extends object> = {
    [K in keyof T]: Wrap<T[K]>;
} & {
    [BranchOff]: () => StateProxy<T>;
    [Is]: true;
    [Origin]: T;
    [Redo]: () => void;
    [Undo]: () => void;
};
export declare namespace StateProxy {
    function branchOff<T extends object>(proxy: StateProxy<T>): StateProxy<T>;
    function create<T extends object>(obj: T): T extends StateProxy<any> ? void & {
        _cannotCreateProxyFromProxy: never;
    } : StateProxy<T>;
    function dereference<T extends object>(value: StateProxy<T> | T): T;
    function is(obj: any): obj is StateProxy<object>;
    function redoChanges(proxy: StateProxy<object>): void;
    function undoChanges(proxy: StateProxy<object>): void;
}
export {};
//# sourceMappingURL=StateProxy.d.ts.map