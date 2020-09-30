package global.phaser.types.animations;

typedef GenerateFrameNames = {
	/**
		The string to append to every resulting frame name if using a range or an array of `frames`.
	**/
	@:optional
	var prefix : String;
	/**
		If `frames` is not provided, the number of the first frame to return.
	**/
	@:optional
	var start : Float;
	/**
		If `frames` is not provided, the number of the last frame to return.
	**/
	@:optional
	var end : Float;
	/**
		The string to append to every resulting frame name if using a range or an array of `frames`.
	**/
	@:optional
	var suffix : String;
	/**
		The minimum expected lengths of each resulting frame's number. Numbers will be left-padded with zeroes until they are this long, then prepended and appended to create the resulting frame name.
	**/
	@:optional
	var zeroPad : Float;
	/**
		The array to append the created configuration objects to.
	**/
	@:optional
	var outputArray : Array<AnimationFrame>;
	/**
		If provided as an array, the range defined by `start` and `end` will be ignored and these frame numbers will be used.
	**/
	@:optional
	var frames : ts.AnyOf2<Bool, Array<Float>>;
};