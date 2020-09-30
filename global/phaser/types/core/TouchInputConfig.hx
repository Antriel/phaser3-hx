package global.phaser.types.core;

typedef TouchInputConfig = {
	/**
		Where the Touch Manager listens for touch input events. The default is the game canvas.
	**/
	@:optional
	var target : Dynamic;
	/**
		Whether touch input events have preventDefault() called on them.
	**/
	@:optional
	var capture : Bool;
};