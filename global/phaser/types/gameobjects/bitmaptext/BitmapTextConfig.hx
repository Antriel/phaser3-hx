package global.phaser.types.gameobjects.bitmaptext;

typedef BitmapTextConfig = global.phaser.types.gameobjects.GameObjectConfig & {
	/**
		The key of the font to use from the BitmapFont cache.
	**/
	@:optional
	var font : String;
	/**
		The string, or array of strings, to be set as the content of this Bitmap Text.
	**/
	@:optional
	var text : String;
	/**
		The font size to set.
	**/
	@:optional
	var size : ts.AnyOf2<Float, Bool>;
};