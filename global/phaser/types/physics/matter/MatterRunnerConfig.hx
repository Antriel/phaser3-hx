package global.phaser.types.physics.matter;

typedef MatterRunnerConfig = {
	/**
		A boolean that specifies if the runner should use a fixed timestep (otherwise it is variable). If timing is fixed, then the apparent simulation speed will change depending on the frame rate (but behaviour will be deterministic). If the timing is variable, then the apparent simulation speed will be constant (approximately, but at the cost of determininism).
	**/
	@:optional
	var isFixed : Bool;
	/**
		A number that specifies the frame rate in seconds. If you don't specify this, but do specify `delta`, those values set the fps rate.
	**/
	@:optional
	var fps : Float;
	/**
		A number that specifies the time correction factor to apply to the update. This can help improve the accuracy of the simulation in cases where delta is changing between updates.
	**/
	@:optional
	var correction : Float;
	/**
		The size of the delta smoothing array when `isFixed` is `false`.
	**/
	@:optional
	var deltaSampleSize : Float;
	/**
		A number that specifies the time step between updates in milliseconds. If you set the `fps` property, this value is set based on that. If `isFixed` is set to `true`, then `delta` is fixed. If it is `false`, then `delta` can dynamically change to maintain the correct apparent simulation speed.
	**/
	@:optional
	var delta : Float;
	/**
		A number that specifies the minimum time step between updates in milliseconds.
	**/
	@:optional
	var deltaMin : Float;
	/**
		A number that specifies the maximum time step between updates in milliseconds.
	**/
	@:optional
	var deltaMax : Float;
};