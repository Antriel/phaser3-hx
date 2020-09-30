package global.phaser.types.physics.matter;

typedef MatterWorldConfig = {
	/**
		Sets {@link Phaser.Physics.Matter.World#gravity}. If `false` Gravity will be set to zero.
	**/
	@:optional
	var gravity : ts.AnyOf2<Bool, global.phaser.types.math.Vector2Like>;
	/**
		Should the world have bounds enabled by default?
	**/
	@:optional
	var setBounds : ts.AnyOf2<Bool, Dynamic>;
	/**
		The x coordinate of the world bounds.
	**/
	@:optional
	@:native("setBounds.x")
	var setBounds_x : Float;
	/**
		The y coordinate of the world bounds.
	**/
	@:optional
	@:native("setBounds.y")
	var setBounds_y : Float;
	/**
		The width of the world bounds.
	**/
	@:optional
	@:native("setBounds.width")
	var setBounds_width : Float;
	/**
		The height of the world bounds.
	**/
	@:optional
	@:native("setBounds.height")
	var setBounds_height : Float;
	/**
		The thickness of the walls of the world bounds.
	**/
	@:optional
	@:native("setBounds.thickness")
	var setBounds_thickness : Float;
	/**
		Should the left-side world bounds wall be created?
	**/
	@:optional
	@:native("setBounds.left")
	var setBounds_left : Bool;
	/**
		Should the right-side world bounds wall be created?
	**/
	@:optional
	@:native("setBounds.right")
	var setBounds_right : Bool;
	/**
		Should the top world bounds wall be created?
	**/
	@:optional
	@:native("setBounds.top")
	var setBounds_top : Bool;
	/**
		Should the bottom world bounds wall be created?
	**/
	@:optional
	@:native("setBounds.bottom")
	var setBounds_bottom : Bool;
	/**
		The number of position iterations to perform each update. The higher the value, the higher quality the simulation will be at the expense of performance.
	**/
	@:optional
	var positionIterations : Float;
	/**
		The number of velocity iterations to perform each update. The higher the value, the higher quality the simulation will be at the expense of performance.
	**/
	@:optional
	var velocityIterations : Float;
	/**
		The number of constraint iterations to perform each update. The higher the value, the higher quality the simulation will be at the expense of performance.
	**/
	@:optional
	var constraintIterations : Float;
	/**
		A flag that specifies whether the engine should allow sleeping via the `Matter.Sleeping` module. Sleeping can improve stability and performance, but often at the expense of accuracy.
	**/
	@:optional
	var enableSleeping : Bool;
	/**
		A `Number` that specifies the current simulation-time in milliseconds starting from `0`. It is incremented on every `Engine.update` by the given `delta` argument.
	**/
	@:optional
	@:native("timing.timestamp")
	var timing_timestamp : Float;
	/**
		A `Number` that specifies the global scaling factor of time for all bodies. A value of `0` freezes the simulation. A value of `0.1` gives a slow-motion effect. A value of `1.2` gives a speed-up effect.
	**/
	@:optional
	@:native("timing.timeScale")
	var timing_timeScale : Float;
	/**
		Should the Matter Attractor Plugin be enabled? An attractors plugin that makes it easy to apply continual forces on bodies. It's possible to simulate effects such as wind, gravity and magnetism.
	**/
	@:optional
	@:native("plugins.attractors")
	var plugins_attractors : Bool;
	/**
		Should the Matter Wrap Plugin be enabled? A coordinate wrapping plugin that automatically wraps the position of bodies such that they always stay within the given bounds. Upon crossing a boundary the body will appear on the opposite side of the bounds, while maintaining its velocity.
	**/
	@:optional
	@:native("plugins.wrap")
	var plugins_wrap : Bool;
	/**
		Should the Matter Collision Events Plugin be enabled?
	**/
	@:optional
	@:native("plugins.collisionevents")
	var plugins_collisionevents : Bool;
	/**
		Toggles if the world is enabled or not.
	**/
	@:optional
	var enabled : Bool;
	/**
		An optional Number that specifies the time correction factor to apply to the update.
	**/
	@:optional
	var correction : Float;
	/**
		This function is called every time the core game loop steps, which is bound to the Request Animation Frame frequency unless otherwise modified.
	**/
	@:optional
	var getDelta : haxe.Constraints.Function;
	/**
		Automatically call Engine.update every time the game steps.
	**/
	@:optional
	var autoUpdate : Bool;
	/**
		Sets the Resolver resting threshold property.
	**/
	@:optional
	var restingThresh : Float;
	/**
		Sets the Resolver resting threshold tangent property.
	**/
	@:optional
	var restingThreshTangent : Float;
	/**
		Sets the Resolver position dampen property.
	**/
	@:optional
	var positionDampen : Float;
	/**
		Sets the Resolver position warming property.
	**/
	@:optional
	var positionWarming : Float;
	/**
		Sets the Resolver friction normal multiplier property.
	**/
	@:optional
	var frictionNormalMultiplier : Float;
	/**
		Controls the Matter Debug Rendering options. If a boolean it will use the default values, otherwise, specify a Debug Config object.
	**/
	@:optional
	var debug : ts.AnyOf2<Bool, MatterDebugConfig>;
	/**
		Sets the Matter Runner options.
	**/
	@:optional
	var runner : MatterRunnerConfig;
};