package global.matterjs;

@:native("MatterJS.CompositeFactory") extern class CompositeFactory {
	function new();
	/**
		Generic add function. Adds one or many body(s), constraint(s) or a composite(s) to the given composite.
		Triggers `beforeAdd` and `afterAdd` events on the `composite`.
	**/
	function add(composite:CompositeType, object:ts.AnyOf3<BodyType, CompositeType, ConstraintType>):CompositeType;
	/**
		Returns all bodies in the given composite, including all bodies in its children, recursively.
	**/
	function allBodies(composite:CompositeType):Array<BodyType>;
	/**
		Returns all composites in the given composite, including all composites in its children, recursively.
	**/
	function allComposites(composite:CompositeType):Array<CompositeType>;
	/**
		Returns all constraints in the given composite, including all constraints in its children, recursively.
	**/
	function allConstraints(composite:CompositeType):Array<ConstraintType>;
	/**
		Removes all bodies, constraints and composites from the given composite.
		Optionally clearing its children recursively.
	**/
	function clear(composite:CompositeType, keepStatic:Bool, ?deep:Bool):Void;
	/**
		Creates a new composite. The options parameter is an object that specifies any properties you wish to override the defaults.
		See the properites section below for detailed information on what you can pass via the `options` object.
	**/
	function create(?options:ICompositeDefinition):CompositeType;
	/**
		Searches the composite recursively for an object matching the type and id supplied, null if not found.
	**/
	function get(composite:CompositeType, id:Float, type:String):ts.AnyOf3<BodyType, CompositeType, ConstraintType>;
	/**
		Moves the given object(s) from compositeA to compositeB (equal to a remove followed by an add).
	**/
	function move(compositeA:CompositeType, objects:Array<ts.AnyOf3<BodyType, CompositeType, ConstraintType>>, compositeB:CompositeType):CompositeType;
	/**
		Assigns new ids for all objects in the composite, recursively.
	**/
	function rebase(composite:CompositeType):CompositeType;
	/**
		Generic remove function. Removes one or many body(s), constraint(s) or a composite(s) to the given composite.
		Optionally searching its children recursively.
		Triggers `beforeRemove` and `afterRemove` events on the `composite`.
	**/
	function remove(composite:CompositeType, object:ts.AnyOf3<BodyType, CompositeType, ConstraintType>, ?deep:Bool):CompositeType;
	/**
		Sets the composite's `isModified` flag.
		If `updateParents` is true, all parents will be set (default: false).
		If `updateChildren` is true, all children will be set (default: false).
	**/
	function setModified(composite:CompositeType, isModified:Bool, ?updateParents:Bool, ?updateChildren:Bool):Void;
	/**
		Translates all children in the composite by a given vector relative to their current positions,
		without imparting any velocity.
	**/
	function translate(composite:CompositeType, translation:Vector, ?recursive:Bool):Void;
	/**
		Rotates all children in the composite by a given angle about the given point, without imparting any angular velocity.
	**/
	function rotate(composite:CompositeType, rotation:Float, point:Vector, ?recursive:Bool):Void;
	/**
		Scales all children in the composite, including updating physical properties (mass, area, axes, inertia), from a world-space point.
	**/
	function scale(composite:CompositeType, scaleX:Float, scaleY:Float, point:Vector, ?recursive:Bool):Void;
	static var prototype : CompositeFactory;
}