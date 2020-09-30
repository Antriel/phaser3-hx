package global.phaser.types.tweens;

typedef TweenConfigDefaults = {
	/**
		The object, or an array of objects, to run the tween on.
	**/
	var targets : ts.AnyOf2<Dynamic, Array<Dynamic>>;
	/**
		The number of milliseconds to delay before the tween will start.
	**/
	@:optional
	var delay : Float;
	/**
		The duration of the tween in milliseconds.
	**/
	@:optional
	var duration : Float;
	/**
		The easing equation to use for the tween.
	**/
	@:optional
	var ease : String;
	/**
		Optional easing parameters.
	**/
	@:optional
	var easeParams : Array<Dynamic>;
	/**
		The number of milliseconds to hold the tween for before yoyo'ing.
	**/
	@:optional
	var hold : Float;
	/**
		The number of times to repeat the tween.
	**/
	@:optional
	var repeat : Float;
	/**
		The number of milliseconds to pause before a tween will repeat.
	**/
	@:optional
	var repeatDelay : Float;
	/**
		Should the tween complete, then reverse the values incrementally to get back to the starting tween values? The reverse tweening will also take `duration` milliseconds to complete.
	**/
	@:optional
	var yoyo : Bool;
	/**
		Horizontally flip the target of the Tween when it completes (before it yoyos, if set to do so). Only works for targets that support the `flipX` property.
	**/
	@:optional
	var flipX : Bool;
	/**
		Vertically flip the target of the Tween when it completes (before it yoyos, if set to do so). Only works for targets that support the `flipY` property.
	**/
	@:optional
	var flipY : Bool;
};