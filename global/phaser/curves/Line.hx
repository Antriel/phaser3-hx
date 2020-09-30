package global.phaser.curves;

/**
	A LineCurve is a "curve" comprising exactly two points (a line segment).
**/
@:native("Phaser.Curves.Line") extern class Line extends Curve {
	function new(p0:ts.AnyOf2<global.phaser.math.Vector2, Array<Float>>, ?p1:global.phaser.math.Vector2);
	/**
		The first endpoint.
	**/
	var p0 : global.phaser.math.Vector2;
	/**
		The second endpoint.
	**/
	var p1 : global.phaser.math.Vector2;
	/**
		Returns a Rectangle where the position and dimensions match the bounds of this Curve.
	**/
	function getBounds<O>(?out:O):O;
	/**
		Gets the resolution of the line.
	**/
	function getResolution(?divisions:Float):Float;
	/**
		Get point at relative position in curve according to length.
	**/
	function getPoint<O>(t:Float, ?out:O):O;
	/**
		Gets the slope of the line as a unit vector.
	**/
	function getTangent<O>():O;
	/**
		Draws this curve on the given Graphics object.
		
		The curve is drawn using `Graphics.lineBetween` so will be drawn at whatever the present Graphics line color is.
		The Graphics object is not cleared before the draw, so the curve will appear on-top of anything else already rendered to it.
	**/
	function draw<G>(graphics:G):G;
	/**
		Gets a JSON representation of the line.
	**/
	function toJSON():global.phaser.types.curves.JSONCurve;
	static var prototype : Line;
	/**
		Configures this line from a JSON representation.
	**/
	static function fromJSON(data:global.phaser.types.curves.JSONCurve):Line;
}