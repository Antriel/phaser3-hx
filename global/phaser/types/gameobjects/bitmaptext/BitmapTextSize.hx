package global.phaser.types.gameobjects.bitmaptext;

typedef BitmapTextSize = {
	/**
		The position and size of the BitmapText, taking into account the position and scale of the Game Object.
	**/
	var global : GlobalBitmapTextSize;
	/**
		The position and size of the BitmapText, taking just the font size into account.
	**/
	var local : LocalBitmapTextSize;
	/**
		Data about the lines of text within the BitmapText.
	**/
	var lines : BitmapTextLines;
	/**
		An array containing per-character data. Only populated if `includeChars` is `true` in the `getTextBounds` call.
	**/
	var characters : Array<BitmapTextCharacter>;
	/**
		An array containing the word data from the BitmapText.
	**/
	var words : Array<BitmapTextWord>;
	/**
		The scale of the BitmapText font being rendered vs. font size in the text data.
	**/
	var scale : Float;
	/**
		The scale X value of the BitmapText.
	**/
	var scaleX : Float;
	/**
		The scale Y value of the BitmapText.
	**/
	var scaleY : Float;
	/**
		The wrapped text, if wrapping enabled and required.
	**/
	var wrappedText : String;
};