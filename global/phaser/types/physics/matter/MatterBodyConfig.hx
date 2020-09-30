package global.phaser.types.physics.matter;

typedef MatterBodyConfig = {
	/**
		An arbitrary string-based name to help identify this body.
	**/
	@:optional
	var label : String;
	/**
		An array of bodies that make up this body. The first body in the array must always be a self reference to the current body instance. All bodies in the `parts` array together form a single rigid compound body.
	**/
	@:optional
	var parts : Array<global.matterjs.BodyType>;
	/**
		An object reserved for storing plugin-specific properties.
	**/
	@:optional
	var plugin : Dynamic;
	/**
		A number specifying the angle of the body, in radians.
	**/
	@:optional
	var angle : Float;
	/**
		An array of `Vector` objects that specify the convex hull of the rigid body. These should be provided about the origin `(0, 0)`.
	**/
	@:optional
	var vertices : Array<global.phaser.types.math.Vector2Like>;
	/**
		A `Vector` that specifies the current world-space position of the body.
	**/
	@:optional
	var position : global.phaser.types.math.Vector2Like;
	/**
		A `Vector` that specifies the force to apply in the current step. It is zeroed after every `Body.update`. See also `Body.applyForce`.
	**/
	@:optional
	var force : global.phaser.types.math.Vector2Like;
	/**
		A `Number` that specifies the torque (turning force) to apply in the current step. It is zeroed after every `Body.update`.
	**/
	@:optional
	var torque : Float;
	/**
		A flag that indicates whether a body is a sensor. Sensor triggers collision events, but doesn't react with colliding body physically.
	**/
	@:optional
	var isSensor : Bool;
	/**
		A flag that indicates whether a body is considered static. A static body can never change position or angle and is completely fixed.
	**/
	@:optional
	var isStatic : Bool;
	/**
		A `Number` that defines the number of updates in which this body must have near-zero velocity before it is set as sleeping by the `Matter.Sleeping` module (if sleeping is enabled by the engine).
	**/
	@:optional
	var sleepThreshold : Float;
	/**
		A `Number` that defines the density of the body, that is its mass per unit area. If you pass the density via `Body.create` the `mass` property is automatically calculated for you based on the size (area) of the object. This is generally preferable to simply setting mass and allows for more intuitive definition of materials (e.g. rock has a higher density than wood).
	**/
	@:optional
	var density : Float;
	/**
		A `Number` that defines the restitution (elasticity) of the body. The value is always positive and is in the range `(0, 1)`.
	**/
	@:optional
	var restitution : Float;
	/**
		A `Number` that defines the friction of the body. The value is always positive and is in the range `(0, 1)`. A value of `0` means that the body may slide indefinitely. A value of `1` means the body may come to a stop almost instantly after a force is applied.
	**/
	@:optional
	var friction : Float;
	/**
		A `Number` that defines the static friction of the body (in the Coulomb friction model). A value of `0` means the body will never 'stick' when it is nearly stationary and only dynamic `friction` is used. The higher the value (e.g. `10`), the more force it will take to initially get the body moving when nearly stationary. This value is multiplied with the `friction` property to make it easier to change `friction` and maintain an appropriate amount of static friction.
	**/
	@:optional
	var frictionStatic : Float;
	/**
		A `Number` that defines the air friction of the body (air resistance). A value of `0` means the body will never slow as it moves through space. The higher the value, the faster a body slows when moving through space.
	**/
	@:optional
	var frictionAir : Float;
	/**
		An `Object` that specifies the collision filtering properties of this body.
	**/
	@:optional
	var collisionFilter : MatterCollisionFilter;
	/**
		A `Number` that specifies a tolerance on how far a body is allowed to 'sink' or rotate into other bodies. Avoid changing this value unless you understand the purpose of `slop` in physics engines. The default should generally suffice, although very large bodies may require larger values for stable stacking.
	**/
	@:optional
	var slop : Float;
	/**
		A `Number` that allows per-body time scaling, e.g. a force-field where bodies inside are in slow-motion, while others are at full speed.
	**/
	@:optional
	var timeScale : Float;
	/**
		A number, or array of numbers, to chamfer the vertices of the body, or a full Chamfer configuration object.
	**/
	@:optional
	var chamfer : ts.AnyOf3<Float, Array<Float>, MatterChamferConfig>;
	/**
		The radius of this body if a circle.
	**/
	@:optional
	var circleRadius : Float;
	/**
		A `Number` that defines the mass of the body, although it may be more appropriate to specify the `density` property instead. If you modify this value, you must also modify the `body.inverseMass` property (`1 / mass`).
	**/
	@:optional
	var mass : Float;
	/**
		A `Number` that defines the inverse mass of the body (`1 / mass`). If you modify this value, you must also modify the `body.mass` property.
	**/
	@:optional
	var inverseMass : Float;
	/**
		A `Vector` that specifies the initial scale of the body.
	**/
	@:optional
	var scale : global.phaser.types.math.Vector2Like;
	/**
		A `Vector` that scales the influence of World gravity when applied to this body.
	**/
	@:optional
	var gravityScale : global.phaser.types.math.Vector2Like;
	/**
		A boolean that toggles if this body should ignore world gravity or not.
	**/
	@:optional
	var ignoreGravity : Bool;
	/**
		A boolean that toggles if this body should ignore pointer / mouse constraints or not.
	**/
	@:optional
	var ignorePointer : Bool;
	/**
		The Debug Render configuration object for this body.
	**/
	@:optional
	var render : MatterBodyRenderConfig;
	/**
		A callback that is invoked when this Body starts colliding with any other Body. You can register callbacks by providing a function of type `( pair: Matter.Pair) => void`.
	**/
	@:optional
	var onCollideCallback : haxe.Constraints.Function;
	/**
		A callback that is invoked when this Body stops colliding with any other Body. You can register callbacks by providing a function of type `( pair: Matter.Pair) => void`.
	**/
	@:optional
	var onCollideEndCallback : haxe.Constraints.Function;
	/**
		A callback that is invoked for the duration that this Body is colliding with any other Body. You can register callbacks by providing a function of type `( pair: Matter.Pair) => void`.
	**/
	@:optional
	var onCollideActiveCallback : haxe.Constraints.Function;
	/**
		A collision callback dictionary used by the `Body.setOnCollideWith` function.
	**/
	@:optional
	var onCollideWith : Dynamic;
};