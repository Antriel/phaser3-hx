package global.phaser.types.time;

typedef TimerEventConfig = {
	/**
		The delay after which the Timer Event should fire, in milliseconds.
	**/
	@:optional
	var delay : Float;
	/**
		The total number of times the Timer Event will repeat before finishing.
	**/
	@:optional
	var repeat : Float;
	/**
		`true` if the Timer Event should repeat indefinitely.
	**/
	@:optional
	var loop : Bool;
	/**
		The callback which will be called when the Timer Event fires.
	**/
	@:optional
	var callback : haxe.Constraints.Function;
	/**
		The scope (`this` object) with which to invoke the `callback`.
	**/
	@:optional
	var callbackScope : Dynamic;
	/**
		Additional arguments to be passed to the `callback`.
	**/
	@:optional
	var args : Array<Dynamic>;
	/**
		The scale of the elapsed time.
	**/
	@:optional
	var timeScale : Float;
	/**
		The initial elapsed time in milliseconds. Useful if you want a long duration with repeat, but for the first loop to fire quickly.
	**/
	@:optional
	var startAt : Float;
	/**
		`true` if the Timer Event should be paused.
	**/
	@:optional
	var paused : Bool;
};