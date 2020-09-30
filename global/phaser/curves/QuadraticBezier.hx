package global.phaser.curves;

/**
	A quadratic Bézier curve constructed from two control points.
**/
@:native("Phaser.Curves.QuadraticBezier") extern class QuadraticBezier extends Curve {
	function new(p0:ts.AnyOf2<global.phaser.math.Vector2, Array<Float>>, p1:global.phaser.math.Vector2, p2:global.phaser.math.Vector2);
	/**
		The start point.
	**/
	var p0 : global.phaser.math.Vector2;
	/**
		The first control point.
	**/
	var p1 : global.phaser.math.Vector2;
	/**
		The second control point.
	**/
	var p2 : global.phaser.math.Vector2;
	/**
		Get the resolution of the curve.
	**/
	function getResolution(divisions:Float):Float;
	/**
		Get point at relative position in curve according to length.
	**/
	function getPoint<O>(t:Float, ?out:O):O;
	/**
		Converts the curve into a JSON compatible object.
	**/
	function toJSON():global.phaser.types.curves.JSONCurve;
	static var prototype : QuadraticBezier;
	/**
		Creates a curve from a JSON object, e. g. created by `toJSON`.
	**/
	static function fromJSON(data:global.phaser.types.curves.JSONCurve):QuadraticBezier;
}