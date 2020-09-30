package global.matterjs;

/**
	The `Matter.Bodies` module contains factory methods for creating rigid body models
	with commonly used body configurations (such as rectangles, circles and other polygons).
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.Bodies") extern class Bodies {
	function new();
	static var prototype : Bodies;
	/**
		Creates a new rigid body model with a circle hull.
		The options parameter is an object that specifies any properties you wish to override the defaults.
		See the properties section of the `Matter.Body` module for detailed information on what you can pass via the `options` object.
	**/
	static function circle(x:Float, y:Float, radius:Float, ?options:IBodyDefinition, ?maxSides:Float):BodyType;
	/**
		Creates a new rigid body model with a regular polygon hull with the given number of sides.
		The options parameter is an object that specifies any properties you wish to override the defaults.
		See the properties section of the `Matter.Body` module for detailed information on what you can pass via the `options` object.
	**/
	static function polygon(x:Float, y:Float, sides:Float, radius:Float, ?options:IChamferableBodyDefinition):BodyType;
	/**
		Creates a new rigid body model with a rectangle hull.
		The options parameter is an object that specifies any properties you wish to override the defaults.
		See the properties section of the `Matter.Body` module for detailed information on what you can pass via the `options` object.
	**/
	static function rectangle(x:Float, y:Float, width:Float, height:Float, ?options:IChamferableBodyDefinition):BodyType;
	/**
		Creates a new rigid body model with a trapezoid hull.
		The options parameter is an object that specifies any properties you wish to override the defaults.
		See the properties section of the `Matter.Body` module for detailed information on what you can pass via the `options` object.
	**/
	static function trapezoid(x:Float, y:Float, width:Float, height:Float, slope:Float, ?options:IChamferableBodyDefinition):BodyType;
	/**
		Creates a body using the supplied vertices (or an array containing multiple sets of vertices).
		If the vertices are convex, they will pass through as supplied.
		Otherwise if the vertices are concave, they will be decomposed if [poly-decomp.js](https://github.com/schteppe/poly-decomp.js) is available.
		Note that this process is not guaranteed to support complex sets of vertices (e.g. those with holes may fail).
		By default the decomposition will discard collinear edges (to improve performance).
		It can also optionally discard any parts that have an area less than `minimumArea`.
		If the vertices can not be decomposed, the result will fall back to using the convex hull.
		The options parameter is an object that specifies any `Matter.Body` properties you wish to override the defaults.
		See the properties section of the `Matter.Body` module for detailed information on what you can pass via the `options` object.
	**/
	static function fromVertices(x:Float, y:Float, vertexSets:Array<Array<Vector>>, ?options:IBodyDefinition, ?flagInternal:Bool, ?removeCollinear:Float, ?minimumArea:Float):BodyType;
}