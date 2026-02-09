import type { Logger } from '../../common/index.js';
import type { AstNode, StringBaseNode } from '../../node/index.js';
import type { MetaRegistry } from '../../service/index.js';
import type { Linter } from './Linter.js';
export declare const noop: Linter<AstNode>;
/**
 * @param key The name of the key on the {@link AstNode} that contains the value to be validated.
 */
export declare function nameConvention(key: string): Linter<AstNode>;
export declare const quote: Linter<StringBaseNode>;
export declare namespace configValidator {
    function nameConvention(name: string, val: unknown, logger: Logger): boolean;
    function symbolLinterConfig(_name: string, value: unknown, _logger: Logger): boolean;
}
export declare function registerLinters(meta: MetaRegistry): void;
//# sourceMappingURL=builtin.d.ts.map