package global.phaser.types.core;

typedef FPSConfig = {
	/**
		The minimum acceptable rendering rate, in frames per second.
	**/
	@:optional
	var min : Float;
	/**
		The optimum rendering rate, in frames per second.
	**/
	@:optional
	var target : Float;
	/**
		Use setTimeout instead of requestAnimationFrame to run the game loop.
	**/
	@:optional
	var forceSetTimeOut : Bool;
	/**
		Calculate the average frame delta from this many consecutive frame intervals.
	**/
	@:optional
	var deltaHistory : Float;
	/**
		The amount of frames the time step counts before we trust the delta values again.
	**/
	@:optional
	var panicMax : Float;
	/**
		Apply delta smoothing during the game update to help avoid spikes?
	**/
	@:optional
	var smoothStep : Bool;
};