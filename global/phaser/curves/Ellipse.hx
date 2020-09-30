package global.phaser.curves;

/**
	An Elliptical Curve derived from the Base Curve class.
	
	See https://en.wikipedia.org/wiki/Elliptic_curve for more details.
**/
@:native("Phaser.Curves.Ellipse") extern class Ellipse extends Curve {
	function new(?x:ts.AnyOf2<Float, global.phaser.types.curves.EllipseCurveConfig>, ?y:Float, ?xRadius:Float, ?yRadius:Float, ?startAngle:Float, ?endAngle:Float, ?clockwise:Bool, ?rotation:Float);
	/**
		The center point of the ellipse. Used for calculating rotation.
	**/
	var p0 : global.phaser.math.Vector2;
	/**
		Get the resolution of the curve.
	**/
	function getResolution(divisions:Float):Float;
	/**
		Get point at relative position in curve according to length.
	**/
	function getPoint<O>(t:Float, ?out:O):O;
	/**
		Sets the horizontal radius of this curve.
	**/
	function setXRadius(value:Float):Ellipse;
	/**
		Sets the vertical radius of this curve.
	**/
	function setYRadius(value:Float):Ellipse;
	/**
		Sets the width of this curve.
	**/
	function setWidth(value:Float):Ellipse;
	/**
		Sets the height of this curve.
	**/
	function setHeight(value:Float):Ellipse;
	/**
		Sets the start angle of this curve.
	**/
	function setStartAngle(value:Float):Ellipse;
	/**
		Sets the end angle of this curve.
	**/
	function setEndAngle(value:Float):Ellipse;
	/**
		Sets if this curve extends clockwise or anti-clockwise.
	**/
	function setClockwise(value:Bool):Ellipse;
	/**
		Sets the rotation of this curve.
	**/
	function setRotation(value:Float):Ellipse;
	/**
		The x coordinate of the center of the ellipse.
	**/
	var x : Float;
	/**
		The y coordinate of the center of the ellipse.
	**/
	var y : Float;
	/**
		The horizontal radius of the ellipse.
	**/
	var xRadius : Float;
	/**
		The vertical radius of the ellipse.
	**/
	var yRadius : Float;
	/**
		The start angle of the ellipse in degrees.
	**/
	var startAngle : Float;
	/**
		The end angle of the ellipse in degrees.
	**/
	var endAngle : Float;
	/**
		`true` if the ellipse rotation is clockwise or `false` if anti-clockwise.
	**/
	var clockwise : Bool;
	/**
		The rotation of the ellipse, relative to the center, in degrees.
	**/
	var angle : Float;
	/**
		The rotation of the ellipse, relative to the center, in radians.
	**/
	var rotation : Float;
	/**
		JSON serialization of the curve.
	**/
	function toJSON():global.phaser.types.curves.JSONEllipseCurve;
	static var prototype : Ellipse;
	/**
		Creates a curve from the provided Ellipse Curve Configuration object.
	**/
	static function fromJSON(data:global.phaser.types.curves.JSONEllipseCurve):Ellipse;
}