package global.phaser.curves;

/**
	Create a smooth 2d spline curve from a series of points.
**/
@:native("Phaser.Curves.Spline") extern class Spline extends Curve {
	function new(?points:ts.AnyOf3<Array<Float>, Array<global.phaser.math.Vector2>, Array<Array<Float>>>);
	/**
		The Vector2 points that configure the curve.
	**/
	var points : Array<global.phaser.math.Vector2>;
	/**
		Add a list of points to the current list of Vector2 points of the curve.
	**/
	function addPoints(points:ts.AnyOf3<Array<Float>, Array<global.phaser.math.Vector2>, Array<Array<Float>>>):Spline;
	/**
		Add a point to the current list of Vector2 points of the curve.
	**/
	function addPoint(x:Float, y:Float):global.phaser.math.Vector2;
	/**
		Get the resolution of the curve.
	**/
	function getResolution(divisions:Float):Float;
	/**
		Get point at relative position in curve according to length.
	**/
	function getPoint<O>(t:Float, ?out:O):O;
	/**
		Exports a JSON object containing this curve data.
	**/
	function toJSON():global.phaser.types.curves.JSONCurve;
	static var prototype : Spline;
	/**
		Imports a JSON object containing this curve data.
	**/
	static function fromJSON(data:global.phaser.types.curves.JSONCurve):Spline;
}