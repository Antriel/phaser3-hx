package global.phaser.types.animations;

typedef Animation = {
	/**
		The key that the animation will be associated with. i.e. sprite.animations.play(key)
	**/
	@:optional
	var key : String;
	/**
		Either a string, in which case it will use all frames from a texture with the matching key, or an array of Animation Frame configuration objects.
	**/
	@:optional
	var frames : ts.AnyOf2<String, Array<AnimationFrame>>;
	/**
		If you provide a string for `frames` you can optionally have the frame names numerically sorted.
	**/
	@:optional
	var sortFrames : Bool;
	/**
		The key of the texture all frames of the animation will use. Can be overridden on a per frame basis.
	**/
	@:optional
	var defaultTextureKey : String;
	/**
		The frame rate of playback in frames per second (default 24 if duration is null)
	**/
	@:optional
	var frameRate : Float;
	/**
		How long the animation should play for in milliseconds. If not given its derived from frameRate.
	**/
	@:optional
	var duration : Float;
	/**
		Skip frames if the time lags, or always advanced anyway?
	**/
	@:optional
	var skipMissedFrames : Bool;
	/**
		Delay before starting playback. Value given in milliseconds.
	**/
	@:optional
	var delay : Float;
	/**
		Number of times to repeat the animation (-1 for infinity)
	**/
	@:optional
	var repeat : Float;
	/**
		Delay before the animation repeats. Value given in milliseconds.
	**/
	@:optional
	var repeatDelay : Float;
	/**
		Should the animation yoyo? (reverse back down to the start) before repeating?
	**/
	@:optional
	var yoyo : Bool;
	/**
		Should sprite.visible = true when the animation starts to play?
	**/
	@:optional
	var showOnStart : Bool;
	/**
		Should sprite.visible = false when the animation finishes?
	**/
	@:optional
	var hideOnComplete : Bool;
};