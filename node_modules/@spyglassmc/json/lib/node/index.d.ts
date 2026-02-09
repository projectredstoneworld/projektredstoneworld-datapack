import * as core from '@spyglassmc/core';
import type * as mcdoc from '@spyglassmc/mcdoc';
export interface JsonFileNode extends core.AstNode {
    readonly type: 'json:file';
    readonly children: [JsonNode];
}
export declare namespace JsonFileNode {
    function is(obj: object | undefined): obj is JsonFileNode;
}
interface JsonBaseNode {
    typeDef?: mcdoc.runtime.checker.SimplifiedMcdocType;
}
export type JsonNode = JsonObjectNode | JsonArrayNode | JsonPrimitiveNode;
export declare namespace JsonNode {
    function is(node: core.AstNode): node is JsonNode;
}
export interface JsonObjectNode extends core.RecordBaseNode<JsonStringNode, JsonNode>, JsonBaseNode {
    readonly type: 'json:object';
}
export declare namespace JsonObjectNode {
    function is(obj: object | undefined): obj is JsonObjectNode;
    function mock(range: core.RangeLike): JsonObjectNode;
}
export type JsonPairNode = core.PairNode<JsonStringNode, JsonNode>;
export declare namespace JsonPairNode {
    function is(obj: object): obj is JsonPairNode;
}
export interface JsonArrayNode extends core.ListNode<JsonNode>, JsonBaseNode {
    readonly type: 'json:array';
}
export declare namespace JsonArrayNode {
    function is(obj: object | undefined): obj is JsonArrayNode;
    function mock(range: core.RangeLike): JsonArrayNode;
}
export type JsonPrimitiveNode = JsonStringNode | JsonNumberNode | JsonBooleanNode | JsonNullNode;
export interface JsonStringNode extends core.StringBaseNode, JsonBaseNode {
    readonly type: 'json:string';
}
export declare namespace JsonStringNode {
    function is(obj: object | undefined): obj is JsonStringNode;
    function mock(range: core.RangeLike): JsonStringNode;
}
export interface JsonNumberNode extends core.AstNode, JsonBaseNode {
    readonly type: 'json:number';
    readonly children: [core.LongNode | core.FloatNode];
    readonly value: core.LongNode | core.FloatNode;
}
export declare namespace JsonNumberNode {
    function is(obj: object): obj is JsonNumberNode;
}
export interface JsonBooleanNode extends core.BooleanBaseNode, JsonBaseNode {
    readonly type: 'json:boolean';
}
export declare namespace JsonBooleanNode {
    function is(obj: object): obj is JsonBooleanNode;
}
export interface JsonNullNode extends core.AstNode, JsonBaseNode {
    readonly type: 'json:null';
}
export declare namespace JsonNullNode {
    function is(obj: object): obj is JsonNullNode;
}
export interface TypedJsonNode extends core.AstNode {
    type: 'json:typed';
    children: [JsonNode];
    targetType: mcdoc.McdocType;
}
export declare namespace TypedJsonNode {
    function is(obj: object): obj is TypedJsonNode;
}
export {};
//# sourceMappingURL=index.d.ts.map