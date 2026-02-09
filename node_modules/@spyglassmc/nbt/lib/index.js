import * as checker from './checker/index.js';
import * as colorizer from './colorizer/index.js';
import * as completer from './completer/index.js';
import { registerMcdocAttributes } from './mcdocAttributes.js';
import * as parser from './parser/index.js';
export * as checker from './checker/index.js';
export * as colorizer from './colorizer/index.js';
export * as completer from './completer/index.js';
export * from './node/index.js';
export * as parser from './parser/index.js';
/* istanbul ignore next */
export const initialize = ({ meta }) => {
    meta.registerLanguage('snbt', {
        extensions: ['.snbt'],
        parser: parser.entry,
    });
    meta.registerLanguage('nbt', {
        extensions: ['.nbt'],
    });
    meta.registerParser('nbt:entry', parser.entry);
    meta.registerParser('nbt:compound', parser.compound);
    meta.registerParser('nbt:path', parser.path);
    checker.register(meta);
    colorizer.register(meta);
    completer.register(meta);
    registerMcdocAttributes(meta);
};
//# sourceMappingURL=index.js.map