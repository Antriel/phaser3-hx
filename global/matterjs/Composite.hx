package global.matterjs;

/**
	The `Matter.Composite` module contains methods for creating and manipulating composite bodies.
	A composite body is a collection of `Matter.Body`, `Matter.Constraint` and other `Matter.Composite`, therefore composites form a tree structure.
	It is important to use the functions in this module to modify composites, rather than directly modifying their properties.
	Note that the `Matter.World` object is also a type of `Matter.Composite` and as such all composite methods here can also operate on a `Matter.World`.
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.Composite") extern class Composite {
	function new();
	static var prototype : Composite;
	/**
		Generic add function. Adds one or many body(s), constraint(s) or a composite(s) to the given composite.
		Triggers `beforeAdd` and `afterAdd` events on the `composite`.
	**/
	static function add(composite:CompositeType, object:ts.AnyOf3<BodyType, CompositeType, ConstraintType>):CompositeType;
	/**
		Returns all bodies in the given composite, including all bodies in its children, recursively.
	**/
	static function allBodies(composite:CompositeType):Array<BodyType>;
	/**
		Returns all composites in the given composite, including all composites in its children, recursively.
	**/
	static function allComposites(composite:CompositeType):Array<CompositeType>;
	/**
		Returns all constraints in the given composite, including all constraints in its children, recursively.
	**/
	static function allConstraints(composite:CompositeType):Array<ConstraintType>;
	/**
		Removes all bodies, constraints and composites from the given composite.
		Optionally clearing its children recursively.
	**/
	static function clear(composite:CompositeType, keepStatic:Bool, ?deep:Bool):Void;
	/**
		Creates a new composite. The options parameter is an object that specifies any properties you wish to override the defaults.
		See the properites section below for detailed information on what you can pass via the `options` object.
	**/
	static function create(?options:ICompositeDefinition):CompositeType;
	/**
		Searches the composite recursively for an object matching the type and id supplied, null if not found.
	**/
	static function get(composite:CompositeType, id:Float, type:String):ts.AnyOf3<BodyType, CompositeType, ConstraintType>;
	/**
		Moves the given object(s) from compositeA to compositeB (equal to a remove followed by an add).
	**/
	static function move(compositeA:CompositeType, objects:Array<ts.AnyOf3<BodyType, CompositeType, ConstraintType>>, compositeB:CompositeType):CompositeType;
	/**
		Assigns new ids for all objects in the composite, recursively.
	**/
	static function rebase(composite:CompositeType):CompositeType;
	/**
		Generic remove function. Removes one or many body(s), constraint(s) or a composite(s) to the given composite.
		Optionally searching its children recursively.
		Triggers `beforeRemove` and `afterRemove` events on the `composite`.
	**/
	static function remove(composite:CompositeType, object:ts.AnyOf3<BodyType, CompositeType, ConstraintType>, ?deep:Bool):CompositeType;
	/**
		Sets the composite's `isModified` flag.
		If `updateParents` is true, all parents will be set (default: false).
		If `updateChildren` is true, all children will be set (default: false).
	**/
	static function setModified(composite:CompositeType, isModified:Bool, ?updateParents:Bool, ?updateChildren:Bool):Void;
	/**
		Translates all children in the composite by a given vector relative to their current positions,
		without imparting any velocity.
	**/
	static function translate(composite:CompositeType, translation:Vector, ?recursive:Bool):Void;
	/**
		Rotates all children in the composite by a given angle about the given point, without imparting any angular velocity.
	**/
	static function rotate(composite:CompositeType, rotation:Float, point:Vector, ?recursive:Bool):Void;
	/**
		Scales all children in the composite, including updating physical properties (mass, area, axes, inertia), from a world-space point.
	**/
	static function scale(composite:CompositeType, scaleX:Float, scaleY:Float, point:Vector, ?recursive:Bool):Void;
}