export declare class TwoWayMap<K, V> implements Map<K, V> {
    _map: Map<K, V>;
    _reversedMap: Map<V, K>;
    constructor(values?: [K, V][]);
    get size(): number;
    clear(): void;
    delete(key: K): boolean;
    deleteValue(value: V): boolean;
    get(key: K): V | undefined;
    getKey(value: V): K | undefined;
    has(key: K): boolean;
    hasValue(value: V): boolean;
    set(key: K, value: V): this;
    forEach(callbackfn: (value: V, key: K, map: TwoWayMap<K, V>) => void, thisArg?: any): void;
    entries(): MapIterator<[K, V]>;
    keys(): MapIterator<K>;
    values(): MapIterator<V>;
    [Symbol.iterator](): MapIterator<[K, V]>;
    [Symbol.toStringTag]: string;
}
//# sourceMappingURL=TwoWayMap.d.ts.map