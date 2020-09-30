package global.matterjs;

/**
	The `Matter.MouseConstraint` module contains methods for creating mouse constraints.
	Mouse constraints are used for allowing user interaction, providing the ability to move bodies via the mouse or touch.
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.MouseConstraint") extern class MouseConstraint {
	function new();
	/**
		The `Constraint` object that is used to move the body during interaction.
	**/
	var constraint : ConstraintType;
	/**
		An `Object` that specifies the collision filter properties.
		The collision filter allows the user to define which types of body this mouse constraint can interact with.
		See `body.collisionFilter` for more information.
	**/
	var collisionFilter : ICollisionFilter;
	/**
		The `Body` that is currently being moved by the user, or `null` if no body.
	**/
	var body : BodyType;
	/**
		A `String` denoting the type of object.
	**/
	var type : String;
	static var prototype : MouseConstraint;
	/**
		Creates a new mouse constraint.
		All properties have default values, and many are pre-calculated automatically based on other properties.
		See the properties section below for detailed information on what you can pass via the `options` object.
	**/
	static function create(engine:Engine, ?options:IMouseConstraintDefinition):MouseConstraint;
}