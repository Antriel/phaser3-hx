package global.phaser.types.tweens;

typedef StaggerConfig = {
	/**
		The value to start the stagger from. Can be used as a way to offset the stagger while still using a range for the value.
	**/
	@:optional
	var start : Float;
	/**
		An ease to apply across the staggered values. Can either be a string, such as 'sine.inout', or a function.
	**/
	@:optional
	var ease : ts.AnyOf2<String, haxe.Constraints.Function>;
	/**
		The index to start the stagger from. Can be the strings `first`, `last` or `center`, or an integer representing the stagger position.
	**/
	@:optional
	var from : ts.AnyOf2<String, Float>;
	/**
		Set the stagger to run across a grid by providing an array where element 0 is the width of the grid and element 1 is the height. Combine with the 'from' property to control direction.
	**/
	@:optional
	var grid : Array<Float>;
};