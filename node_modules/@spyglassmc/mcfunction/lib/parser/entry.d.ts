import * as core from '@spyglassmc/core';
import type { CommandOptions, McfunctionNode } from '../node/index.js';
import type { RootTreeNode } from '../tree/index.js';
import type { ArgumentParserGetter } from './argument.js';
export interface McfunctionOptions {
    lineContinuation?: boolean;
    macros?: boolean;
    commandOptions?: CommandOptions;
}
export declare const entry: (commandTree: RootTreeNode, argument: ArgumentParserGetter, options?: McfunctionOptions) => core.Parser<McfunctionNode>;
//# sourceMappingURL=entry.d.ts.map