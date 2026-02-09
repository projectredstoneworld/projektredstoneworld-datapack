import * as core from '@spyglassmc/core';
export function register(meta) {
    meta.registerColorizer('nbt:string', core.colorizer.string);
    meta.registerColorizer('nbt:byte', core.colorizer.number);
    meta.registerColorizer('nbt:short', core.colorizer.number);
    meta.registerColorizer('nbt:int', core.colorizer.number);
    meta.registerColorizer('nbt:long', core.colorizer.number);
    meta.registerColorizer('nbt:float', core.colorizer.number);
    meta.registerColorizer('nbt:double', core.colorizer.number);
}
//# sourceMappingURL=index.js.map