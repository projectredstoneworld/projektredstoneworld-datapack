import { Range } from '../../source/index.js';
export var CompletionItem;
(function (CompletionItem) {
    /* istanbul ignore next */
    /**
     * If no `insertText` is provided in `other`, the value of `label` will be escaped for TextMate purposes
     * (@see {@link escape}) and used as the insert text.
     *
     * @example
     * create('foo', range) // insertText = 'foo'
     * create('\\ $ }', range) // insertText = '\\\\ \\$ \\}'
     * create('foo', range, { insertText: '\\ $ }' }) // insertText = '\\ $ }'
     */
    function create(label, range, other) {
        const shouldEscape = other?.insertText === undefined && needsEscape(label);
        return {
            ...other,
            label,
            range: Range.get(range),
            ...(shouldEscape ? { insertText: escape(label) } : {}),
        };
    }
    CompletionItem.create = create;
    /**
     * Returns if `textToInsert` contains any characters that need to be escaped for TextMate (`$`, `\`, or `}`)
     */
    function needsEscape(textToInsert) {
        return /[\\$}]/.test(textToInsert);
    }
    CompletionItem.needsEscape = needsEscape;
    /**
     * Escape `$`, `\`, and `}` in `textToInsert`
     */
    function escape(textToInsert) {
        return textToInsert.replace(/([\\$}])/g, '\\$1');
    }
    CompletionItem.escape = escape;
    /**
     * Un-escape `$`, `\`, and `}` in `textToInsert`
     */
    function unescape(textToInsert) {
        return textToInsert.replace(/\\([\\$}])/g, '$1');
    }
    CompletionItem.unescape = unescape;
})(CompletionItem || (CompletionItem = {}));
export class InsertTextBuilder {
    #ans = '';
    #nextPlaceholder = 1;
    literal(str) {
        this.#ans += CompletionItem.escape(str);
        return this;
    }
    placeholder(...defaultValues) {
        if (defaultValues.length === 0) {
            this.#ans += `$\{${this.#nextPlaceholder}}`;
        }
        else if (defaultValues.length === 1) {
            this.#ans += `$\{${this.#nextPlaceholder}:${CompletionItem.escape(defaultValues[0])}}`;
        }
        else {
            this.#ans += `$\{${this.#nextPlaceholder}|${defaultValues.map((v) => v.replace(/([\\$},|])/g, '\\$1')).join(',')}|}`;
        }
        this.#nextPlaceholder += 1;
        return this;
    }
    exitPlace() {
        this.#ans += '$0';
        return this;
    }
    build() {
        return this.#ans;
    }
    if(condition, callback) {
        if (condition) {
            callback(this);
        }
        return this;
    }
}
//# sourceMappingURL=Completer.js.map