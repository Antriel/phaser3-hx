package global.phaser.types.gameobjects.bitmaptext;

/**
	Bitmap Font data that can be used by a BitmapText Game Object.
**/
typedef BitmapFontData = {
	/**
		The name of the font.
	**/
	var font : String;
	/**
		The size of the font.
	**/
	var size : Float;
	/**
		The line height of the font.
	**/
	var lineHeight : Float;
	/**
		Whether this font is a retro font (monospace).
	**/
	var retroFont : Bool;
	/**
		The character data of the font, keyed by character code. Each character datum includes a position, size, offset and more.
	**/
	var chars : { };
};