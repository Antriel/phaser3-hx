package global.phaser.curves;

/**
	A Base Curve class, which all other curve types extend.
	
	Based on the three.js Curve classes created by [zz85](http://www.lab4games.net/zz85/blog)
**/
@:native("Phaser.Curves.Curve") extern class Curve {
	function new(type:String);
	/**
		String based identifier for the type of curve.
	**/
	var type : String;
	/**
		The default number of divisions within the curve.
	**/
	var defaultDivisions : Float;
	/**
		The quantity of arc length divisions within the curve.
	**/
	var arcLengthDivisions : Float;
	/**
		An array of cached arc length values.
	**/
	var cacheArcLengths : Array<Float>;
	/**
		Does the data of this curve need updating?
	**/
	var needsUpdate : Bool;
	/**
		For a curve on a Path, `false` means the Path will ignore this curve.
	**/
	var active : Bool;
	/**
		Draws this curve on the given Graphics object.
		
		The curve is drawn using `Graphics.strokePoints` so will be drawn at whatever the present Graphics stroke color is.
		The Graphics object is not cleared before the draw, so the curve will appear on-top of anything else already rendered to it.
	**/
	function draw<G>(graphics:G, ?pointsTotal:Float):G;
	/**
		Returns a Rectangle where the position and dimensions match the bounds of this Curve.
		
		You can control the accuracy of the bounds. The value given is used to work out how many points
		to plot across the curve. Higher values are more accurate at the cost of calculation speed.
	**/
	function getBounds(?out:global.phaser.geom.Rectangle, ?accuracy:Float):global.phaser.geom.Rectangle;
	/**
		Returns an array of points, spaced out X distance pixels apart.
		The smaller the distance, the larger the array will be.
	**/
	function getDistancePoints(distance:Float):Array<global.phaser.geom.Point>;
	/**
		Get a point at the end of the curve.
	**/
	function getEndPoint(?out:global.phaser.math.Vector2):global.phaser.math.Vector2;
	/**
		Get total curve arc length
	**/
	function getLength():Float;
	/**
		Get a list of cumulative segment lengths.
		
		These lengths are
		
		- [0] 0
		- [1] The first segment
		- [2] The first and second segment
		- ...
		- [divisions] All segments
	**/
	function getLengths(?divisions:Float):Array<Float>;
	/**
		Get a point at a relative position on the curve, by arc length.
	**/
	function getPointAt<O>(u:Float, ?out:O):O;
	/**
		Get a sequence of evenly spaced points from the curve.
		
		You can pass `divisions`, `stepRate`, or neither.
		
		The number of divisions will be
		
		1. `divisions`, if `divisions` > 0; or
		2. `this.getLength / stepRate`, if `stepRate` > 0; or
		3. `this.defaultDivisions`
		
		`1 + divisions` points will be returned.
	**/
	function getPoints<O>(?divisions:Float, ?stepRate:Float, ?out:O):O;
	/**
		Get a random point from the curve.
	**/
	function getRandomPoint<O>(?out:O):O;
	/**
		Get a sequence of equally spaced points (by arc distance) from the curve.
		
		`1 + divisions` points will be returned.
	**/
	function getSpacedPoints(?divisions:Float, ?stepRate:Float, ?out:ts.AnyOf2<Array<Dynamic>, Array<global.phaser.math.Vector2>>):Array<global.phaser.math.Vector2>;
	/**
		Get a point at the start of the curve.
	**/
	function getStartPoint<O>(?out:O):O;
	/**
		Get a unit vector tangent at a relative position on the curve.
		In case any sub curve does not implement its tangent derivation,
		2 points a small delta apart will be used to find its gradient
		which seems to give a reasonable approximation
	**/
	function getTangent<O>(t:Float, ?out:O):O;
	/**
		Get a unit vector tangent at a relative position on the curve, by arc length.
	**/
	function getTangentAt<O>(u:Float, ?out:O):O;
	/**
		Given a distance in pixels, get a t to find p.
	**/
	function getTFromDistance(distance:Float, ?divisions:Float):Float;
	/**
		Given u ( 0 .. 1 ), get a t to find p. This gives you points which are equidistant.
	**/
	function getUtoTmapping(u:Float, distance:Float, ?divisions:Float):Float;
	/**
		Calculate and cache the arc lengths.
	**/
	function updateArcLengths():Void;
	static var prototype : Curve;
}