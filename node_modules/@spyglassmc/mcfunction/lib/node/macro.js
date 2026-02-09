import * as core from '@spyglassmc/core';
export var MacroNode;
(function (MacroNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj?.type === 'mcfunction:macro';
    }
    MacroNode.is = is;
    function mock(range) {
        return { type: 'mcfunction:macro', range: core.Range.get(range), children: [] };
    }
    MacroNode.mock = mock;
})(MacroNode || (MacroNode = {}));
//# sourceMappingURL=macro.js.map