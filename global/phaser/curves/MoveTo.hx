package global.phaser.curves;

/**
	A MoveTo Curve is a very simple curve consisting of only a single point.
	Its intended use is to move the ending point in a Path.
**/
@:native("Phaser.Curves.MoveTo") extern class MoveTo {
	function new(?x:Float, ?y:Float);
	/**
		Denotes that this Curve does not influence the bounds, points, and drawing of its parent Path. Must be `false` or some methods in the parent Path will throw errors.
	**/
	var active : Bool;
	/**
		The lone point which this curve consists of.
	**/
	var p0 : global.phaser.math.Vector2;
	/**
		Get point at relative position in curve according to length.
	**/
	function getPoint<O>(t:Float, ?out:O):O;
	/**
		Retrieves the point at given position in the curve. This will always return this curve's only point.
	**/
	function getPointAt<O>(u:Float, ?out:O):O;
	/**
		Gets the resolution of this curve.
	**/
	function getResolution():Float;
	/**
		Gets the length of this curve.
	**/
	function getLength():Float;
	/**
		Converts this curve into a JSON-serializable object.
	**/
	function toJSON():global.phaser.types.curves.JSONCurve;
	static var prototype : MoveTo;
}