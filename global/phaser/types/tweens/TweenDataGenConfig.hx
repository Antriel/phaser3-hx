package global.phaser.types.tweens;

typedef TweenDataGenConfig = {
	/**
		Time in ms/frames before tween will start.
	**/
	var delay : haxe.Constraints.Function;
	/**
		Duration of the tween in ms/frames, excludes time for yoyo or repeats.
	**/
	var duration : haxe.Constraints.Function;
	/**
		Time in ms/frames the tween will pause before running the yoyo or starting a repeat.
	**/
	var hold : haxe.Constraints.Function;
	/**
		Number of times to repeat the tween. The tween will always run once regardless, so a repeat value of '1' will play the tween twice.
	**/
	var repeat : haxe.Constraints.Function;
	/**
		Time in ms/frames before the repeat will start.
	**/
	var repeatDelay : haxe.Constraints.Function;
};