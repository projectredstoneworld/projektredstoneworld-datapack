import * as core from '@spyglassmc/core';
import { JsonStringOptions } from '../parser/index.js';
export var JsonFileNode;
(function (JsonFileNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj?.type === 'json:file';
    }
    JsonFileNode.is = is;
})(JsonFileNode || (JsonFileNode = {}));
export var JsonNode;
(function (JsonNode) {
    function is(node) {
        return (JsonObjectNode.is(node)
            || JsonArrayNode.is(node)
            || JsonStringNode.is(node)
            || JsonNumberNode.is(node)
            || JsonBooleanNode.is(node)
            || JsonNullNode.is(node));
    }
    JsonNode.is = is;
})(JsonNode || (JsonNode = {}));
export var JsonObjectNode;
(function (JsonObjectNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj?.type === 'json:object';
    }
    JsonObjectNode.is = is;
    function mock(range) {
        return { type: 'json:object', range: core.Range.get(range), children: [] };
    }
    JsonObjectNode.mock = mock;
})(JsonObjectNode || (JsonObjectNode = {}));
export var JsonPairNode;
(function (JsonPairNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj.type === 'pair';
    }
    JsonPairNode.is = is;
})(JsonPairNode || (JsonPairNode = {}));
export var JsonArrayNode;
(function (JsonArrayNode) {
    function is(obj) {
        return obj?.type === 'json:array';
    }
    JsonArrayNode.is = is;
    function mock(range) {
        return { type: 'json:array', range: core.Range.get(range), children: [] };
    }
    JsonArrayNode.mock = mock;
})(JsonArrayNode || (JsonArrayNode = {}));
export var JsonStringNode;
(function (JsonStringNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj?.type === 'json:string';
    }
    JsonStringNode.is = is;
    function mock(range) {
        return { ...core.StringNode.mock(range, JsonStringOptions), type: 'json:string' };
    }
    JsonStringNode.mock = mock;
})(JsonStringNode || (JsonStringNode = {}));
export var JsonNumberNode;
(function (JsonNumberNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj.type === 'json:number';
    }
    JsonNumberNode.is = is;
})(JsonNumberNode || (JsonNumberNode = {}));
export var JsonBooleanNode;
(function (JsonBooleanNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj.type === 'json:boolean';
    }
    JsonBooleanNode.is = is;
})(JsonBooleanNode || (JsonBooleanNode = {}));
export var JsonNullNode;
(function (JsonNullNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj.type === 'json:null';
    }
    JsonNullNode.is = is;
})(JsonNullNode || (JsonNullNode = {}));
export var TypedJsonNode;
(function (TypedJsonNode) {
    /* istanbul ignore next */
    function is(obj) {
        return obj.type === 'json:typed';
    }
    TypedJsonNode.is = is;
})(TypedJsonNode || (TypedJsonNode = {}));
//# sourceMappingURL=index.js.map