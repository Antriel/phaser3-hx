package global.phaser.types.animations;

typedef JSONAnimationFrame = {
	/**
		The key of the Texture this AnimationFrame uses.
	**/
	var key : String;
	/**
		The key of the Frame within the Texture that this AnimationFrame uses.
	**/
	var frame : ts.AnyOf2<String, Float>;
	/**
		Additional time (in ms) that this frame should appear for during playback.
	**/
	var duration : Float;
};