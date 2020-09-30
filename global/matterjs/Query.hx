package global.matterjs;

/**
	The `Matter.Query` module contains methods for performing collision queries.
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.Query") extern class Query {
	function new();
	static var prototype : Query;
	/**
		Casts a ray segment against a set of bodies and returns all collisions, ray width is optional. Intersection points are not provided.
	**/
	static function ray(bodies:Array<BodyType>, startPoint:Vector, endPoint:Vector, ?rayWidth:Float):Array<ICollisionData>;
	/**
		Returns all bodies whose bounds are inside (or outside if set) the given set of bounds, from the given set of bodies.
	**/
	static function region(bodies:Array<BodyType>, bounds:Bounds, ?outside:Bool):Array<BodyType>;
	/**
		Returns all bodies whose vertices contain the given point, from the given set of bodies.
	**/
	static function point(bodies:Array<BodyType>, point:Vector):Array<BodyType>;
}