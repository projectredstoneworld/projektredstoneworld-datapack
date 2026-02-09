import * as core from '@spyglassmc/core';
import { byteArray, intArray, list, longArray } from './collection.js';
import { compound } from './compound.js';
import { primitive } from './primitive.js';
export const entry = (src, ctx) => core.failOnEmpty(core.select([
    { predicate: (src) => src.tryPeek('[B;'), parser: byteArray },
    {
        predicate: (src) => src.tryPeek('[I;'),
        parser: intArray,
    },
    { predicate: (src) => src.tryPeek('[L;'), parser: longArray },
    { predicate: (src) => src.tryPeek('['), parser: list },
    { predicate: (src) => src.tryPeek('{'), parser: compound },
    { parser: primitive },
]))(src, ctx);
//# sourceMappingURL=entry.js.map