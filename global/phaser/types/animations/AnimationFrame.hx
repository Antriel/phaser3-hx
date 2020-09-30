package global.phaser.types.animations;

typedef AnimationFrame = {
	/**
		The key that the animation will be associated with. i.e. sprite.animations.play(key)
	**/
	var key : String;
	/**
		The key, or index number, of the frame within the animation.
	**/
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