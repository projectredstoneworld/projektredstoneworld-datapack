export var FileNode;
(function (FileNode) {
    function getErrors(node) {
        return [
            ...node.parserErrors,
            ...(node.binderErrors ?? []),
            ...(node.checkerErrors ?? []),
            ...(node.linterErrors ?? []),
        ];
    }
    FileNode.getErrors = getErrors;
})(FileNode || (FileNode = {}));
//# sourceMappingURL=FileNode.js.map