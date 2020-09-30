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
};