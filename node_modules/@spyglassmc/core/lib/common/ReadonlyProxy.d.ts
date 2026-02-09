type DeepReadonlyValue<T> = T extends object ? DeepReadonly<T> : T;
export type DeepReadonly<T extends object> = {
    readonly [K in keyof T]: DeepReadonlyValue<T[K]>;
};
export type ReadWrite<T extends object> = {
    -readonly [K in keyof T]: T[K];
};
export declare namespace ReadonlyProxy {
    function create<T extends object>(obj: T): DeepReadonly<T>;
}
export {};
//# sourceMappingURL=ReadonlyProxy.d.ts.map