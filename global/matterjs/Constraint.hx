package global.matterjs;

/**
	The `Matter.Constraint` module contains methods for creating and manipulating constraints.
	Constraints are used for specifying that a fixed distance must be maintained between two bodies (or a body and a fixed world-space position).
	The stiffness of constraints can be modified to create springs or elastic.
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.Constraint") extern class Constraint {
	function new();
	static var prototype : Constraint;
	/**
		Creates a new constraint.
		All properties have default values, and many are pre-calculated automatically based on other properties.
		See the properties section below for detailed information on what you can pass via the `options` object.
	**/
	static function create(options:IConstraintDefinition):ConstraintType;
}