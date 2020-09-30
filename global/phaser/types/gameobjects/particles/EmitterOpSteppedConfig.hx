package global.phaser.types.gameobjects.particles;

/**
	Defines an operation yielding a value incremented by steps across a range.
**/
typedef EmitterOpSteppedConfig = {
	/**
		The starting value.
	**/
	var start : Float;
	/**
		The ending value.
	**/
	var end : Float;
	/**
		The number of steps between start and end.
	**/
	var steps : Float;
};