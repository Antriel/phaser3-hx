package global.phaser.types.gameobjects.bitmaptext;

/**
	Details about a single world entry in the `BitmapTextSize` object words array.
**/
typedef BitmapTextWord = {
	/**
		The x position of the word in the BitmapText.
	**/
	var x : Float;
	/**
		The y position of the word in the BitmapText.
	**/
	var y : Float;
	/**
		The width of the word.
	**/
	var w : Float;
	/**
		The height of the word.
	**/
	var h : Float;
	/**
		The index of the word within the line.
	**/
	var i : Float;
	/**
		The word.
	**/
	var word : String;
};