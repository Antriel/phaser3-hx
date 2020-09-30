package global.matterjs;

typedef IRunnerOptions = {
	/**
		A `Boolean` that specifies if the runner should use a fixed timestep (otherwise it is variable).
		If timing is fixed, then the apparent simulation speed will change depending on the frame rate (but behaviour will be deterministic).
		If the timing is variable, then the apparent simulation speed will be constant (approximately, but at the cost of determininism).
	**/
	@:optional
	var isFixed : Bool;
	/**
		A `Number` that specifies the time step between updates in milliseconds.
		If `engine.timing.isFixed` is set to `true`, then `delta` is fixed.
		If it is `false`, then `delta` can dynamically change to maintain the correct apparent simulation speed.
	**/
	@:optional
	var delta : Float;
};