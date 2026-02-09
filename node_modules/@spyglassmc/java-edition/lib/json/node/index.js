export var TextureSlotNode;
(function (TextureSlotNode) {
    function is(node) {
        return node?.type === 'java_edition:texture_slot';
    }
    TextureSlotNode.is = is;
})(TextureSlotNode || (TextureSlotNode = {}));
export var TranslationValueNode;
(function (TranslationValueNode) {
    function is(node) {
        return node?.type === 'java_edition:translation_value';
    }
    TranslationValueNode.is = is;
})(TranslationValueNode || (TranslationValueNode = {}));
//# sourceMappingURL=index.js.map