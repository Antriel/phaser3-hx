package global.phaser.types.gameobjects.bitmaptext;

typedef RetroFontConfig = {
	/**
		The key of the image containing the font.
	**/
	var image : String;
	/**
		If the font set doesn't start at the top left of the given image, specify the X coordinate offset here.
	**/
	@:native("offset.x")
	var offset_x : Float;
	/**
		If the font set doesn't start at the top left of the given image, specify the Y coordinate offset here.
	**/
	@:native("offset.y")
	var offset_y : Float;
	/**
		The width of each character in the font set.
	**/
	var width : Float;
	/**
		The height of each character in the font set.
	**/
	var height : Float;
	/**
		The characters used in the font set, in display order. You can use the TEXT_SET consts for common font set arrangements.
	**/
	var chars : String;
	/**
		The number of characters per row in the font set. If not given charsPerRow will be the image width / characterWidth.
	**/
	var charsPerRow : Float;
	/**
		If the characters in the font set have horizontal spacing between them set the required amount here.
	**/
	@:native("spacing.x")
	var spacing_x : Float;
	/**
		If the characters in the font set have vertical spacing between them set the required amount here.
	**/
	@:native("spacing.y")
	var spacing_y : Float;
	/**
		The amount of vertical space to add to the line height of the font.
	**/
	var lineSpacing : Float;
};