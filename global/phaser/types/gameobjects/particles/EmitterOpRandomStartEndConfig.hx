package global.phaser.types.gameobjects.particles;

/**
	Defines an operation yielding a random value within a range.
**/
typedef EmitterOpRandomStartEndConfig = {
	/**
		The starting value.
	**/
	var start : Float;
	/**
		The ending value.
	**/
	var end : Float;
	/**
		If false, this becomes {@link EmitterOpEaseConfig}.
	**/
	var random : Bool;
};