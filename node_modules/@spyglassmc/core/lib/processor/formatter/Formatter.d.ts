import type { DeepReadonly } from '../../common/index.js';
import type { AstNode } from '../../node/index.js';
import type { FormatterContext } from '../../service/index.js';
export type Formatter<N extends AstNode = AstNode> = (node: DeepReadonly<N>, ctx: FormatterContext) => string;
export declare function formatterContextIndentation(ctx: FormatterContext, additionalLevels?: number): string;
export declare function indentFormatter(ctx: FormatterContext, additionalLevels?: number): FormatterContext;
//# sourceMappingURL=Formatter.d.ts.map