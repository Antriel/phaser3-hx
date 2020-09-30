package global.phaser.geom;

/**
	Defines a Point in 2D space, with an x and y component.
**/
@:native("Phaser.Geom.Point") extern class Point {
	function new(?x:Float, ?y:Float);
	/**
		The geometry constant type of this object: `GEOM_CONST.POINT`.
		Used for fast type comparisons.
	**/
	final type : Float;
	/**
		The x coordinate of this Point.
	**/
	var x : Float;
	/**
		The y coordinate of this Point.
	**/
	var y : Float;
	/**
		Set the x and y coordinates of the point to the given values.
	**/
	function setTo(?x:Float, ?y:Float):Point;
	static var prototype : Point;
	/**
		Apply `Math.ceil()` to each coordinate of the given Point.
	**/
	static function Ceil<O>(point:O):O;
	/**
		Clone the given Point.
	**/
	static function Clone(source:Point):Point;
	/**
		Copy the values of one Point to a destination Point.
	**/
	static function CopyFrom<O>(source:Point, dest:O):O;
	/**
		A comparison of two `Point` objects to see if they are equal.
	**/
	static function Equals(point:Point, toCompare:Point):Bool;
	/**
		Apply `Math.ceil()` to each coordinate of the given Point.
	**/
	static function Floor<O>(point:O):O;
	/**
		Get the centroid or geometric center of a plane figure (the arithmetic mean position of all the points in the figure).
		Informally, it is the point at which a cutout of the shape could be perfectly balanced on the tip of a pin.
	**/
	static function GetCentroid<O>(points:Array<global.phaser.types.math.Vector2Like>, ?out:O):O;
	/**
		Calculate the magnitude of the point, which equivalent to the length of the line from the origin to this point.
	**/
	static function GetMagnitude(point:Point):Float;
	/**
		Calculates the square of magnitude of given point.(Can be used for fast magnitude calculation of point)
	**/
	static function GetMagnitudeSq(point:Point):Float;
	/**
		Calculates the Axis Aligned Bounding Box (or aabb) from an array of points.
	**/
	static function GetRectangleFromPoints<O>(points:Array<global.phaser.types.math.Vector2Like>, ?out:O):O;
	/**
		Returns the linear interpolation point between the two given points, based on `t`.
	**/
	static function Interpolate<O>(pointA:Point, pointB:Point, ?t:Float, ?out:O):O;
	/**
		Swaps the X and the Y coordinate of a point.
	**/
	static function Invert<O>(point:O):O;
	/**
		Inverts a Point's coordinates.
	**/
	static function Negative<O>(point:Point, ?out:O):O;
	/**
		Calculates the vector projection of `pointA` onto the nonzero `pointB`. This is the
		orthogonal projection of `pointA` onto a straight line paralle to `pointB`.
	**/
	static function Project<O>(pointA:Point, pointB:Point, ?out:O):O;
	/**
		Calculates the vector projection of `pointA` onto the nonzero `pointB`. This is the
		orthogonal projection of `pointA` onto a straight line paralle to `pointB`.
	**/
	static function ProjectUnit<O>(pointA:Point, pointB:Point, ?out:O):O;
	/**
		Changes the magnitude (length) of a two-dimensional vector without changing its direction.
	**/
	static function SetMagnitude<O>(point:O, magnitude:Float):O;
}