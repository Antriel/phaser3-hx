package global.phaser.types.animations;

typedef GenerateFrameNumbers = {
	/**
		The starting frame of the animation.
	**/
	@:optional
	var start : Float;
	/**
		The ending frame of the animation.
	**/
	@:optional
	var end : Float;
	/**
		A frame to put at the beginning of the animation, before `start` or `outputArray` or `frames`.
	**/
	@:optional
	var first : ts.AnyOf2<Float, Bool>;
	/**
		An array to concatenate the output onto.
	**/
	@:optional
	var outputArray : Array<AnimationFrame>;
	/**
		A custom sequence of frames.
	**/
	@:optional
	var frames : ts.AnyOf2<Bool, Array<Float>>;
};