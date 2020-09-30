package global.phaser.geom;

/**
	An Ellipse object.
	
	This is a geometry object, containing numerical values and related methods to inspect and modify them.
	It is not a Game Object, in that you cannot add it to the display list, and it has no texture.
	To render an Ellipse you should look at the capabilities of the Graphics class.
**/
@:native("Phaser.Geom.Ellipse") extern class Ellipse {
	function new(?x:Float, ?y:Float, ?width:Float, ?height:Float);
	/**
		The geometry constant type of this object: `GEOM_CONST.ELLIPSE`.
		Used for fast type comparisons.
	**/
	final type : Float;
	/**
		The x position of the center of the ellipse.
	**/
	var x : Float;
	/**
		The y position of the center of the ellipse.
	**/
	var y : Float;
	/**
		The width of the ellipse.
	**/
	var width : Float;
	/**
		The height of the ellipse.
	**/
	var height : Float;
	/**
		Check to see if the Ellipse contains the given x / y coordinates.
	**/
	function contains(x:Float, y:Float):Bool;
	/**
		Returns a Point object containing the coordinates of a point on the circumference of the Ellipse
		based on the given angle normalized to the range 0 to 1. I.e. a value of 0.5 will give the point
		at 180 degrees around the circle.
	**/
	function getPoint<O>(position:Float, ?out:O):O;
	/**
		Returns an array of Point objects containing the coordinates of the points around the circumference of the Ellipse,
		based on the given quantity or stepRate values.
	**/
	function getPoints<O>(quantity:Float, ?stepRate:Float, ?output:O):O;
	/**
		Returns a uniformly distributed random point from anywhere within the given Ellipse.
	**/
	function getRandomPoint<O>(?point:O):O;
	/**
		Sets the x, y, width and height of this ellipse.
	**/
	function setTo(x:Float, y:Float, width:Float, height:Float):Ellipse;
	/**
		Sets this Ellipse to be empty with a width and height of zero.
		Does not change its position.
	**/
	function setEmpty():Ellipse;
	/**
		Sets the position of this Ellipse.
	**/
	function setPosition(x:Float, y:Float):Ellipse;
	/**
		Sets the size of this Ellipse.
		Does not change its position.
	**/
	function setSize(width:Float, ?height:Float):Ellipse;
	/**
		Checks to see if the Ellipse is empty: has a width or height equal to zero.
	**/
	function isEmpty():Bool;
	/**
		Returns the minor radius of the ellipse. Also known as the Semi Minor Axis.
	**/
	function getMinorRadius():Float;
	/**
		Returns the major radius of the ellipse. Also known as the Semi Major Axis.
	**/
	function getMajorRadius():Float;
	/**
		The left position of the Ellipse.
	**/
	var left : Float;
	/**
		The right position of the Ellipse.
	**/
	var right : Float;
	/**
		The top position of the Ellipse.
	**/
	var top : Float;
	/**
		The bottom position of the Ellipse.
	**/
	var bottom : Float;
	static var prototype : Ellipse;
	/**
		Calculates the area of the Ellipse.
	**/
	static function Area(ellipse:Ellipse):Float;
	/**
		Returns the circumference of the given Ellipse.
	**/
	static function Circumference(ellipse:Ellipse):Float;
	/**
		Returns a Point object containing the coordinates of a point on the circumference of the Ellipse based on the given angle.
	**/
	static function CircumferencePoint<O>(ellipse:Ellipse, angle:Float, ?out:O):O;
	/**
		Creates a new Ellipse instance based on the values contained in the given source.
	**/
	static function Clone(source:Ellipse):Ellipse;
	/**
		Check to see if the Ellipse contains the given x / y coordinates.
	**/
	static function Contains(ellipse:Ellipse, x:Float, y:Float):Bool;
	/**
		Check to see if the Ellipse contains the given Point object.
	**/
	static function ContainsPoint(ellipse:Ellipse, point:ts.AnyOf2<Dynamic, Point>):Bool;
	/**
		Check to see if the Ellipse contains all four points of the given Rectangle object.
	**/
	static function ContainsRect(ellipse:Ellipse, rect:ts.AnyOf2<Dynamic, Rectangle>):Bool;
	/**
		Copies the `x`, `y`, `width` and `height` properties from the `source` Ellipse
		into the given `dest` Ellipse, then returns the `dest` Ellipse.
	**/
	static function CopyFrom<O>(source:Ellipse, dest:O):O;
	/**
		Compares the `x`, `y`, `width` and `height` properties of the two given Ellipses.
		Returns `true` if they all match, otherwise returns `false`.
	**/
	static function Equals(ellipse:Ellipse, toCompare:Ellipse):Bool;
	/**
		Returns the bounds of the Ellipse object.
	**/
	static function GetBounds<O>(ellipse:Ellipse, ?out:O):O;
	/**
		Returns a Point object containing the coordinates of a point on the circumference of the Ellipse
		based on the given angle normalized to the range 0 to 1. I.e. a value of 0.5 will give the point
		at 180 degrees around the circle.
	**/
	static function GetPoint<O>(ellipse:Ellipse, position:Float, ?out:O):O;
	/**
		Returns an array of Point objects containing the coordinates of the points around the circumference of the Ellipse,
		based on the given quantity or stepRate values.
	**/
	static function GetPoints<O>(ellipse:Ellipse, quantity:Float, ?stepRate:Float, ?out:O):O;
	/**
		Offsets the Ellipse by the values given.
	**/
	static function Offset<O>(ellipse:O, x:Float, y:Float):O;
	/**
		Offsets the Ellipse by the values given in the `x` and `y` properties of the Point object.
	**/
	static function OffsetPoint<O>(ellipse:O, point:ts.AnyOf2<Dynamic, Point>):O;
	/**
		Returns a uniformly distributed random point from anywhere within the given Ellipse.
	**/
	static function Random<O>(ellipse:Ellipse, ?out:O):O;
}