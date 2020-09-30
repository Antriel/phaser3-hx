package global.matterjs;

/**
	The `Matter.World` module contains methods for creating and manipulating the world composite.
	A `Matter.World` is a `Matter.Composite` body, which is a collection of `Matter.Body`, `Matter.Constraint` and other `Matter.Composite`.
	A `Matter.World` has a few additional properties including `gravity` and `bounds`.
	It is important to use the functions in the `Matter.Composite` module to modify the world composite, rather than directly modifying its properties.
	There are also a few methods here that alias those in `Matter.Composite` for easier readability.
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.World") extern class World {
	function new();
	var gravity : Gravity;
	var bounds : Bounds;
	static var prototype : World;
	/**
		Add objects or arrays of objects of types: Body, Constraint, Composite
	**/
	static function add(world:World, body:ts.AnyOf7<BodyType, Array<BodyType>, CompositeType, ConstraintType, Array<ConstraintType>, Array<CompositeType>, MouseConstraint>):World;
	/**
		An alias for Composite.addBody since World is also a Composite
	**/
	static function addBody(world:World, body:BodyType):World;
	/**
		An alias for Composite.add since World is also a Composite
	**/
	static function addComposite(world:World, composite:CompositeType):World;
	/**
		An alias for Composite.addConstraint since World is also a Composite
	**/
	static function addConstraint(world:World, constraint:ConstraintType):World;
	/**
		An alias for Composite.clear since World is also a Composite
	**/
	static function clear(world:World, keepStatic:Bool):Void;
	/**
		Creates a new world composite. The options parameter is an object that specifies any properties you wish to override the defaults.
		See the properties section below for detailed information on what you can pass via the `options` object.
	**/
	static function create(options:IWorldDefinition):World;
}