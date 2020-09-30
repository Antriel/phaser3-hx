package global.matterjs;

@:native("MatterJS.QueryFactory") extern class QueryFactory {
	function new();
	/**
		Casts a ray segment against a set of bodies and returns all collisions, ray width is optional. Intersection points are not provided.
	**/
	function ray(bodies:Array<BodyType>, startPoint:Vector, endPoint:Vector, ?rayWidth:Float):Array<ICollisionData>;
	/**
		Returns all bodies whose bounds are inside (or outside if set) the given set of bounds, from the given set of bodies.
	**/
	function region(bodies:Array<BodyType>, bounds:Bounds, ?outside:Bool):Array<BodyType>;
	/**
		Returns all bodies whose vertices contain the given point, from the given set of bodies.
	**/
	function point(bodies:Array<BodyType>, point:Vector):Array<BodyType>;
	static var prototype : QueryFactory;
}