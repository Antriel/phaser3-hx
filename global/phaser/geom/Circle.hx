package global.phaser.geom;

/**
	A Circle object.
	
	This is a geometry object, containing numerical values and related methods to inspect and modify them.
	It is not a Game Object, in that you cannot add it to the display list, and it has no texture.
	To render a Circle you should look at the capabilities of the Graphics class.
**/
@:native("Phaser.Geom.Circle") extern class Circle {
	function new(?x:Float, ?y:Float, ?radius:Float);
	/**
		The geometry constant type of this object: `GEOM_CONST.CIRCLE`.
		Used for fast type comparisons.
	**/
	final type : Float;
	/**
		The x position of the center of the circle.
	**/
	var x : Float;
	/**
		The y position of the center of the circle.
	**/
	var y : Float;
	/**
		Check to see if the Circle contains the given x / y coordinates.
	**/
	function contains(x:Float, y:Float):Bool;
	/**
		Returns a Point object containing the coordinates of a point on the circumference of the Circle
		based on the given angle normalized to the range 0 to 1. I.e. a value of 0.5 will give the point
		at 180 degrees around the circle.
	**/
	function getPoint<O>(position:Float, ?out:O):O;
	/**
		Returns an array of Point objects containing the coordinates of the points around the circumference of the Circle,
		based on the given quantity or stepRate values.
	**/
	function getPoints<O>(quantity:Float, ?stepRate:Float, ?output:O):O;
	/**
		Returns a uniformly distributed random point from anywhere within the Circle.
	**/
	function getRandomPoint<O>(?point:O):O;
	/**
		Sets the x, y and radius of this circle.
	**/
	function setTo(?x:Float, ?y:Float, ?radius:Float):Circle;
	/**
		Sets this Circle to be empty with a radius of zero.
		Does not change its position.
	**/
	function setEmpty():Circle;
	/**
		Sets the position of this Circle.
	**/
	function setPosition(?x:Float, ?y:Float):Circle;
	/**
		Checks to see if the Circle is empty: has a radius of zero.
	**/
	function isEmpty():Bool;
	/**
		The radius of the Circle.
	**/
	var radius : Float;
	/**
		The diameter of the Circle.
	**/
	var diameter : Float;
	/**
		The left position of the Circle.
	**/
	var left : Float;
	/**
		The right position of the Circle.
	**/
	var right : Float;
	/**
		The top position of the Circle.
	**/
	var top : Float;
	/**
		The bottom position of the Circle.
	**/
	var bottom : Float;
	static var prototype : Circle;
	/**
		Calculates the area of the circle.
	**/
	static function Area(circle:Circle):Float;
	/**
		Returns the circumference of the given Circle.
	**/
	static function Circumference(circle:Circle):Float;
	/**
		Returns a Point object containing the coordinates of a point on the circumference of the Circle based on the given angle.
	**/
	static function CircumferencePoint<O>(circle:Circle, angle:Float, ?out:O):O;
	/**
		Creates a new Circle instance based on the values contained in the given source.
	**/
	static function Clone(source:ts.AnyOf2<Dynamic, Circle>):Circle;
	/**
		Check to see if the Circle contains the given x / y coordinates.
	**/
	static function Contains(circle:Circle, x:Float, y:Float):Bool;
	/**
		Check to see if the Circle contains the given Point object.
	**/
	static function ContainsPoint(circle:Circle, point:ts.AnyOf2<Dynamic, Point>):Bool;
	/**
		Check to see if the Circle contains all four points of the given Rectangle object.
	**/
	static function ContainsRect(circle:Circle, rect:ts.AnyOf2<Dynamic, Rectangle>):Bool;
	/**
		Copies the `x`, `y` and `radius` properties from the `source` Circle
		into the given `dest` Circle, then returns the `dest` Circle.
	**/
	static function CopyFrom<O>(source:Circle, dest:O):O;
	/**
		Compares the `x`, `y` and `radius` properties of the two given Circles.
		Returns `true` if they all match, otherwise returns `false`.
	**/
	static function Equals(circle:Circle, toCompare:Circle):Bool;
	/**
		Returns the bounds of the Circle object.
	**/
	static function GetBounds<O>(circle:Circle, ?out:O):O;
	/**
		Returns a Point object containing the coordinates of a point on the circumference of the Circle
		based on the given angle normalized to the range 0 to 1. I.e. a value of 0.5 will give the point
		at 180 degrees around the circle.
	**/
	static function GetPoint<O>(circle:Circle, position:Float, ?out:O):O;
	/**
		Returns an array of Point objects containing the coordinates of the points around the circumference of the Circle,
		based on the given quantity or stepRate values.
	**/
	static function GetPoints(circle:Circle, quantity:Float, ?stepRate:Float, ?output:Array<Dynamic>):Array<Point>;
	/**
		Offsets the Circle by the values given.
	**/
	static function Offset<O>(circle:O, x:Float, y:Float):O;
	/**
		Offsets the Circle by the values given in the `x` and `y` properties of the Point object.
	**/
	static function OffsetPoint<O>(circle:O, point:ts.AnyOf2<Dynamic, Point>):O;
	/**
		Returns a uniformly distributed random point from anywhere within the given Circle.
	**/
	static function Random<O>(circle:Circle, ?out:O):O;
}