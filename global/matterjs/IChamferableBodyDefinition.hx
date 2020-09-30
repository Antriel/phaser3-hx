package global.matterjs;

typedef IChamferableBodyDefinition = {
	@:optional
	var chamfer : IChamfer;
	/**
		A `Number` specifying the angle of the body, in radians.
	**/
	@:optional
	var angle : Float;
	/**
		A `Number` that _measures_ the current angular speed of the body after the last `Body.update`. It is read-only and always positive (it's the magnitude of `body.angularVelocity`).
	**/
	@:optional
	var angularSpeed : Float;
	/**
		A `Number` that _measures_ the current angular velocity of the body after the last `Body.update`. It is read-only.
		If you need to modify a body's angular velocity directly, you should apply a torque or simply change the body's `angle` (as the engine uses position-Verlet integration).
	**/
	@:optional
	var angularVelocity : Float;
	/**
		A `Number` that _measures_ the area of the body's convex hull, calculated at creation by `Body.create`.
	**/
	@:optional
	var area : Float;
	/**
		An array of unique axis vectors (edge normals) used for collision detection.
		These are automatically calculated from the given convex hull (`vertices` array) in `Body.create`.
		They are constantly updated by `Body.update` during the simulation.
	**/
	@:optional
	var axes : Array<Vector>;
	/**
		A `Bounds` object that defines the AABB region for the body.
		It is automatically calculated from the given convex hull (`vertices` array) in `Body.create` and constantly updated by `Body.update` during simulation.
	**/
	@:optional
	var bounds : IBound;
	/**
		A `Number` that defines the density of the body, that is its mass per unit area.
		If you pass the density via `Body.create` the `mass` property is automatically calculated for you based on the size (area) of the object.
		This is generally preferable to simply setting mass and allows for more intuitive definition of materials (e.g. rock has a higher density than wood).
	**/
	@:optional
	var density : Float;
	/**
		A `Vector` that specifies the force to apply in the current step. It is zeroed after every `Body.update`. See also `Body.applyForce`.
	**/
	@:optional
	var force : Vector;
	/**
		A `Number` that defines the friction of the body. The value is always positive and is in the range `(0, 1)`.
		A value of `0` means that the body may slide indefinitely.
		A value of `1` means the body may come to a stop almost instantly after a force is applied.
		
		The effects of the value may be non-linear.
		High values may be unstable depending on the body.
		The engine uses a Coulomb friction model including static and kinetic friction.
		Note that collision response is based on _pairs_ of bodies, and that `friction` values are _combined_ with the following formula:
		
		     Math.min(bodyA.friction, bodyB.friction)
	**/
	@:optional
	var friction : Float;
	/**
		A `Number` that defines the air friction of the body (air resistance).
		A value of `0` means the body will never slow as it moves through space.
		The higher the value, the faster a body slows when moving through space.
		The effects of the value are non-linear.
	**/
	@:optional
	var frictionAir : Float;
	/**
		A `Number` that defines the moment of inertia (i.e. second moment of area) of the body.
		It is automatically calculated from the given convex hull (`vertices` array) and density in `Body.create`.
		If you modify this value, you must also modify the `body.inverseInertia` property (`1 / inertia`).
	**/
	@:optional
	var inertia : Float;
	/**
		A `Number` that defines the inverse moment of inertia of the body (`1 / inertia`).
		If you modify this value, you must also modify the `body.inertia` property.
	**/
	@:optional
	var inverseInertia : Float;
	/**
		A `Number` that defines the inverse mass of the body (`1 / mass`).
		If you modify this value, you must also modify the `body.mass` property.
	**/
	@:optional
	var inverseMass : Float;
	/**
		A flag that indicates whether a body is a sensor. Sensor triggers collision events, but doesn't react with colliding body physically.
	**/
	@:optional
	var isSensor : Bool;
	/**
		A flag that indicates whether the body is considered sleeping. A sleeping body acts similar to a static body, except it is only temporary and can be awoken.
		If you need to set a body as sleeping, you should use `Sleeping.set` as this requires more than just setting this flag.
	**/
	@:optional
	var isSleeping : Bool;
	/**
		A flag that indicates whether a body is considered static. A static body can never change position or angle and is completely fixed.
		If you need to set a body as static after its creation, you should use `Body.setStatic` as this requires more than just setting this flag.
	**/
	@:optional
	var isStatic : Bool;
	/**
		An arbitrary `String` name to help the user identify and manage bodies.
	**/
	@:optional
	var label : String;
	/**
		A `Number` that defines the mass of the body, although it may be more appropriate to specify the `density` property instead.
		If you modify this value, you must also modify the `body.inverseMass` property (`1 / mass`).
	**/
	@:optional
	var mass : Float;
	/**
		A `Number` that _measures_ the amount of movement a body currently has (a combination of `speed` and `angularSpeed`). It is read-only and always positive.
		It is used and updated by the `Matter.Sleeping` module during simulation to decide if a body has come to rest.
	**/
	@:optional
	var motion : Float;
	/**
		A `Vector` that specifies the current world-space position of the body.
	**/
	@:optional
	var position : Vector;
	/**
		An `Object` that defines the rendering properties to be consumed by the module `Matter.Render`.
	**/
	@:optional
	var render : IBodyRenderOptions;
	/**
		A `Number` that defines the restitution (elasticity) of the body. The value is always positive and is in the range `(0, 1)`.
		A value of `0` means collisions may be perfectly inelastic and no bouncing may occur.
		A value of `0.8` means the body may bounce back with approximately 80% of its kinetic energy.
		Note that collision response is based on _pairs_ of bodies, and that `restitution` values are _combined_ with the following formula:
		
		     Math.max(bodyA.restitution, bodyB.restitution)
	**/
	@:optional
	var restitution : Float;
	/**
		A `Number` that defines the number of updates in which this body must have near-zero velocity before it is set as sleeping by the `Matter.Sleeping` module (if sleeping is enabled by the engine).
	**/
	@:optional
	var sleepThreshold : Float;
	/**
		A `Number` that specifies a tolerance on how far a body is allowed to 'sink' or rotate into other bodies.
		Avoid changing this value unless you understand the purpose of `slop` in physics engines.
		The default should generally suffice, although very large bodies may require larger values for stable stacking.
	**/
	@:optional
	var slop : Float;
	/**
		A `Number` that _measures_ the current speed of the body after the last `Body.update`. It is read-only and always positive (it's the magnitude of `body.velocity`).
	**/
	@:optional
	var speed : Float;
	/**
		A `Number` that allows per-body time scaling, e.g. a force-field where bodies inside are in slow-motion, while others are at full speed.
	**/
	@:optional
	var timeScale : Float;
	/**
		A `Number` that specifies the torque (turning force) to apply in the current step. It is zeroed after every `Body.update`.
	**/
	@:optional
	var torque : Float;
	/**
		A `String` denoting the type of object.
	**/
	@:optional
	var type : String;
	/**
		A `Vector` that _measures_ the current velocity of the body after the last `Body.update`. It is read-only.
		If you need to modify a body's velocity directly, you should either apply a force or simply change the body's `position` (as the engine uses position-Verlet integration).
	**/
	@:optional
	var velocity : Vector;
	/**
		An array of `Vector` objects that specify the convex hull of the rigid body.
		These should be provided about the origin `(0, 0)`. E.g.
		
		     [{ x: 0, y: 0 }, { x: 25, y: 50 }, { x: 50, y: 0 }]
		
		When passed via `Body.create`, the vertices are translated relative to `body.position` (i.e. world-space, and constantly updated by `Body.update` during simulation).
		The `Vector` objects are also augmented with additional properties required for efficient collision detection.
		
		Other properties such as `inertia` and `bounds` are automatically calculated from the passed vertices (unless provided via `options`).
		Concave hulls are not currently supported. The module `Matter.Vertices` contains useful methods for working with vertices.
	**/
	@:optional
	var vertices : Array<Vector>;
	/**
		An array of bodies that make up this body.
		The first body in the array must always be a self reference to the current body instance.
		All bodies in the `parts` array together form a single rigid compound body.
		Parts are allowed to overlap, have gaps or holes or even form concave bodies.
		Parts themselves should never be added to a `World`, only the parent body should be.
		Use `Body.setParts` when setting parts to ensure correct updates of all properties.
	**/
	@:optional
	var parts : Array<BodyType>;
	/**
		A self reference if the body is _not_ a part of another body.
		Otherwise this is a reference to the body that this is a part of.
		See `body.parts`.
	**/
	@:optional
	var parent : BodyType;
	/**
		A `Number` that defines the static friction of the body (in the Coulomb friction model).
		A value of `0` means the body will never 'stick' when it is nearly stationary and only dynamic `friction` is used.
		The higher the value (e.g. `10`), the more force it will take to initially get the body moving when nearly stationary.
		This value is multiplied with the `friction` property to make it easier to change `friction` and maintain an appropriate amount of static friction.
	**/
	@:optional
	var frictionStatic : Float;
	/**
		An `Object` that specifies the collision filtering properties of this body.
		
		Collisions between two bodies will obey the following rules:
		- If the two bodies have the same non-zero value of `collisionFilter.group`,
		   they will always collide if the value is positive, and they will never collide
		   if the value is negative.
		- If the two bodies have different values of `collisionFilter.group` or if one
		   (or both) of the bodies has a value of 0, then the category/mask rules apply as follows:
		
		Each body belongs to a collision category, given by `collisionFilter.category`. This
		value is used as a bit field and the category should have only one bit set, meaning that
		the value of this property is a power of two in the range [1, 2^31]. Thus, there are 32
		different collision categories available.
		
		Each body also defines a collision bitmask, given by `collisionFilter.mask` which specifies
		the categories it collides with (the value is the bitwise AND value of all these categories).
		
		Using the category/mask rules, two bodies `A` and `B` collide if each includes the other's
		category in its mask, i.e. `(categoryA & maskB) !== 0` and `(categoryB & maskA) !== 0`
		are both true.
	**/
	@:optional
	var collisionFilter : ICollisionFilter;
	/**
		A reference to the Phaser Game Object this body belongs to, if any.
	**/
	@:optional
	var gameObject : Dynamic;
	/**
		Scale the influence of World gravity when applied to this body.
	**/
	@:optional
	var gravityScale : Vector;
	/**
		Will this Body ignore World gravity during the Engine update?
	**/
	@:optional
	var ignoreGravity : Bool;
	/**
		Will this Body ignore Phaser Pointer input events?
	**/
	@:optional
	var ignorePointer : Bool;
	/**
		A callback that is invoked when this Body starts colliding with any other Body.
		
		You can register callbacks by providing a function of type `( pair: Matter.Pair) => void`.
	**/
	@:optional
	var onCollideCallback : haxe.Constraints.Function;
	/**
		A callback that is invoked when this Body stops colliding with any other Body.
		
		You can register callbacks by providing a function of type `( pair: Matter.Pair) => void`.
	**/
	@:optional
	var onCollideEndCallback : haxe.Constraints.Function;
	/**
		A callback that is invoked for the duration that this Body is colliding with any other Body.
		
		You can register callbacks by providing a function of type `( pair: Matter.Pair) => void`.
	**/
	@:optional
	var onCollideActiveCallback : haxe.Constraints.Function;
	/**
		A collision callback dictionary used by the `Body.setOnCollideWith` function.
	**/
	@:optional
	var onCollideWith : Dynamic;
};