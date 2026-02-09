export class TwoWayMap {
    _map = new Map();
    _reversedMap = new Map();
    constructor(values = []) {
        for (const [k, v] of values) {
            this._map.set(k, v);
            this._reversedMap.set(v, k);
        }
    }
    get size() {
        return this._map.size;
    }
    clear() {
        this._map.clear();
        this._reversedMap.clear();
    }
    delete(key) {
        const value = this._map.get(key);
        const ans = this._map.delete(key);
        if (value !== undefined) {
            this._reversedMap.delete(value);
        }
        return ans;
    }
    deleteValue(value) {
        const key = this._reversedMap.get(value);
        const ans = this._reversedMap.delete(value);
        if (key !== undefined) {
            this._map.delete(key);
        }
        return ans;
    }
    get(key) {
        return this._map.get(key);
    }
    getKey(value) {
        return this._reversedMap.get(value);
    }
    has(key) {
        return this._map.has(key);
    }
    hasValue(value) {
        return this._reversedMap.has(value);
    }
    set(key, value) {
        this._map.set(key, value);
        this._reversedMap.set(value, key);
        return this;
    }
    forEach(callbackfn, thisArg) {
        for (const [key, value] of this._map) {
            callbackfn.apply(thisArg, [value, key, this]);
        }
    }
    entries() {
        return this._map.entries();
    }
    keys() {
        return this._map.keys();
    }
    values() {
        return this._map.values();
    }
    [Symbol.iterator]() {
        return this._map.entries();
    }
    [Symbol.toStringTag] = 'TwoWayMap';
}
//# sourceMappingURL=TwoWayMap.js.map