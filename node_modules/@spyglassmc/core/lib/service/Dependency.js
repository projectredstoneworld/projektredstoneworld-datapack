export var DependencyKey;
(function (DependencyKey) {
    function is(value) {
        return value.startsWith('@');
    }
    DependencyKey.is = is;
})(DependencyKey || (DependencyKey = {}));
//# sourceMappingURL=Dependency.js.map