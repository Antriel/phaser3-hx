package global.matterjs;

/**
	The `Matter.Engine` module contains methods for creating and manipulating engines.
	An engine is a controller that manages updating the simulation of the world.
	See `Matter.Runner` for an optional game loop utility.
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.Engine") extern class Engine {
	function new();
	/**
		An instance of a broadphase controller. The default value is a `Matter.Grid` instance created by `Engine.create`.
	**/
	var broadphase : Grid;
	/**
		An integer `Number` that specifies the number of constraint iterations to perform each update.
		The higher the value, the higher quality the simulation will be at the expense of performance.
		The default value of `2` is usually very adequate.
	**/
	var constraintIterations : Float;
	/**
		A flag that specifies whether the engine is running or not.
	**/
	var enabled : Bool;
	/**
		A flag that specifies whether the engine should allow sleeping via the `Matter.Sleeping` module.
		Sleeping can improve stability and performance, but often at the expense of accuracy.
	**/
	var enableSleeping : Bool;
	/**
		Collision pair set for this `Engine`.
	**/
	var pairs : Dynamic;
	/**
		An integer `Number` that specifies the number of position iterations to perform each update.
		The higher the value, the higher quality the simulation will be at the expense of performance.
	**/
	var positionIterations : Float;
	/**
		An `Object` containing properties regarding the timing systems of the engine.
	**/
	var timing : IEngineTimingOptions;
	/**
		An integer `Number` that specifies the number of velocity iterations to perform each update.
		The higher the value, the higher quality the simulation will be at the expense of performance.
	**/
	var velocityIterations : Float;
	/**
		A `World` composite object that will contain all simulated bodies and constraints.
	**/
	var world : World;
	static var prototype : Engine;
	/**
		Clears the engine including the world, pairs and broadphase.
	**/
	static function clear(engine:Engine):Void;
	/**
		Creates a new engine. The options parameter is an object that specifies any properties you wish to override the defaults.
		All properties have default values, and many are pre-calculated automatically based on other properties.
		See the properties section below for detailed information on what you can pass via the `options` object.
		
		Creates a new engine. The options parameter is an object that specifies any properties you wish to override the defaults.
		All properties have default values, and many are pre-calculated automatically based on other properties.
		See the properties section below for detailed information on what you can pass via the `options` object.
	**/
	@:overload(function(?options:IEngineDefinition):Engine { })
	static function create(?element:ts.AnyOf2<js.html.Element, IEngineDefinition>, ?options:IEngineDefinition):Engine;
	/**
		Merges two engines by keeping the configuration of `engineA` but replacing the world with the one from `engineB`.
	**/
	static function merge(engineA:Engine, engineB:Engine):Void;
	/**
		Moves the simulation forward in time by `delta` ms.
		The `correction` argument is an optional `Number` that specifies the time correction factor to apply to the update.
		This can help improve the accuracy of the simulation in cases where `delta` is changing between updates.
		The value of `correction` is defined as `delta / lastDelta`, i.e. the percentage change of `delta` over the last step.
		Therefore the value is always `1` (no correction) when `delta` constant (or when no correction is desired, which is the default).
		See the paper on <a href="http://lonesock.net/article/verlet.html">Time Corrected Verlet</a> for more information.
		
		Triggers `beforeUpdate` and `afterUpdate` events.
		Triggers `collisionStart`, `collisionActive` and `collisionEnd` events.
	**/
	static function update(engine:Engine, ?delta:Float, ?correction:Float):Engine;
	/**
		An alias for `Runner.run`, see `Matter.Runner` for more information.
	**/
	static function run(engine:Engine):Void;
}