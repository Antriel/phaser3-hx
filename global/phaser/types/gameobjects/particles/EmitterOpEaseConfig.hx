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
		The ease to find. This can be either a string from the EaseMap, or a custom function.
	**/
	@:optional
	var ease : ts.AnyOf2<String, haxe.Constraints.Function>;
	/**
		An optional array of ease parameters to go with the ease.
	**/
	@:optional
	var easeParams : Array<Float>;
};