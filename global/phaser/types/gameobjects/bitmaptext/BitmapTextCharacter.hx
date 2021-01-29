package global.phaser.types.gameobjects.bitmaptext;

/**
	A single entry from the `BitmapTextSize` characters array.
	
	The position and dimensions take the font size into account,
	but are not translated into the local space of the Game Object itself.
**/
typedef BitmapTextCharacter = {
	/**
		The index of this character within the BitmapText text string.
	**/
	var i : Float;
	/**
		The character.
	**/
	var char : String;
	/**
		The character code of the character.
	**/
	var code : Float;
	/**
		The x position of the character in the BitmapText.
	**/
	var x : Float;
	/**
		The y position of the character in the BitmapText.
	**/
	var y : Float;
	/**
		The width of the character.
	**/
	var w : Float;
	/**
		The height of the character.
	**/
	var h : Float;
	/**
		The top of the line this character is on.
	**/
	var t : Float;
	/**
		The right-most point of this character, including xAdvance.
	**/
	var r : Float;
	/**
		The bottom of the line this character is on.
	**/
	var b : Float;
	/**
		The line number the character appears on.
	**/
	var line : Float;
	/**
		Reference to the glyph object this character is using.
	**/
	var glyph : BitmapFontCharacterData;
};