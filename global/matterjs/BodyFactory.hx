package global.matterjs;

@:native("MatterJS.BodyFactory") extern class BodyFactory {
	function new();
	/**
		Applies a force to a body from a given world-space position, including resulting torque.
	**/
	function applyForce(body:BodyType, position:Vector, force:Vector):Void;
	/**
		Creates a new rigid body model. The options parameter is an object that specifies any properties you wish to override the defaults.
		All properties have default values, and many are pre-calculated automatically based on other properties.
		See the properties section below for detailed information on what you can pass via the `options` object.
	**/
	function create(options:IChamferableBodyDefinition):BodyType;
	/**
		Rotates a body by a given angle relative to its current angle, without imparting any angular velocity.
	**/
	function rotate(body:BodyType, rotation:Float):Void;
	/**
		Returns the next unique group index for which bodies will collide.
		If `isNonColliding` is `true`, returns the next unique group index for which bodies will _not_ collide.
		See `body.collisionFilter` for more information.
	**/
	function nextGroup(isNonColliding:Bool):Float;
	/**
		Returns the next unique category bitfield (starting after the initial default category `0x0001`).
		There are 32 available. See `body.collisionFilter` for more information.
	**/
	function nextCategory():Float;
	/**
		Given a property and a value (or map of), sets the property(s) on the body, using the appropriate setter functions if they exist.
		Prefer to use the actual setter functions in performance critical situations.
	**/
	function set(body:BodyType, settings:Dynamic, ?value:Dynamic):Void;
	/**
		Sets the mass of the body. Inverse mass and density are automatically updated to reflect the change.
	**/
	function setMass(body:BodyType, mass:Float):Void;
	/**
		Sets the density of the body. Mass is automatically updated to reflect the change.
	**/
	function setDensity(body:BodyType, density:Float):Void;
	/**
		Sets the moment of inertia (i.e. second moment of area) of the body of the body.
		Inverse inertia is automatically updated to reflect the change. Mass is not changed.
	**/
	function setInertia(body:BodyType, inertia:Float):Void;
	/**
		Sets the body's vertices and updates body properties accordingly, including inertia, area and mass (with respect to `body.density`).
		Vertices will be automatically transformed to be orientated around their centre of mass as the origin.
		They are then automatically translated to world space based on `body.position`.
		
		The `vertices` argument should be passed as an array of `Matter.Vector` points (or a `Matter.Vertices` array).
		Vertices must form a convex hull, concave hulls are not supported.
	**/
	function setVertices(body:BodyType, vertices:Array<Vector>):Void;
	/**
		Sets the parts of the `body` and updates mass, inertia and centroid.
		Each part will have its parent set to `body`.
		By default the convex hull will be automatically computed and set on `body`, unless `autoHull` is set to `false.`
		Note that this method will ensure that the first part in `body.parts` will always be the `body`.
	**/
	function setParts(body:BodyType, parts:Array<BodyType>, ?autoHull:Bool):Void;
	/**
		Sets the position of the body instantly. Velocity, angle, force etc. are unchanged.
	**/
	function setPosition(body:BodyType, position:Vector):Void;
	/**
		Sets the angle of the body instantly. Angular velocity, position, force etc. are unchanged.
	**/
	function setAngle(body:BodyType, angle:Float):Void;
	/**
		Sets the linear velocity of the body instantly. Position, angle, force etc. are unchanged. See also `Body.applyForce`.
	**/
	function setVelocity(body:BodyType, velocity:Vector):Void;
	/**
		Sets the angular velocity of the body instantly. Position, angle, force etc. are unchanged. See also `Body.applyForce`.
	**/
	function setAngularVelocity(body:BodyType, velocity:Float):Void;
	/**
		Sets the body as static, including isStatic flag and setting mass and inertia to Infinity.
	**/
	function setStatic(body:BodyType, isStatic:Bool):Void;
	/**
		Scales the body, including updating physical properties (mass, area, axes, inertia), from a world-space point (default is body centre).
	**/
	function scale(body:BodyType, scaleX:Float, scaleY:Float, ?point:Vector):Void;
	/**
		Moves a body by a given vector relative to its current position, without imparting any velocity.
	**/
	function translate(body:BodyType, translation:Vector):Void;
	/**
		Performs a simulation step for the given `body`, including updating position and angle using Verlet integration.
	**/
	function update(body:BodyType, deltaTime:Float, timeScale:Float, correction:Float):Void;
	static var prototype : BodyFactory;
}