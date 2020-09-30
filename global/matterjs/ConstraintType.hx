package global.matterjs;

typedef ConstraintType = {
	/**
		The first possible `Body` that this constraint is attached to.
	**/
	@:optional
	var bodyA : BodyType;
	/**
		The second possible `Body` that this constraint is attached to.
	**/
	@:optional
	var bodyB : BodyType;
	/**
		A `Vector` that specifies the offset of the constraint from center of the `constraint.bodyA` if defined, otherwise a world-space position.
	**/
	var pointA : Vector;
	/**
		A `Vector` that specifies the offset of the constraint from center of the `constraint.bodyB` if defined, otherwise a world-space position.
	**/
	var pointB : Vector;
	/**
		A `Number` that specifies the target resting length of the constraint. 
		It is calculated automatically in `Constraint.create` from initial positions of the `constraint.bodyA` and `constraint.bodyB`.
	**/
	var length : Float;
	/**
		An integer `Number` uniquely identifying number generated in `Composite.create` by `Common.nextId`.
	**/
	var id : Float;
	/**
		An arbitrary `String` name to help the user identify and manage bodies.
	**/
	var label : String;
	/**
		A `String` denoting the type of object.
	**/
	var type : String;
	/**
		A `Number` that specifies the stiffness of the constraint, i.e. the rate at which it returns to its resting `constraint.length`.
		A value of `1` means the constraint should be very stiff.
		A value of `0.2` means the constraint acts like a soft spring.
	**/
	var stiffness : Float;
	/**
		A `Number` that specifies the damping of the constraint, 
		i.e. the amount of resistance applied to each body based on their velocities to limit the amount of oscillation.
		Damping will only be apparent when the constraint also has a very low `stiffness`.
		A value of `0.1` means the constraint will apply heavy damping, resulting in little to no oscillation.
		A value of `0` means the constraint will apply no damping.
	**/
	var damping : Float;
	/**
		A `Number` that specifies the angular stiffness of the constraint.
	**/
	var angularStiffness : Float;
	/**
		Either the angle of BodyA, or a config value.
	**/
	var angleA : Float;
	/**
		Either the angle of BodyB, or a config value.
	**/
	var angleB : Float;
	/**
		An object reserved for storing plugin-specific properties.
	**/
	var plugin : Dynamic;
	/**
		An `Object` that defines the rendering properties to be consumed by the module `Matter.Render`.
	**/
	var render : IConstraintRenderDefinition;
};