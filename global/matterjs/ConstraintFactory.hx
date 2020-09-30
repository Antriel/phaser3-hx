package global.matterjs;

@:native("MatterJS.ConstraintFactory") extern class ConstraintFactory {
	function new();
	/**
		Creates a new constraint.
		All properties have default values, and many are pre-calculated automatically based on other properties.
		See the properties section below for detailed information on what you can pass via the `options` object.
	**/
	function create(options:IConstraintDefinition):ConstraintType;
	static var prototype : ConstraintFactory;
}