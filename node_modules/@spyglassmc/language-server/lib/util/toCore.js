/*
 * A series of functions that can transform `vscode-languageserver` types to `@spyglassmc/core` types.
 *
 * Functions are named after types in `@spyglassmc/core`.
 */
import * as core from '@spyglassmc/core';
export function offset(position, doc) {
    return doc.offsetAt(position);
}
export function range(range, doc) {
    return core.Range.create(offset(range.start, doc), offset(range.end, doc));
}
export function color(color) {
    return [color.red, color.green, color.blue, color.alpha];
}
//# sourceMappingURL=toCore.js.map