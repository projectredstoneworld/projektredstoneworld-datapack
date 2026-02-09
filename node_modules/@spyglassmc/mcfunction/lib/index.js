import * as core from '@spyglassmc/core';
import * as colorizer from './colorizer/index.js';
export * as colorizer from './colorizer/index.js';
export * as completer from './completer/index.js';
export * from './node/index.js';
export * from './parser/index.js';
export * from './tree/index.js';
/* istanbul ignore next */
export const initialize = ({ meta }) => {
    colorizer.register(meta);
    meta.registerCompleter('mcfunction:command_child/literal', core.completer.literal);
};
//# sourceMappingURL=index.js.map