package global.phaser.curves;

/**
	A Path combines multiple Curves into one continuous compound curve.
	It does not matter how many Curves are in the Path or what type they are.
	
	A Curve in a Path does not have to start where the previous Curve ends - that is to say, a Path does not
	have to be an uninterrupted curve. Only the order of the Curves influences the actual points on the Path.
**/
@:native("Phaser.Curves.Path") extern class Path {
	function new(?x:Float, ?y:Float);
	/**
		The name of this Path.
		Empty by default and never populated by Phaser, this is left for developers to use.
	**/
	var name : String;
	/**
		The list of Curves which make up this Path.
	**/
	var curves : Array<Curve>;
	/**
		The cached length of each Curve in the Path.
		
		Used internally by {@link #getCurveLengths}.
	**/
	var cacheLengths : Array<Float>;
	/**
		Automatically closes the path.
	**/
	var autoClose : Bool;
	/**
		The starting point of the Path.
		
		This is not necessarily equivalent to the starting point of the first Curve in the Path. In an empty Path, it's also treated as the ending point.
	**/
	var startPoint : global.phaser.math.Vector2;
	/**
		Appends a Curve to the end of the Path.
		
		The Curve does not have to start where the Path ends or, for an empty Path, at its defined starting point.
	**/
	function add(curve:Curve):Path;
	/**
		Creates a circular Ellipse Curve positioned at the end of the Path.
	**/
	function circleTo(radius:Float, ?clockwise:Bool, ?rotation:Float):Path;
	/**
		Ensures that the Path is closed.
		
		A closed Path starts and ends at the same point. If the Path is not closed, a straight Line Curve will be created from the ending point directly to the starting point. During the check, the actual starting point of the Path, i.e. the starting point of the first Curve, will be used as opposed to the Path's defined {@link startPoint}, which could differ.
		
		Calling this method on an empty Path will result in an error.
	**/
	function closePath():Path;
	/**
		Creates a cubic bezier curve starting at the previous end point and ending at p3, using p1 and p2 as control points.
	**/
	function cubicBezierTo(x:ts.AnyOf2<Float, global.phaser.math.Vector2>, y:ts.AnyOf2<Float, global.phaser.math.Vector2>, control1X:ts.AnyOf2<Float, global.phaser.math.Vector2>, ?control1Y:Float, ?control2X:Float, ?control2Y:Float):Path;
	/**
		Creates a Quadratic Bezier Curve starting at the ending point of the Path.
	**/
	function quadraticBezierTo(x:ts.AnyOf2<Float, Array<global.phaser.math.Vector2>>, ?y:Float, ?controlX:Float, ?controlY:Float):Path;
	/**
		Draws all Curves in the Path to a Graphics Game Object.
	**/
	function draw<G>(graphics:global.phaser.gameobjects.Graphics, ?pointsTotal:Float):G;
	/**
		Creates an ellipse curve positioned at the previous end point, using the given parameters.
	**/
	function ellipseTo(?xRadius:Float, ?yRadius:Float, ?startAngle:Float, ?endAngle:Float, ?clockwise:Bool, ?rotation:Float):Path;
	/**
		Creates a Path from a Path Configuration object.
		
		The provided object should be a {@link Phaser.Types.Curves.JSONPath}, as returned by {@link #toJSON}. Providing a malformed object may cause errors.
	**/
	function fromJSON(data:global.phaser.types.curves.JSONPath):Path;
	/**
		Returns a Rectangle with a position and size matching the bounds of this Path.
	**/
	function getBounds<O>(?out:O, ?accuracy:Float):O;
	/**
		Returns an array containing the length of the Path at the end of each Curve.
		
		The result of this method will be cached to avoid recalculating it in subsequent calls. The cache is only invalidated when the {@link #curves} array changes in length, leading to potential inaccuracies if a Curve in the Path is changed, or if a Curve is removed and another is added in its place.
	**/
	function getCurveLengths():Array<Float>;
	/**
		Returns the ending point of the Path.
		
		A Path's ending point is equivalent to the ending point of the last Curve in the Path. For an empty Path, the ending point is at the Path's defined {@link #startPoint}.
	**/
	function getEndPoint<O>(?out:O):O;
	/**
		Returns the total length of the Path.
	**/
	function getLength():Float;
	/**
		Calculates the coordinates of the point at the given normalized location (between 0 and 1) on the Path.
		
		The location is relative to the entire Path, not to an individual Curve. A location of 0.5 is always in the middle of the Path and is thus an equal distance away from both its starting and ending points. In a Path with one Curve, it would be in the middle of the Curve; in a Path with two Curves, it could be anywhere on either one of them depending on their lengths.
	**/
	function getPoint<O>(t:Float, ?out:O):O;
	/**
		Get a sequence of points on the path.
	**/
	function getPoints(?divisions:Float):Array<global.phaser.math.Vector2>;
	/**
		Returns a randomly chosen point anywhere on the path. This follows the same rules as `getPoint` in that it may return a point on any Curve inside this path.
		
		When calling this method multiple times, the points are not guaranteed to be equally spaced spatially.
	**/
	function getRandomPoint<O>(?out:O):O;
	/**
		Divides this Path into a set of equally spaced points,
		
		The resulting points are equally spaced with respect to the points' position on the path, but not necessarily equally spaced spatially.
	**/
	function getSpacedPoints(?divisions:Float):Array<global.phaser.math.Vector2>;
	/**
		Returns the starting point of the Path.
	**/
	function getStartPoint<O>(?out:O):O;
	/**
		Gets a unit vector tangent at a relative position on the path.
	**/
	function getTangent<O>(t:Float, ?out:O):O;
	/**
		Creates a line curve from the previous end point to x/y.
	**/
	function lineTo(x:ts.AnyOf2<Float, global.phaser.math.Vector2>, ?y:Float):Path;
	/**
		Creates a spline curve starting at the previous end point, using the given points on the curve.
	**/
	function splineTo(points:Array<global.phaser.math.Vector2>):Path;
	/**
		Creates a "gap" in this path from the path's current end point to the given coordinates.
		
		After calling this function, this Path's end point will be equal to the given coordinates
	**/
	function moveTo(x:ts.AnyOf2<Float, global.phaser.math.Vector2>, ?y:Float):Path;
	/**
		Converts this Path to a JSON object containing the path information and its constituent curves.
	**/
	function toJSON():global.phaser.types.curves.JSONPath;
	/**
		cacheLengths must be recalculated.
	**/
	function updateArcLengths():Void;
	/**
		Disposes of this Path, clearing its internal references to objects so they can be garbage-collected.
	**/
	function destroy():Void;
	static var prototype : Path;
}