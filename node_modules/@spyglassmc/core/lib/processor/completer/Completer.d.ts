import type { DeepReadonly } from '../../index.js';
import type { AstNode } from '../../node/index.js';
import type { CompleterContext } from '../../service/index.js';
import type { RangeLike } from '../../source/index.js';
import { Range } from '../../source/index.js';
export type Completer<N extends AstNode = AstNode> = (node: DeepReadonly<N>, ctx: CompleterContext) => CompletionItem[];
export declare const enum CompletionKind {
    Text = 1,
    Method = 2,
    Function = 3,
    Constructor = 4,
    Field = 5,
    Variable = 6,
    Class = 7,
    Interface = 8,
    Module = 9,
    Property = 10,
    Unit = 11,
    Value = 12,
    Enum = 13,
    Keyword = 14,
    Snippet = 15,
    Color = 16,
    File = 17,
    Reference = 18,
    Folder = 19,
    EnumMember = 20,
    Constant = 21,
    Struct = 22,
    Event = 23,
    Operator = 24,
    TypeParameter = 25
}
export interface CompletionItem {
    label: string;
    range: Range;
    kind?: CompletionKind;
    labelSuffix?: string;
    detail?: string;
    documentation?: string;
    deprecated?: boolean;
    /**
     * `$`, `\`, and `}` needs to be escaped if they are not used for TextMate snippet purposes.
     */
    insertText?: string;
    sortText?: string;
    filterText?: string;
}
export declare namespace CompletionItem {
    /**
     * If no `insertText` is provided in `other`, the value of `label` will be escaped for TextMate purposes
     * (@see {@link escape}) and used as the insert text.
     *
     * @example
     * create('foo', range) // insertText = 'foo'
     * create('\\ $ }', range) // insertText = '\\\\ \\$ \\}'
     * create('foo', range, { insertText: '\\ $ }' }) // insertText = '\\ $ }'
     */
    function create(label: string, range: RangeLike, other?: Partial<CompletionItem>): CompletionItem;
    /**
     * Returns if `textToInsert` contains any characters that need to be escaped for TextMate (`$`, `\`, or `}`)
     */
    function needsEscape(textToInsert: string): boolean;
    /**
     * Escape `$`, `\`, and `}` in `textToInsert`
     */
    function escape(textToInsert: string): string;
    /**
     * Un-escape `$`, `\`, and `}` in `textToInsert`
     */
    function unescape(textToInsert: string): string;
}
export declare class InsertTextBuilder {
    #private;
    literal(str: string): this;
    placeholder(...defaultValues: string[]): this;
    exitPlace(): this;
    build(): string;
    if(condition: boolean, callback: (b: this) => unknown): this;
}
//# sourceMappingURL=Completer.d.ts.map