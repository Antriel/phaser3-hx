package global.phaser.types.physics.matter;

typedef MatterConstraintConfig = {
	/**
		An arbitrary string-based name to help identify this constraint.
	**/
	@:optional
	var label : String;
	/**
		The first possible `Body` that this constraint is attached to.
	**/
	@:optional
	var bodyA : global.matterjs.BodyType;
	/**
		The second possible `Body` that this constraint is attached to.
	**/
	@:optional
	var bodyB : global.matterjs.BodyType;
	/**
		A `Vector` that specifies the offset of the constraint from center of the `constraint.bodyA` if defined, otherwise a world-space position.
	**/
	@:optional
	var pointA : global.phaser.types.math.Vector2Like;
	/**
		A `Vector` that specifies the offset of the constraint from center of the `constraint.bodyB` if defined, otherwise a world-space position.
	**/
	@:optional
	var pointB : global.phaser.types.math.Vector2Like;
	/**
		A `Number` that specifies the stiffness of the constraint, i.e. the rate at which it returns to its resting `constraint.length`. A value of `1` means the constraint should be very stiff. A value of `0.2` means the constraint acts like a soft spring.
	**/
	@:optional
	var stiffness : Float;
	/**
		A `Number` that specifies the angular stiffness of the constraint.
	**/
	@:optional
	var angularStiffness : Float;
	/**
		The angleA of the constraint. If bodyA is set, the angle of bodyA is used instead.
	**/
	@:optional
	var angleA : Float;
	/**
		The angleB of the constraint. If bodyB is set, the angle of bodyB is used instead.
	**/
	@:optional
	var angleB : Float;
	/**
		A `Number` that specifies the damping of the constraint, i.e. the amount of resistance applied to each body based on their velocities to limit the amount of oscillation. Damping will only be apparent when the constraint also has a very low `stiffness`. A value of `0.1` means the constraint will apply heavy damping, resulting in little to no oscillation. A value of `0` means the constraint will apply no damping.
	**/
	@:optional
	var damping : Float;
	/**
		A `Number` that specifies the target resting length of the constraint. It is calculated automatically in `Constraint.create` from initial positions of the `constraint.bodyA` and `constraint.bodyB`.
	**/
	@:optional
	var length : Float;
	/**
		An object reserved for storing plugin-specific properties.
	**/
	@:optional
	var plugin : Dynamic;
	/**
		The Debug Render configuration object for this constraint.
	**/
	@:optional
	var render : MatterConstraintRenderConfig;
};