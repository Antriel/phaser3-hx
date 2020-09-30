package global.phaser.types.gameobjects.particles;

/**
	Defines an operation yielding a value incremented continuously across a range.
**/
typedef EmitterOpEaseConfig = {
	/**
		The starting value.
	**/
	var start : Float;
	/**
		The ending value.
	**/
	var end : Float;
	/**
		The name of the easing function.
	**/
	@:optional
	var ease : String;
};