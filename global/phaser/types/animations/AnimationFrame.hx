package global.phaser.types.animations;

typedef AnimationFrame = {
	/**
		The key of the texture within the Texture Manager to use for this Animation Frame.
	**/
	@:optional
	var key : String;
	/**
		The key, or index number, of the frame within the texture to use for this Animation Frame.
	**/
	@:optional
	var frame : ts.AnyOf2<String, Float>;
	/**
		The duration, in ms, of this frame of the animation.
	**/
	@:optional
	var duration : Float;
	/**
		Should the parent Game Object be visible during this frame of the animation?
	**/
	@:optional
	var visible : Bool;
};