import * as core from '@spyglassmc/core';
export const JsonStringOptions = {
    escapable: { characters: ['b', 'f', 'n', 'r', 't'], unicode: true },
    quotes: ['"'],
};
export const string = (src, ctx) => core.setType('json:string', core.string(JsonStringOptions))(src, ctx);
//# sourceMappingURL=string.js.map