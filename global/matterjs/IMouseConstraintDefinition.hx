package global.matterjs;

typedef IMouseConstraintDefinition = {
	/**
		The `Constraint` object that is used to move the body during interaction.
	**/
	@:optional
	var constraint : ConstraintType;
	/**
		An `Object` that specifies the collision filter properties.
		The collision filter allows the user to define which types of body this mouse constraint can interact with.
		See `body.collisionFilter` for more information.
	**/
	@:optional
	var collisionFilter : ICollisionFilter;
	/**
		The `Body` that is currently being moved by the user, or `null` if no body.
	**/
	@:optional
	var body : BodyType;
	/**
		A `String` denoting the type of object.
	**/
	@:optional
	var type : String;
};