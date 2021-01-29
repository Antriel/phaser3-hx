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
	function new(?points:ts.AnyOf3<String, Array<Float>, Array<global.phaser.types.math.Vector2Like>>);
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
	function setTo(?points:ts.AnyOf3<String, Array<Float>, Array<global.phaser.types.math.Vector2Like>>):Polygon;
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
		This module implements a modified ear slicing algorithm, optimized by z-order curve hashing and extended to
		handle holes, twisted polygons, degeneracies and self-intersections in a way that doesn't guarantee correctness
		of triangulation, but attempts to always produce acceptable results for practical data.
		
		Example:
		
		```javascript
		const triangles = Phaser.Geom.Polygon.Earcut([10,0, 0,50, 60,60, 70,10]); // returns [1,0,3, 3,2,1]
		```
		
		Each group of three vertex indices in the resulting array forms a triangle.
		
		```javascript
		// triangulating a polygon with a hole
		earcut([0,0, 100,0, 100,100, 0,100,  20,20, 80,20, 80,80, 20,80], [4]);
		// [3,0,4, 5,4,0, 3,4,7, 5,0,1, 2,3,7, 6,5,1, 2,7,6, 6,1,2]
		
		// triangulating a polygon with 3d coords
		earcut([10,0,1, 0,50,2, 60,60,3, 70,10,4], null, 3);
		// [1,0,3, 3,2,1]
		```
		
		If you pass a single vertex as a hole, Earcut treats it as a Steiner point.
		
		If your input is a multi-dimensional array (e.g. GeoJSON Polygon), you can convert it to the format
		expected by Earcut with `Phaser.Geom.Polygon.Earcut.flatten`:
		
		```javascript
		var data = earcut.flatten(geojson.geometry.coordinates);
		var triangles = earcut(data.vertices, data.holes, data.dimensions);
		```
		
		After getting a triangulation, you can verify its correctness with `Phaser.Geom.Polygon.Earcut.deviation`:
		
		```javascript
		var deviation = earcut.deviation(vertices, holes, dimensions, triangles);
		```
		Returns the relative difference between the total area of triangles and the area of the input polygon.
		0 means the triangulation is fully correct.
		
		For more information see https://github.com/mapbox/earcut
	**/
	static function Earcut(data:Array<Float>, ?holeIndices:Array<Float>, ?dimensions:Float):Array<Float>;
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
		Takes a Polygon object and simplifies the points by running them through a combination of
		Douglas-Peucker and Radial Distance algorithms. Simplification dramatically reduces the number of
		points in a polygon while retaining its shape, giving a huge performance boost when processing
		it and also reducing visual noise.
	**/
	static function Simplify<O>(polygon:O, ?tolerance:Float, ?highestQuality:Bool):O;
	/**
		Takes a Polygon object and applies Chaikin's smoothing algorithm on its points.
	**/
	static function Smooth<O>(polygon:O):O;
	/**
		Tranlates the points of the given Polygon.
	**/
	static function Translate<O>(polygon:O, x:Float, y:Float):O;
}