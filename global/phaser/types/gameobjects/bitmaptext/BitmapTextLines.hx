package global.phaser.types.gameobjects.bitmaptext;

/**
	Details about the line data in the `BitmapTextSize` object.
**/
typedef BitmapTextLines = {
	/**
		The width of the shortest line of text.
	**/
	var shortest : Float;
	/**
		The width of the longest line of text.
	**/
	var longest : Float;
	/**
		The height of a line of text.
	**/
	var height : Float;
	/**
		An array where each entry contains the length of that line of text.
	**/
	var lengths : Array<Float>;
};