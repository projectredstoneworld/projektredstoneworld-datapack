import * as core from '@spyglassmc/core';
import * as mcf from '@spyglassmc/mcfunction';
import type { RootTreeNode } from '../dependency/index.js';
/**
 * Only command options that can be satisfied by the current command node will be listed in `signatures`.
 * Only parameters at and immediately after the `offset` will be listed in `parameters`.
 */
export declare function signatureHelpProvider(rootTreeNode: RootTreeNode): core.SignatureHelpProvider<core.FileNode<mcf.McfunctionNode>>;
//# sourceMappingURL=signatureHelpProvider.d.ts.map