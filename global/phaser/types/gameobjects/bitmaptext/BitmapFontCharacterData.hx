package global.phaser.types.gameobjects.bitmaptext;

/**
	The font data for an individual character of a Bitmap Font.
	
	Describes the character's position, size, offset and kerning.
**/
typedef BitmapFontCharacterData = {
	/**
		The x position of the character.
	**/
	var x : Float;
	/**
		The y position of the character.
	**/
	var y : Float;
	/**
		The width of the character.
	**/
	var width : Float;
	/**
		The height of the character.
	**/
	var height : Float;
	/**
		The center x position of the character.
	**/
	var centerX : Float;
	/**
		The center y position of the character.
	**/
	var centerY : Float;
	/**
		The x offset of the character.
	**/
	var xOffset : Float;
	/**
		The y offset of the character.
	**/
	var yOffset : Float;
	/**
		Extra data for the character.
	**/
	var data : Dynamic;
	/**
		Kerning values, keyed by character code.
	**/
	var kerning : { };
};