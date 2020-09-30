package global.phaser.geom;

/**
	A triangle is a plane created by connecting three points.
	The first two arguments specify the first point, the middle two arguments
	specify the second point, and the last two arguments specify the third point.
**/
@:native("Phaser.Geom.Triangle") extern class Triangle {
	function new(?x1:Float, ?y1:Float, ?x2:Float, ?y2:Float, ?x3:Float, ?y3:Float);
	/**
		The geometry constant type of this object: `GEOM_CONST.TRIANGLE`.
		Used for fast type comparisons.
	**/
	final type : Float;
	/**
		`x` coordinate of the first point.
	**/
	var x1 : Float;
	/**
		`y` coordinate of the first point.
	**/
	var y1 : Float;
	/**
		`x` coordinate of the second point.
	**/
	var x2 : Float;
	/**
		`y` coordinate of the second point.
	**/
	var y2 : Float;
	/**
		`x` coordinate of the third point.
	**/
	var x3 : Float;
	/**
		`y` coordinate of the third point.
	**/
	var y3 : Float;
	/**
		Checks whether a given points lies within the triangle.
	**/
	function contains(x:Float, y:Float):Bool;
	/**
		Returns a specific point  on the triangle.
	**/
	function getPoint<O>(position:Float, ?output:O):O;
	/**
		Calculates a list of evenly distributed points on the triangle. It is either possible to pass an amount of points to be generated (`quantity`) or the distance between two points (`stepRate`).
	**/
	function getPoints<O>(quantity:Float, ?stepRate:Float, ?output:O):O;
	/**
		Returns a random point along the triangle.
	**/
	function getRandomPoint<O>(?point:O):O;
	/**
		Sets all three points of the triangle. Leaving out any coordinate sets it to be `0`.
	**/
	function setTo(?x1:Float, ?y1:Float, ?x2:Float, ?y2:Float, ?x3:Float, ?y3:Float):Triangle;
	/**
		Returns a Line object that corresponds to Line A of this Triangle.
	**/
	function getLineA<O>(?line:O):O;
	/**
		Returns a Line object that corresponds to Line B of this Triangle.
	**/
	function getLineB<O>(?line:O):O;
	/**
		Returns a Line object that corresponds to Line C of this Triangle.
	**/
	function getLineC<O>(?line:O):O;
	/**
		Left most X coordinate of the triangle. Setting it moves the triangle on the X axis accordingly.
	**/
	var left : Float;
	/**
		Right most X coordinate of the triangle. Setting it moves the triangle on the X axis accordingly.
	**/
	var right : Float;
	/**
		Top most Y coordinate of the triangle. Setting it moves the triangle on the Y axis accordingly.
	**/
	var top : Float;
	/**
		Bottom most Y coordinate of the triangle. Setting it moves the triangle on the Y axis accordingly.
	**/
	var bottom : Float;
	static var prototype : Triangle;
	/**
		Returns the area of a Triangle.
	**/
	static function Area(triangle:Triangle):Float;
	/**
		Builds an equilateral triangle. In the equilateral triangle, all the sides are the same length (congruent) and all the angles are the same size (congruent).
		The x/y specifies the top-middle of the triangle (x1/y1) and length is the length of each side.
	**/
	static function BuildEquilateral(x:Float, y:Float, length:Float):Triangle;
	/**
		Takes an array of vertex coordinates, and optionally an array of hole indices, then returns an array
		of Triangle instances, where the given vertices have been decomposed into a series of triangles.
	**/
	static function BuildFromPolygon<O>(data:Array<Dynamic>, ?holes:Array<Dynamic>, ?scaleX:Float, ?scaleY:Float, ?out:O):O;
	/**
		Builds a right triangle, i.e. one which has a 90-degree angle and two acute angles.
	**/
	static function BuildRight(x:Float, y:Float, width:Float, height:Float):Triangle;
	/**
		Positions the Triangle so that it is centered on the given coordinates.
	**/
	static function CenterOn<O>(triangle:O, x:Float, y:Float, ?centerFunc:global.CenterFunction):O;
	/**
		Calculates the position of a Triangle's centroid, which is also its center of mass (center of gravity).
		
		The centroid is the point in a Triangle at which its three medians (the lines drawn from the vertices to the bisectors of the opposite sides) meet. It divides each one in a 2:1 ratio.
	**/
	static function Centroid<O>(triangle:Triangle, ?out:O):O;
	/**
		Computes the circumcentre of a triangle. The circumcentre is the centre of
		the circumcircle, the smallest circle which encloses the triangle. It is also
		the common intersection point of the perpendicular bisectors of the sides of
		the triangle, and is the only point which has equal distance to all three
		vertices of the triangle.
	**/
	static function CircumCenter<O>(triangle:Triangle, ?out:O):O;
	/**
		Finds the circumscribed circle (circumcircle) of a Triangle object. The circumcircle is the circle which touches all of the triangle's vertices.
	**/
	static function CircumCircle<O>(triangle:Triangle, ?out:O):O;
	/**
		Clones a Triangle object.
	**/
	static function Clone(source:Triangle):Triangle;
	/**
		Checks if a point (as a pair of coordinates) is inside a Triangle's bounds.
	**/
	static function Contains(triangle:Triangle, x:Float, y:Float):Bool;
	/**
		Filters an array of point-like objects to only those contained within a triangle.
		If `returnFirst` is true, will return an array containing only the first point in the provided array that is within the triangle (or an empty array if there are no such points).
	**/
	static function ContainsArray(triangle:Triangle, points:Array<Point>, ?returnFirst:Bool, ?out:Array<Dynamic>):Array<Point>;
	/**
		Tests if a triangle contains a point.
	**/
	static function ContainsPoint(triangle:Triangle, point:Dynamic):Bool;
	/**
		Copy the values of one Triangle to a destination Triangle.
	**/
	static function CopyFrom<O>(source:Triangle, dest:O):O;
	/**
		Decomposes a Triangle into an array of its points.
	**/
	static function Decompose(triangle:Triangle, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Returns true if two triangles have the same coordinates.
	**/
	static function Equals(triangle:Triangle, toCompare:Triangle):Bool;
	/**
		Returns a Point from around the perimeter of a Triangle.
	**/
	static function GetPoint<O>(triangle:Triangle, position:Float, ?out:O):O;
	/**
		Returns an array of evenly spaced points on the perimeter of a Triangle.
	**/
	static function GetPoints<O>(triangle:Triangle, quantity:Float, stepRate:Float, ?out:O):O;
	/**
		Calculates the position of the incenter of a Triangle object. This is the point where its three angle bisectors meet and it's also the center of the incircle, which is the circle inscribed in the triangle.
	**/
	static function InCenter<O>(triangle:Triangle, ?out:O):O;
	/**
		Moves each point (vertex) of a Triangle by a given offset, thus moving the entire Triangle by that offset.
	**/
	static function Offset<O>(triangle:O, x:Float, y:Float):O;
	/**
		Gets the length of the perimeter of the given triangle.
		Calculated by adding together the length of each of the three sides.
	**/
	static function Perimeter(triangle:Triangle):Float;
	/**
		Returns a random Point from within the area of the given Triangle.
	**/
	static function Random<O>(triangle:Triangle, ?out:O):O;
	/**
		Rotates a Triangle about its incenter, which is the point at which its three angle bisectors meet.
	**/
	static function Rotate<O>(triangle:O, angle:Float):O;
	/**
		Rotates a Triangle at a certain angle about a given Point or object with public `x` and `y` properties.
	**/
	static function RotateAroundPoint<O>(triangle:O, point:Point, angle:Float):O;
	/**
		Rotates an entire Triangle at a given angle about a specific point.
	**/
	static function RotateAroundXY<O>(triangle:O, x:Float, y:Float, angle:Float):O;
}