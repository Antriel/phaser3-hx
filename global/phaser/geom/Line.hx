package global.phaser.geom;

/**
	Defines a Line segment, a part of a line between two endpoints.
**/
@:native("Phaser.Geom.Line") extern class Line {
	function new(?x1:Float, ?y1:Float, ?x2:Float, ?y2:Float);
	/**
		The geometry constant type of this object: `GEOM_CONST.LINE`.
		Used for fast type comparisons.
	**/
	final type : Float;
	/**
		The x coordinate of the lines starting point.
	**/
	var x1 : Float;
	/**
		The y coordinate of the lines starting point.
	**/
	var y1 : Float;
	/**
		The x coordinate of the lines ending point.
	**/
	var x2 : Float;
	/**
		The y coordinate of the lines ending point.
	**/
	var y2 : Float;
	/**
		Get a point on a line that's a given percentage along its length.
	**/
	function getPoint<O>(position:Float, ?output:O):O;
	/**
		Get a number of points along a line's length.
		
		Provide a `quantity` to get an exact number of points along the line.
		
		Provide a `stepRate` to ensure a specific distance between each point on the line. Set `quantity` to `0` when
		providing a `stepRate`.
	**/
	function getPoints<O>(quantity:Float, ?stepRate:Float, ?output:O):O;
	/**
		Get a random Point on the Line.
	**/
	function getRandomPoint<O>(?point:O):O;
	/**
		Set new coordinates for the line endpoints.
	**/
	function setTo(?x1:Float, ?y1:Float, ?x2:Float, ?y2:Float):Line;
	/**
		Returns a Vector2 object that corresponds to the start of this Line.
	**/
	function getPointA<O>(?vec2:O):O;
	/**
		Returns a Vector2 object that corresponds to the end of this Line.
	**/
	function getPointB<O>(?vec2:O):O;
	/**
		The left position of the Line.
	**/
	var left : Float;
	/**
		The right position of the Line.
	**/
	var right : Float;
	/**
		The top position of the Line.
	**/
	var top : Float;
	/**
		The bottom position of the Line.
	**/
	var bottom : Float;
	static var prototype : Line;
	/**
		Calculate the angle of the line in radians.
	**/
	static function Angle(line:Line):Float;
	/**
		Using Bresenham's line algorithm this will return an array of all coordinates on this line.
		
		The `start` and `end` points are rounded before this runs as the algorithm works on integers.
	**/
	static function BresenhamPoints(line:Line, ?stepRate:Float, ?results:Array<global.phaser.types.math.Vector2Like>):Array<global.phaser.types.math.Vector2Like>;
	/**
		Center a line on the given coordinates.
	**/
	static function CenterOn(line:Line, x:Float, y:Float):Line;
	/**
		Clone the given line.
	**/
	static function Clone(source:Line):Line;
	/**
		Copy the values of one line to a destination line.
	**/
	static function CopyFrom<O>(source:Line, dest:O):O;
	/**
		Compare two lines for strict equality.
	**/
	static function Equals(line:Line, toCompare:Line):Bool;
	/**
		Extends the start and end points of a Line by the given amounts.
		
		The amounts can be positive or negative. Positive points will increase the length of the line,
		while negative ones will decrease it.
		
		If no `right` value is provided it will extend the length of the line equally in both directions.
		
		Pass a value of zero to leave the start or end point unchanged.
	**/
	static function Extend(line:Line, left:Float, ?right:Float):Line;
	/**
		Returns an array of `quantity` Points where each point is taken from the given Line,
		spaced out according to the ease function specified.
		
		```javascript
		const line = new Phaser.Geom.Line(100, 300, 700, 300);
		const points = Phaser.Geom.Line.GetEasedPoints(line, 'sine.out', 32)
		```
		
		In the above example, the `points` array will contain 32 points spread-out across
		the length of `line`, where the position of each point is determined by the `Sine.out`
		ease function.
		
		You can optionally provide a collinear threshold. In this case, the resulting points
		are checked against each other, and if they are `< collinearThreshold` distance apart,
		they are dropped from the results. This can help avoid lots of clustered points at
		far ends of the line with tightly-packed eases such as Quartic. Leave the value set
		to zero to skip this check.
		
		Note that if you provide a collinear threshold, the resulting array may not always
		contain `quantity` points.
	**/
	static function GetEasedPoints<O>(line:Line, ease:ts.AnyOf2<String, haxe.Constraints.Function>, quantity:Float, ?collinearThreshold:Float, ?easeParams:Array<Float>):O;
	/**
		Get the midpoint of the given line.
	**/
	static function GetMidPoint<O>(line:Line, ?out:O):O;
	/**
		Get the nearest point on a line perpendicular to the given point.
	**/
	static function GetNearestPoint<O>(line:Line, point:ts.AnyOf2<Dynamic, Point>, ?out:O):O;
	/**
		Calculate the normal of the given line.
		
		The normal of a line is a vector that points perpendicular from it.
	**/
	static function GetNormal<O>(line:Line, ?out:O):O;
	/**
		Get a point on a line that's a given percentage along its length.
	**/
	static function GetPoint<O>(line:Line, position:Float, ?out:O):O;
	/**
		Get a number of points along a line's length.
		
		Provide a `quantity` to get an exact number of points along the line.
		
		Provide a `stepRate` to ensure a specific distance between each point on the line. Set `quantity` to `0` when
		providing a `stepRate`.
	**/
	static function GetPoints<O>(line:Line, quantity:Float, ?stepRate:Float, ?out:O):O;
	/**
		Get the shortest distance from a Line to the given Point.
	**/
	static function GetShortestDistance<O>(line:Line, point:ts.AnyOf2<Dynamic, Point>):O;
	/**
		Calculate the height of the given line.
	**/
	static function Height(line:Line):Float;
	/**
		Calculate the length of the given line.
	**/
	static function Length(line:Line):Float;
	/**
		Get the angle of the normal of the given line in radians.
	**/
	static function NormalAngle(line:Line):Float;
	/**
		Returns the x component of the normal vector of the given line.
	**/
	static function NormalX(line:Line):Float;
	/**
		The Y value of the normal of the given line.
		The normal of a line is a vector that points perpendicular from it.
	**/
	static function NormalY(line:Line):Float;
	/**
		Offset a line by the given amount.
	**/
	static function Offset<O>(line:O, x:Float, y:Float):O;
	/**
		Calculate the perpendicular slope of the given line.
	**/
	static function PerpSlope(line:Line):Float;
	/**
		Returns a random point on a given Line.
	**/
	static function Random<O>(line:Line, ?out:O):O;
	/**
		Calculate the reflected angle between two lines.
		
		This is the outgoing angle based on the angle of Line 1 and the normalAngle of Line 2.
	**/
	static function ReflectAngle(lineA:Line, lineB:Line):Float;
	/**
		Rotate a line around its midpoint by the given angle in radians.
	**/
	static function Rotate<O>(line:O, angle:Float):O;
	/**
		Rotate a line around a point by the given angle in radians.
	**/
	static function RotateAroundPoint<O>(line:O, point:ts.AnyOf2<Dynamic, Point>, angle:Float):O;
	/**
		Rotate a line around the given coordinates by the given angle in radians.
	**/
	static function RotateAroundXY<O>(line:O, x:Float, y:Float, angle:Float):O;
	/**
		Set a line to a given position, angle and length.
	**/
	static function SetToAngle<O>(line:O, x:Float, y:Float, angle:Float, length:Float):O;
	/**
		Calculate the slope of the given line.
	**/
	static function Slope(line:Line):Float;
	/**
		Calculate the width of the given line.
	**/
	static function Width(line:Line):Float;
}