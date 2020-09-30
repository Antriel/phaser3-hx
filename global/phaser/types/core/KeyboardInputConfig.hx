package global.phaser.types.core;

typedef KeyboardInputConfig = {
	/**
		Where the Keyboard Manager listens for keyboard input events.
	**/
	@:optional
	var target : Dynamic;
	/**
		`preventDefault` will be called on every non-modified key which has a key code in this array. By default it is empty.
	**/
	@:optional
	var capture : Array<Float>;
};