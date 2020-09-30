package global.matterjs;

/**
	The `Matter.Vertices` module contains methods for creating and manipulating sets of vertices.
	A set of vertices is an array of `Matter.Vector` with additional indexing properties inserted by `Vertices.create`.
	A `Matter.Body` maintains a set of vertices to represent the shape of the object (its convex hull).
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.Vertices") extern class Vertices {
	function new();
	static var prototype : Vertices;
	/**
		Returns the average (mean) of the set of vertices.
	**/
	static function mean(vertices:Array<Vector>):Array<Vector>;
	/**
		Sorts the input vertices into clockwise order in place.
	**/
	static function clockwiseSort(vertices:Array<Vector>):Array<Vector>;
	/**
		Returns true if the vertices form a convex shape (vertices must be in clockwise order).
	**/
	static function isConvex(vertices:Array<Vector>):Bool;
	/**
		Returns the convex hull of the input vertices as a new array of points.
	**/
	static function hull(vertices:Array<Vector>):Array<Vector>;
	/**
		Returns the area of the set of vertices.
	**/
	static function area(vertices:Array<Vector>, signed:Bool):Float;
	/**
		Returns the centre (centroid) of the set of vertices.
	**/
	static function centre(vertices:Array<Vector>):Vector;
	/**
		Chamfers a set of vertices by giving them rounded corners, returns a new set of vertices.
		The radius parameter is a single number or an array to specify the radius for each vertex.
	**/
	static function chamfer(vertices:Array<Vector>, radius:ts.AnyOf2<Float, Array<Float>>, quality:Float, qualityMin:Float, qualityMax:Float):Void;
	/**
		Returns `true` if the `point` is inside the set of `vertices`.
	**/
	static function contains(vertices:Array<Vector>, point:Vector):Bool;
	/**
		Creates a new set of `Matter.Body` compatible vertices.
		The `points` argument accepts an array of `Matter.Vector` points orientated around the origin `(0, 0)`, for example:
		
		     [{ x: 0, y: 0 }, { x: 25, y: 50 }, { x: 50, y: 0 }]
		
		The `Vertices.create` method returns a new array of vertices, which are similar to Matter.Vector objects,
		but with some additional references required for efficient collision detection routines.
		
		Note that the `body` argument is not optional, a `Matter.Body` reference must be provided.
	**/
	static function create(points:Array<Vector>, body:BodyType):Array<Vector>;
	/**
		Parses a string containing ordered x y pairs separated by spaces (and optionally commas),
		into a `Matter.Vertices` object for the given `Matter.Body`.
		For parsing SVG paths, see `Svg.pathToVertices`.
	**/
	static function fromPath(path:String, body:BodyType):Array<Vector>;
	/**
		Returns the moment of inertia (second moment of area) of the set of vertices given the total mass.
	**/
	static function inertia(vertices:Array<Vector>, mass:Float):Float;
	/**
		Rotates the set of vertices in-place.
	**/
	static function rotate(vertices:Array<Vector>, angle:Float, point:Vector):Void;
	/**
		Scales the vertices from a point (default is centre) in-place.
	**/
	static function scale(vertices:Array<Vector>, scaleX:Float, scaleY:Float, point:Vector):Void;
	/**
		Translates the set of vertices in-place.
	**/
	static function translate(vertices:Array<Vector>, vector:Vector, scalar:Float):Void;
}