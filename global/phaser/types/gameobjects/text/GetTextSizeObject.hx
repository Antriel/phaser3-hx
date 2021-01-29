package global.phaser.types.gameobjects.text;

/**
	Results object from a call to GetTextSize.
**/
typedef GetTextSizeObject = {
	/**
		The width of the longest line in the Text object.
	**/
	var width : Float;
	/**
		The height of the Text object.
	**/
	var height : Float;
	/**
		The number of lines in the Text object.
	**/
	var lines : Float;
	/**
		An array of the lines for each line in the Text object.
	**/
	var lineWidths : Array<Float>;
	/**
		The line spacing of the Text object.
	**/
	var lineSpacing : Float;
	/**
		The height of a line factoring in font and stroke.
	**/
	var lineHeight : Float;
};