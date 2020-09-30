package global.phaser.types.core;

typedef MouseInputConfig = {
	/**
		Where the Mouse Manager listens for mouse input events. The default is the game canvas.
	**/
	@:optional
	var target : Dynamic;
	/**
		Whether mouse input events have `preventDefault` called on them.
	**/
	@:optional
	var capture : Bool;
};