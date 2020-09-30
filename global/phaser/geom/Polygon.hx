package global.phaser.geom;

/**
	A Polygon object
	
	The polygon is a closed shape consists of a series of connected straight lines defined by list of ordered points.
	Several formats are supported to define the list of points, check the setTo method for details. 
	This is a geometry object allowing you to define and inspect the shape.
	It is not a Game Object, in that you cannot add it to the display list, and it has no texture.
	To render a Polygon you should look at the capabilities of the Graphics class.
**/
@:native("Phaser.Geom.Polygon") extern class Polygon {
	function new(?points:Array<Point>);
	/**
		The geometry constant type of this object: `GEOM_CONST.POLYGON`.
		Used for fast type comparisons.
	**/
	final type : Float;
	/**
		The area of this Polygon.
	**/
	var area : Float;
	/**
		An array of number pair objects that make up this polygon. I.e. [ {x,y}, {x,y}, {x,y} ]
	**/
	var points : Array<Point>;
	/**
		Check to see if the Polygon contains the given x / y coordinates.
	**/
	function contains(x:Float, y:Float):Bool;
	/**
		Sets this Polygon to the given points.
		
		The points can be set from a variety of formats:
		
		- A string containing paired values separated by a single space: `'40 0 40 20 100 20 100 80 40 80 40 100 0 50'`
		- An array of Point objects: `[new Phaser.Point(x1, y1), ...]`
		- An array of objects with public x/y properties: `[obj1, obj2, ...]`
		- An array of paired numbers that represent point coordinates: `[x1,y1, x2,y2, ...]`
		- An array of arrays with two elements representing x/y coordinates: `[[x1, y1], [x2, y2], ...]`
		
		`setTo` may also be called without any arguments to remove all points.
	**/
	function setTo(points:Array<Dynamic>):Polygon;
	/**
		Calculates the area of the Polygon. This is available in the property Polygon.area
	**/
	function calculateArea():Float;
	/**
		Returns an array of Point objects containing the coordinates of the points around the perimeter of the Polygon,
		based on the given quantity or stepRate values.
	**/
	function getPoints<O>(quantity:Float, ?stepRate:Float, ?output:O):O;
	static var prototype : Polygon;
	/**
		Create a new polygon which is a copy of the specified polygon
	**/
	static function Clone(polygon:Polygon):Polygon;
	/**
		Checks if a point is within the bounds of a Polygon.
	**/
	static function Contains(polygon:Polygon, x:Float, y:Float):Bool;
	/**
		Checks the given Point again the Polygon to see if the Point lays within its vertices.
	**/
	static function ContainsPoint(polygon:Polygon, point:Point):Bool;
	/**
		Calculates the bounding AABB rectangle of a polygon.
	**/
	static function GetAABB<O>(polygon:Polygon, ?out:O):O;
	/**
		Stores all of the points of a Polygon into a flat array of numbers following the sequence [ x,y, x,y, x,y ],
		i.e. each point of the Polygon, in the order it's defined, corresponds to two elements of the resultant
		array for the point's X and Y coordinate.
	**/
	static function GetNumberArray<O>(polygon:Polygon, ?output:O):O;
	/**
		Returns an array of Point objects containing the coordinates of the points around the perimeter of the Polygon,
		based on the given quantity or stepRate values.
	**/
	static function GetPoints(polygon:Polygon, quantity:Float, ?stepRate:Float, ?output:Array<Dynamic>):Array<Point>;
	/**
		Returns the perimeter of the given Polygon.
	**/
	static function Perimeter(polygon:Polygon):Float;
	/**
		Reverses the order of the points of a Polygon.
	**/
	static function Reverse<O>(polygon:O):O;
	/**
		Takes a Polygon object and applies Chaikin's smoothing algorithm on its points.
	**/
	static function Smooth<O>(polygon:O):O;
}