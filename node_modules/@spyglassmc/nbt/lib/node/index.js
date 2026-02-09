export var NbtNode;
(function (NbtNode) {
    /* istanbul ignore next */
    function is(node) {
        return (NbtPrimitiveNode.is(node) || NbtCompoundNode.is(node) || NbtCollectionNode.is(node));
    }
    NbtNode.is = is;
})(NbtNode || (NbtNode = {}));
export var NbtPrimitiveNode;
(function (NbtPrimitiveNode) {
    /* istanbul ignore next */
    function is(node) {
        return NbtNumberNode.is(node) || NbtStringNode.is(node);
    }
    NbtPrimitiveNode.is = is;
})(NbtPrimitiveNode || (NbtPrimitiveNode = {}));
export var NbtStringNode;
(function (NbtStringNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj?.type === 'nbt:string';
    }
    NbtStringNode.is = is;
})(NbtStringNode || (NbtStringNode = {}));
export var NbtNumberNode;
(function (NbtNumberNode) {
    /* istanbul ignore next */
    function is(node) {
        return NbtIntegerAlikeNode.is(node) || NbtFloatAlikeNode.is(node);
    }
    NbtNumberNode.is = is;
})(NbtNumberNode || (NbtNumberNode = {}));
export var NbtIntegerAlikeNode;
(function (NbtIntegerAlikeNode) {
    /* istanbul ignore next */
    function is(node) {
        return (NbtByteNode.is(node)
            || NbtShortNode.is(node)
            || NbtIntNode.is(node)
            || NbtLongNode.is(node));
    }
    NbtIntegerAlikeNode.is = is;
})(NbtIntegerAlikeNode || (NbtIntegerAlikeNode = {}));
export var NbtByteNode;
(function (NbtByteNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:byte';
    }
    NbtByteNode.is = is;
})(NbtByteNode || (NbtByteNode = {}));
export var NbtShortNode;
(function (NbtShortNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:short';
    }
    NbtShortNode.is = is;
})(NbtShortNode || (NbtShortNode = {}));
export var NbtIntNode;
(function (NbtIntNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:int';
    }
    NbtIntNode.is = is;
})(NbtIntNode || (NbtIntNode = {}));
export var NbtLongNode;
(function (NbtLongNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:long';
    }
    NbtLongNode.is = is;
})(NbtLongNode || (NbtLongNode = {}));
export var NbtFloatAlikeNode;
(function (NbtFloatAlikeNode) {
    /* istanbul ignore next */
    function is(node) {
        return NbtFloatNode.is(node) || NbtDoubleNode.is(node);
    }
    NbtFloatAlikeNode.is = is;
})(NbtFloatAlikeNode || (NbtFloatAlikeNode = {}));
export var NbtFloatNode;
(function (NbtFloatNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:float';
    }
    NbtFloatNode.is = is;
})(NbtFloatNode || (NbtFloatNode = {}));
export var NbtDoubleNode;
(function (NbtDoubleNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:double';
    }
    NbtDoubleNode.is = is;
})(NbtDoubleNode || (NbtDoubleNode = {}));
export var NbtCompoundNode;
(function (NbtCompoundNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:compound';
    }
    NbtCompoundNode.is = is;
})(NbtCompoundNode || (NbtCompoundNode = {}));
export var NbtCollectionNode;
(function (NbtCollectionNode) {
    /* istanbul ignore next */
    function is(node) {
        return NbtListNode.is(node) || NbtPrimitiveArrayNode.is(node);
    }
    NbtCollectionNode.is = is;
})(NbtCollectionNode || (NbtCollectionNode = {}));
export var NbtListNode;
(function (NbtListNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:list';
    }
    NbtListNode.is = is;
})(NbtListNode || (NbtListNode = {}));
export var NbtPrimitiveArrayNode;
(function (NbtPrimitiveArrayNode) {
    /* istanbul ignore next */
    function is(node) {
        return (NbtByteArrayNode.is(node) || NbtIntArrayNode.is(node) || NbtLongArrayNode.is(node));
    }
    NbtPrimitiveArrayNode.is = is;
})(NbtPrimitiveArrayNode || (NbtPrimitiveArrayNode = {}));
export var NbtByteArrayNode;
(function (NbtByteArrayNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:byte_array';
    }
    NbtByteArrayNode.is = is;
})(NbtByteArrayNode || (NbtByteArrayNode = {}));
export var NbtIntArrayNode;
(function (NbtIntArrayNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:int_array';
    }
    NbtIntArrayNode.is = is;
})(NbtIntArrayNode || (NbtIntArrayNode = {}));
export var NbtLongArrayNode;
(function (NbtLongArrayNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:long_array';
    }
    NbtLongArrayNode.is = is;
})(NbtLongArrayNode || (NbtLongArrayNode = {}));
export var NbtPathNode;
(function (NbtPathNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:path';
    }
    NbtPathNode.is = is;
})(NbtPathNode || (NbtPathNode = {}));
export var NbtPathKeyNode;
(function (NbtPathKeyNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:path/key';
    }
    NbtPathKeyNode.is = is;
})(NbtPathKeyNode || (NbtPathKeyNode = {}));
export var NbtPathFilterNode;
(function (NbtPathFilterNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:path/filter';
    }
    NbtPathFilterNode.is = is;
})(NbtPathFilterNode || (NbtPathFilterNode = {}));
export var NbtPathIndexNode;
(function (NbtPathIndexNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:path/index';
    }
    NbtPathIndexNode.is = is;
})(NbtPathIndexNode || (NbtPathIndexNode = {}));
export var TypedNbtNode;
(function (TypedNbtNode) {
    /* istanbul ignore next */
    function is(node) {
        return node?.type === 'nbt:typed';
    }
    TypedNbtNode.is = is;
})(TypedNbtNode || (TypedNbtNode = {}));
//# sourceMappingURL=index.js.map