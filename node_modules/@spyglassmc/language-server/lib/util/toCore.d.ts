import * as core from '@spyglassmc/core';
import type { TextDocument } from 'vscode-languageserver-textdocument';
import type * as ls from 'vscode-languageserver/node.js';
export declare function offset(position: ls.Position, doc: TextDocument): number;
export declare function range(range: ls.Range, doc: TextDocument): core.Range;
export declare function color(color: ls.Color): core.Color;
//# sourceMappingURL=toCore.d.ts.map