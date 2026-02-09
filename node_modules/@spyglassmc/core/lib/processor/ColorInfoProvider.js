export var Color;
(function (Color) {
    Color.NamedColors = new Map([
        ['aqua', 0x55ffff],
        ['black', 0x000000],
        ['blue', 0x5555ff],
        ['dark_aqua', 0x00aaaa],
        ['dark_blue', 0x0000aa],
        ['dark_gray', 0x555555],
        ['dark_green', 0x00aa00],
        ['dark_purple', 0xaa00aa],
        ['dark_red', 0xaa0000],
        ['gold', 0xffaa00],
        ['gray', 0xaaaaaa],
        ['green', 0x55ff55],
        ['light_purple', 0xff55ff],
        ['red', 0xff5555],
        ['white', 0xffffff],
        ['yellow', 0xffff55],
    ]);
    Color.ColorNames = [...Color.NamedColors.keys()];
    function fromNamed(value) {
        const composite = Color.NamedColors.get(value);
        if (composite === undefined) {
            return undefined;
        }
        return fromCompositeRGB(composite);
    }
    Color.fromNamed = fromNamed;
    /**
     * @param r A decimal within [0.0, 1.0].
     * @param g A decimal within [0.0, 1.0].
     * @param b A decimal within [0.0, 1.0].
     * @param a A decimal within [0.0, 1.0].
     */
    function fromDecRGBA(r, g, b, a) {
        return [r, g, b, a];
    }
    Color.fromDecRGBA = fromDecRGBA;
    /**
     * @param r A decimal within [0.0, 1.0].
     * @param g A decimal within [0.0, 1.0].
     * @param b A decimal within [0.0, 1.0].
     */
    function fromDecRGB(r, g, b) {
        return fromDecRGBA(r, g, b, 1.0);
    }
    Color.fromDecRGB = fromDecRGB;
    /**
     * @param r An integer within [0, 255].
     * @param g An integer within [0, 255].
     * @param b An integer within [0, 255].
     * @param a An integer within [0, 255].
     */
    function fromIntRGBA(r, g, b, a) {
        return fromDecRGBA(r / 255, g / 255, b / 255, a / 255);
    }
    Color.fromIntRGBA = fromIntRGBA;
    /**
     * @param r An integer within [0, 255].
     * @param g An integer within [0, 255].
     * @param b An integer within [0, 255].
     */
    function fromIntRGB(r, g, b) {
        return fromIntRGBA(r, g, b, 255);
    }
    Color.fromIntRGB = fromIntRGB;
    /**
     * @param value A string in the format `#rrggbb`
     */
    function fromHexRGB(value) {
        var bigint = parseInt(value.slice(1), 16);
        var r = (bigint >> 16) & 255;
        var g = (bigint >> 8) & 255;
        var b = bigint & 255;
        return fromIntRGB(r, g, b);
    }
    Color.fromHexRGB = fromHexRGB;
    /**
     * @param value `R << 16 + G << 8 + B`.
     */
    function fromCompositeRGB(value) {
        const r = value >> 16 & 0xff;
        const g = value >> 8 & 0xff;
        const b = value & 0xff;
        return fromIntRGB(r, g, b);
    }
    Color.fromCompositeRGB = fromCompositeRGB;
    /**
     * @param value `A << 24 + R << 16 + G << 8 + B`.
     */
    function fromCompositeARGB(value) {
        // Cast to signed 32-bit integer
        value |= 0;
        const a = (value >>> 24) & 0xff;
        const r = (value >>> 16) & 0xff;
        const g = (value >>> 8) & 0xff;
        const b = value & 0xff;
        return fromIntRGBA(r, g, b, a);
    }
    Color.fromCompositeARGB = fromCompositeARGB;
})(Color || (Color = {}));
export var ColorFormat;
(function (ColorFormat) {
    /**
     * `1 0.6 0.2 1.0`
     */
    ColorFormat[ColorFormat["DecRGBA"] = 0] = "DecRGBA";
    /**
     * `1 0.6 0.2`
     */
    ColorFormat[ColorFormat["DecRGB"] = 1] = "DecRGB";
    /**
     * `255 153 51 25`
     */
    ColorFormat[ColorFormat["IntRGBA"] = 2] = "IntRGBA";
    /**
     * `255 153 51`
     */
    ColorFormat[ColorFormat["IntRGB"] = 3] = "IntRGB";
    /**
     * `#ff9933ff`
     */
    ColorFormat[ColorFormat["HexRGBA"] = 4] = "HexRGBA";
    /**
     * `#ff9933`
     */
    ColorFormat[ColorFormat["HexRGB"] = 5] = "HexRGB";
    /**
     * `16620441`
     */
    ColorFormat[ColorFormat["CompositeRGB"] = 6] = "CompositeRGB";
    /**
     * `4294945365`
     */
    ColorFormat[ColorFormat["CompositeARGB"] = 7] = "CompositeARGB";
})(ColorFormat || (ColorFormat = {}));
export var ColorPresentation;
(function (ColorPresentation) {
    function fromColorFormat(format, color, range) {
        const presentation = colorPresentation(format, color);
        return { label: presentation, text: presentation, range };
    }
    ColorPresentation.fromColorFormat = fromColorFormat;
    function colorPresentation(format, color) {
        const round = (num) => parseFloat(num.toFixed(3));
        switch (format) {
            case ColorFormat.DecRGBA:
                return color.map((c) => round(c)).join(' ');
            case ColorFormat.DecRGB:
                return color.slice(0, 3).map((c) => round(c)).join(' ');
            case ColorFormat.IntRGBA:
                return color.map((c) => Math.round(c * 255)).join(' ');
            case ColorFormat.IntRGB:
                return color.slice(0, 3).map((c) => Math.round(c * 255)).join(' ');
            case ColorFormat.HexRGBA:
                return `#${Math.round((((color[0] * 255) << 24) + ((color[1] * 255) << 16) + color[2] * 255)
                    << (8 + color[3] * 255)).toString(16).padStart(8, '0')}`;
            case ColorFormat.HexRGB:
                return `#${Math.round(((color[0] * 255) << 16) + ((color[1] * 255) << 8) + color[2] * 255)
                    .toString(16).padStart(6, '0')}`;
            case ColorFormat.CompositeRGB:
                return `${Math.round(((color[0] * 255) << 16) + ((color[1] * 255) << 8) + color[2] * 255)}`;
            case ColorFormat.CompositeARGB:
                return `${Number((BigInt(Math.round(color[3] * 255)) << 24n)
                    + (BigInt(Math.round(color[0] * 255)) << 16n)
                    + (BigInt(Math.round(color[1] * 255)) << 8n)
                    + BigInt(Math.round(color[2] * 255))) << 0 // Convert to signed 32-bit integer
                }`;
        }
    }
})(ColorPresentation || (ColorPresentation = {}));
//# sourceMappingURL=ColorInfoProvider.js.map