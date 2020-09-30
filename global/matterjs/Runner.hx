package global.matterjs;

/**
	The `Matter.Runner` module is an optional utility which provides a game loop,
	that handles updating and rendering a `Matter.Engine` for you within a browser.
	It is intended for demo and testing purposes, but may be adequate for simple games.
	If you are using your own game loop instead, then you do not need the `Matter.Runner` module.
	Instead just call `Engine.update(engine, delta)` in your own loop.
	Note that the method `Engine.run` is an alias for `Runner.run`.
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.Runner") extern class Runner {
	function new();
	/**
		A flag that specifies whether the runner is running or not.
	**/
	var enabled : Bool;
	/**
		A `Boolean` that specifies if the runner should use a fixed timestep (otherwise it is variable).
		If timing is fixed, then the apparent simulation speed will change depending on the frame rate (but behaviour will be deterministic).
		If the timing is variable, then the apparent simulation speed will be constant (approximately, but at the cost of determininism).
	**/
	var isFixed : Bool;
	/**
		A `Number` that specifies the time step between updates in milliseconds.
		If `engine.timing.isFixed` is set to `true`, then `delta` is fixed.
		If it is `false`, then `delta` can dynamically change to maintain the correct apparent simulation speed.
	**/
	var delta : Float;
	static var prototype : Runner;
	/**
		Creates a new Runner. The options parameter is an object that specifies any properties you wish to override the defaults.
	**/
	static function create(options:IRunnerOptions):Runner;
	/**
		Continuously ticks a `Matter.Engine` by calling `Runner.tick` on the `requestAnimationFrame` event.
		
		Continuously ticks a `Matter.Engine` by calling `Runner.tick` on the `requestAnimationFrame` event.
	**/
	@:overload(function(engine:Engine):Runner { })
	static function run(runner:Runner, engine:Engine):Runner;
	/**
		A game loop utility that updates the engine and renderer by one step (a 'tick').
		Features delta smoothing, time correction and fixed or dynamic timing.
		Triggers `beforeTick`, `tick` and `afterTick` events on the engine.
		Consider just `Engine.update(engine, delta)` if you're using your own loop.
	**/
	static function tick(runner:Runner, engine:Engine, time:Float):Void;
	/**
		Ends execution of `Runner.run` on the given `runner`, by canceling the animation frame request event loop.
		If you wish to only temporarily pause the engine, see `engine.enabled` instead.
	**/
	static function stop(runner:Runner):Void;
	/**
		Alias for `Runner.run`.
	**/
	static function start(runner:Runner, engine:Engine):Void;
}