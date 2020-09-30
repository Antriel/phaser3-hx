package global.phaser.types.gameobjects.bitmaptext;

/**
	The position and size of the Bitmap Text in local space, taking just the font size into account.
**/
typedef LocalBitmapTextSize = {
	/**
		The x position of the BitmapText.
	**/
	var x : Float;
	/**
		The y position of the BitmapText.
	**/
	var y : Float;
	/**
		The width of the BitmapText.
	**/
	var width : Float;
	/**
		The height of the BitmapText.
	**/
	var height : Float;
};