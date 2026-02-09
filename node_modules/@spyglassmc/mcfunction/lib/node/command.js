import * as core from '@spyglassmc/core';
export var CommandNode;
(function (CommandNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'mcfunction:command';
    }
    CommandNode.is = is;
    function mock(range, options = {}) {
        return { type: 'mcfunction:command', range: core.Range.get(range), children: [], options };
    }
    CommandNode.mock = mock;
})(CommandNode || (CommandNode = {}));
export var CommandChildNode;
(function (CommandChildNode) {
    function is(node) {
        return node.type === 'mcfunction:command_child';
    }
    CommandChildNode.is = is;
})(CommandChildNode || (CommandChildNode = {}));
export var LiteralCommandChildNode;
(function (LiteralCommandChildNode) {
    function is(node) {
        return (node?.type
            === 'mcfunction:command_child/literal');
    }
    LiteralCommandChildNode.is = is;
})(LiteralCommandChildNode || (LiteralCommandChildNode = {}));
//# sourceMappingURL=command.js.map