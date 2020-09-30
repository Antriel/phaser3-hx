package global.matterjs;

typedef IEngineDefinition = {
	/**
		An integer `Number` that specifies the number of position iterations to perform each update.
		The higher the value, the higher quality the simulation will be at the expense of performance.
	**/
	@:optional
	var positionIterations : Float;
	/**
		An integer `Number` that specifies the number of velocity iterations to perform each update.
		The higher the value, the higher quality the simulation will be at the expense of performance.
	**/
	@:optional
	var velocityIterations : Float;
	/**
		An integer `Number` that specifies the number of constraint iterations to perform each update.
		The higher the value, the higher quality the simulation will be at the expense of performance.
		The default value of `2` is usually very adequate.
	**/
	@:optional
	var constraintIterations : Float;
	/**
		A flag that specifies whether the engine should allow sleeping via the `Matter.Sleeping` module.
		Sleeping can improve stability and performance, but often at the expense of accuracy.
	**/
	@:optional
	var enableSleeping : Bool;
	/**
		An `Object` containing properties regarding the timing systems of the engine.
	**/
	@:optional
	var timing : IEngineTimingOptions;
	/**
		An instance of a broadphase controller. The default value is a `Matter.Grid` instance created by `Engine.create`.
	**/
	@:optional
	var grid : Grid;
	/**
		A `World` composite object that will contain all simulated bodies and constraints.
	**/
	@:optional
	var world : World;
};