import { Range } from '../../source/index.js';
export var ColorToken;
(function (ColorToken) {
    /* istanbul ignore next */
    function create(range, type, modifiers) {
        return { range: Range.get(range), type, modifiers };
    }
    ColorToken.create = create;
    /**
     * @returns An array of color tokens that cover the whole range of `targetRange`, with gaps in `tokens` filled
     * with tokens created from the specified `type` and `modifiers`.
     */
    function fillGap(tokens, targetRange, type, modifiers) {
        const ans = [];
        let nextStart = Math.min(targetRange.start, tokens[0]?.range.start ?? Infinity);
        for (const t of tokens) {
            if (t.range.start > nextStart) {
                ans.push(ColorToken.create(Range.create(nextStart, t.range.start), type, modifiers));
            }
            ans.push(t);
            nextStart = t.range.end;
        }
        if (nextStart < targetRange.end) {
            ans.push(ColorToken.create(Range.create(nextStart, targetRange.end), type, modifiers));
        }
        return ans;
    }
    ColorToken.fillGap = fillGap;
})(ColorToken || (ColorToken = {}));
// Built-in LSP semantic tokens: https://microsoft.github.io/language-server-protocol/specifications/specification-3-17/#textDocument_semanticTokens
/*
 * Hint: during development, the `Developer: Inspect Editor Tokens and Scopes` command in VS Code helps a lot with deciding on the color for nodes.
 */
export const ColorTokenTypes = Object.freeze([
    'comment',
    'enum',
    'enumMember',
    'escape',
    'function',
    'keyword',
    'modifier',
    'number',
    'property',
    'string',
    'struct',
    'type',
    'variable',
    // Below are custom types.
    'error',
    'literal',
    'operator',
    'resourceLocation',
    'vector',
]);
export const ColorTokenModifiers = Object.freeze([
    'declaration',
    'defaultLibrary',
    'definition',
    'deprecated',
    'documentation',
    'modification',
    'readonly',
    // Below are custom modifiers.
]);
//# sourceMappingURL=Colorizer.js.map