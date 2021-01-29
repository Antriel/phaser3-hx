package global.phaser.types.gameobjects.bitmaptext;

/**
	The font data for an individual character of a Bitmap Font.
	
	Describes the character's position, size, offset and kerning.
	
	As of version 3.50 it also includes the WebGL texture uv data.
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
		WebGL texture u0.
	**/
	var u0 : Float;
	/**
		WebGL texture v0.
	**/
	var v0 : Float;
	/**
		WebGL texture u1.
	**/
	var u1 : Float;
	/**
		WebGL texture v1.
	**/
	var v1 : Float;
	/**
		Extra data for the character.
	**/
	var data : Dynamic;
	/**
		Kerning values, keyed by character code.
	**/
	var kerning : { };
};