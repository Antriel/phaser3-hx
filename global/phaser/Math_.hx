package global.phaser;

@:native("Phaser.Math") @valueModuleOnly extern class Math_ {
	/**
		Calculate the mean average of the given values.
	**/
	static function Average(values:Array<Float>):Float;
	/**
		Calculates the Bernstein basis from the three factorial coefficients.
	**/
	static function Bernstein(n:Float, i:Float):Float;
	/**
		Compute a random integer between the `min` and `max` values, inclusive.
	**/
	static function Between(min:Float, max:Float):Float;
	/**
		Calculates a Catmull-Rom value from the given points, based on an alpha of 0.5.
	**/
	static function CatmullRom(t:Float, p0:Float, p1:Float, p2:Float, p3:Float):Float;
	/**
		Ceils to some place comparative to a `base`, default is 10 for decimal place.
		
		The `place` is represented by the power applied to `base` to get that place.
	**/
	static function CeilTo(value:Float, ?place:Float, ?base:Float):Float;
	/**
		Force a value within the boundaries by clamping it to the range `min`, `max`.
	**/
	static function Clamp(value:Float, min:Float, max:Float):Float;
	/**
		Convert the given angle from degrees, to the equivalent angle in radians.
	**/
	static function DegToRad(degrees:Float):Float;
	/**
		Calculates the positive difference of two given numbers.
	**/
	static function Difference(a:Float, b:Float):Float;
	/**
		Calculates the factorial of a given number for integer values greater than 0.
	**/
	static function Factorial(value:Float):Float;
	/**
		Generate a random floating point number between the two given bounds, minimum inclusive, maximum exclusive.
	**/
	static function FloatBetween(min:Float, max:Float):Float;
	/**
		Floors to some place comparative to a `base`, default is 10 for decimal place.
		
		The `place` is represented by the power applied to `base` to get that place.
	**/
	static function FloorTo(value:Float, ?place:Float, ?base:Float):Float;
	/**
		Return a value based on the range between `min` and `max` and the percentage given.
	**/
	static function FromPercent(percent:Float, min:Float, ?max:Float):Float;
	/**
		Calculate a per-ms speed from a distance and time (given in seconds).
	**/
	static function GetSpeed(distance:Float, time:Float):Float;
	/**
		Check if a given value is an even number.
	**/
	static function IsEven(value:Float):Bool;
	/**
		Check if a given value is an even number using a strict type check.
	**/
	static function IsEvenStrict(value:Float):Bool;
	/**
		Calculates a linear (interpolation) value over t.
	**/
	static function Linear(p0:Float, p1:Float, t:Float):Float;
	/**
		Add an `amount` to a `value`, limiting the maximum result to `max`.
	**/
	static function MaxAdd(value:Float, amount:Float, max:Float):Float;
	/**
		Subtract an `amount` from `value`, limiting the minimum result to `min`.
	**/
	static function MinSub(value:Float, amount:Float, min:Float):Float;
	/**
		Work out what percentage `value` is of the range between `min` and `max`.
		If `max` isn't given then it will return the percentage of `value` to `min`.
		
		You can optionally specify an `upperMax` value, which is a mid-way point in the range that represents 100%, after which the % starts to go down to zero again.
	**/
	static function Percent(value:Float, min:Float, ?max:Float, ?upperMax:Float):Float;
	/**
		Convert the given angle in radians, to the equivalent angle in degrees.
	**/
	static function RadToDeg(radians:Float):Float;
	/**
		Compute a random unit vector.
		
		Computes random values for the given vector between -1 and 1 that can be used to represent a direction.
		
		Optionally accepts a scale value to scale the resulting vector by.
	**/
	static function RandomXY(vector:global.phaser.math.Vector2, ?scale:Float):global.phaser.math.Vector2;
	/**
		Compute a random position vector in a spherical area, optionally defined by the given radius.
	**/
	static function RandomXYZ(vec3:global.phaser.math.Vector3, ?radius:Float):global.phaser.math.Vector3;
	/**
		Compute a random four-dimensional vector.
	**/
	static function RandomXYZW(vec4:global.phaser.math.Vector4, ?scale:Float):global.phaser.math.Vector4;
	/**
		Rotate a given point by a given angle around the origin (0, 0), in an anti-clockwise direction.
	**/
	static function Rotate(point:ts.AnyOf2<Dynamic, global.phaser.geom.Point>, angle:Float):global.phaser.geom.Point;
	/**
		Rotate a `point` around `x` and `y` to the given `angle`, at the same distance.
		
		In polar notation, this maps a point from (r, t) to (r, angle), vs. the origin (x, y).
	**/
	static function RotateAround<T>(point:T, x:Float, y:Float, angle:Float):T;
	/**
		Rotate a `point` around `x` and `y` by the given `angle` and `distance`.
		
		In polar notation, this maps a point from (r, t) to (distance, t + angle), vs. the origin (x, y).
	**/
	static function RotateAroundDistance<T>(point:T, x:Float, y:Float, angle:Float, distance:Float):T;
	/**
		Position a `point` at the given `angle` and `distance` to (`x`, `y`).
	**/
	static function RotateTo<T>(point:T, x:Float, y:Float, angle:Float, distance:Float):T;
	/**
		Rotates a vector in place by axis angle.
		
		This is the same as transforming a point by an
		axis-angle quaternion, but it has higher precision.
	**/
	static function RotateVec3(vec:global.phaser.math.Vector3, axis:global.phaser.math.Vector3, radians:Float):global.phaser.math.Vector3;
	/**
		Round a given number so it is further away from zero. That is, positive numbers are rounded up, and negative numbers are rounded down.
	**/
	static function RoundAwayFromZero(value:Float):Float;
	/**
		Round a value to the given precision.
		
		For example:
		
		```javascript
		RoundTo(123.456, 0) = 123
		RoundTo(123.456, 1) = 120
		RoundTo(123.456, 2) = 100
		```
		
		To round the decimal, i.e. to round to precision, pass in a negative `place`:
		
		```javascript
		RoundTo(123.456789, 0) = 123
		RoundTo(123.456789, -1) = 123.5
		RoundTo(123.456789, -2) = 123.46
		RoundTo(123.456789, -3) = 123.457
		```
	**/
	static function RoundTo(value:Float, ?place:Float, ?base:Float):Float;
	/**
		Generate a series of sine and cosine values.
	**/
	static function SinCosTableGenerator(length:Float, ?sinAmp:Float, ?cosAmp:Float, ?frequency:Float):global.phaser.types.math.SinCosTable;
	/**
		Calculate a smoother interpolation percentage of `x` between `min` and `max`.
		
		The function receives the number `x` as an argument and returns 0 if `x` is less than or equal to the left edge,
		1 if `x` is greater than or equal to the right edge, and smoothly interpolates, using a Hermite polynomial,
		between 0 and 1 otherwise.
		
		Produces an even smoother interpolation than {@link Phaser.Math.SmoothStep}.
	**/
	static function SmootherStep(x:Float, min:Float, max:Float):Float;
	/**
		Calculate a smooth interpolation percentage of `x` between `min` and `max`.
		
		The function receives the number `x` as an argument and returns 0 if `x` is less than or equal to the left edge,
		1 if `x` is greater than or equal to the right edge, and smoothly interpolates, using a Hermite polynomial,
		between 0 and 1 otherwise.
	**/
	static function SmoothStep(x:Float, min:Float, max:Float):Float;
	/**
		Returns a Vector2 containing the x and y position of the given index in a `width` x `height` sized grid.
		
		For example, in a 6 x 4 grid, index 16 would equal x: 4 y: 2.
		
		If the given index is out of range an empty Vector2 is returned.
	**/
	static function ToXY(index:Float, width:Float, height:Float, ?out:global.phaser.math.Vector2):global.phaser.math.Vector2;
	/**
		Takes the `x` and `y` coordinates and transforms them into the same space as
		defined by the position, rotation and scale values.
	**/
	static function TransformXY(x:Float, y:Float, positionX:Float, positionY:Float, rotation:Float, scaleX:Float, scaleY:Float, ?output:ts.AnyOf3<Dynamic, global.phaser.math.Vector2, global.phaser.geom.Point>):ts.AnyOf3<Dynamic, global.phaser.math.Vector2, global.phaser.geom.Point>;
	/**
		Checks if the two values are within the given `tolerance` of each other.
	**/
	static function Within(a:Float, b:Float, tolerance:Float):Bool;
	/**
		Wrap the given `value` between `min` and `max.
	**/
	static function Wrap(value:Float, min:Float, max:Float):Float;
	/**
		The value of PI * 2.
	**/
	static var PI2 : Float;
	/**
		The value of PI * 0.5.
	**/
	static var TAU : Float;
	/**
		An epsilon value (1.0e-6)
	**/
	static var EPSILON : Float;
	/**
		For converting degrees to radians (PI / 180)
	**/
	static var DEG_TO_RAD : Float;
	/**
		For converting radians to degrees (180 / PI)
	**/
	static var RAD_TO_DEG : Float;
	/**
		An instance of the Random Number Generator.
		This is not set until the Game boots.
	**/
	static var RND : global.phaser.math.RandomDataGenerator;
	/**
		The minimum safe integer this browser supports.
		We use a const for backward compatibility with Internet Explorer.
	**/
	static var MIN_SAFE_INTEGER : Float;
	/**
		The maximum safe integer this browser supports.
		We use a const for backward compatibility with Internet Explorer.
	**/
	static var MAX_SAFE_INTEGER : Float;
}