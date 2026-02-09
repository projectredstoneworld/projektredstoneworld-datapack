const IsAsync = Symbol('IsAsyncBinder');
export var SyncBinder;
(function (SyncBinder) {
    function create(binder) {
        return binder;
    }
    SyncBinder.create = create;
    function is(binder) {
        return !binder[IsAsync];
    }
    SyncBinder.is = is;
})(SyncBinder || (SyncBinder = {}));
export var AsyncBinder;
(function (AsyncBinder) {
    function create(binder) {
        return Object.assign(binder, { [IsAsync]: true });
    }
    AsyncBinder.create = create;
    function is(binder) {
        return binder[IsAsync];
    }
    AsyncBinder.is = is;
})(AsyncBinder || (AsyncBinder = {}));
//# sourceMappingURL=Binder.js.map