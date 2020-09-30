package global.phaser.types.animations;

typedef JSONAnimation = {
	/**
		The key that the animation will be associated with. i.e. sprite.animations.play(key)
	**/
	var key : String;
	/**
		A frame based animation (as opposed to a bone based animation)
	**/
	var type : String;
	/**
		An array of the AnimationFrame objects inside this Animation.
	**/
	var frames : Array<JSONAnimationFrame>;
	/**
		The frame rate of playback in frames per second (default 24 if duration is null)
	**/
	var frameRate : Float;
	/**
		How long the animation should play for in milliseconds. If not given its derived from frameRate.
	**/
	var duration : Float;
	/**
		Skip frames if the time lags, or always advanced anyway?
	**/
	var skipMissedFrames : Bool;
	/**
		Delay before starting playback. Value given in milliseconds.
	**/
	var delay : Float;
	/**
		Number of times to repeat the animation (-1 for infinity)
	**/
	var repeat : Float;
	/**
		Delay before the animation repeats. Value given in milliseconds.
	**/
	var repeatDelay : Float;
	/**
		Should the animation yoyo? (reverse back down to the start) before repeating?
	**/
	var yoyo : Bool;
	/**
		Should sprite.visible = true when the animation starts to play?
	**/
	var showOnStart : Bool;
	/**
		Should sprite.visible = false when the animation finishes?
	**/
	var hideOnComplete : Bool;
};