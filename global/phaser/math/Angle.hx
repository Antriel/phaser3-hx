package global.phaser.math;

@:native("Phaser.Math.Angle") @valueModuleOnly extern class Angle {
	/**
		Find the angle of a segment from (x1, y1) -> (x2, y2).
	**/
	static function Between(x1:Float, y1:Float, x2:Float, y2:Float):Float;
	/**
		Find the angle of a segment from (point1.x, point1.y) -> (point2.x, point2.y).
		
		Calculates the angle of the vector from the first point to the second point.
	**/
	static function BetweenPoints(point1:global.phaser.types.math.Vector2Like, point2:global.phaser.types.math.Vector2Like):Float;
	/**
		Find the angle of a segment from (point1.x, point1.y) -> (point2.x, point2.y).
		
		The difference between this method and {@link Phaser.Math.Angle.BetweenPoints} is that this assumes the y coordinate
		travels down the screen.
	**/
	static function BetweenPointsY(point1:global.phaser.types.math.Vector2Like, point2:global.phaser.types.math.Vector2Like):Float;
	/**
		Find the angle of a segment from (x1, y1) -> (x2, y2).
		
		The difference between this method and {@link Phaser.Math.Angle.Between} is that this assumes the y coordinate
		travels down the screen.
	**/
	static function BetweenY(x1:Float, y1:Float, x2:Float, y2:Float):Float;
	/**
		Takes an angle in Phasers default clockwise format and converts it so that
		0 is North, 90 is West, 180 is South and 270 is East,
		therefore running counter-clockwise instead of clockwise.
		
		You can pass in the angle from a Game Object using:
		
		```javascript
		var converted = CounterClockwise(gameobject.rotation);
		```
		
		All values for this function are in radians.
	**/
	static function CounterClockwise(angle:Float):Float;
	/**
		Normalize an angle to the [0, 2pi] range.
	**/
	static function Normalize(angle:Float):Float;
	/**
		Returns a random angle in the range [-pi, pi].
	**/
	static function Random():Float;
	/**
		Returns a random angle in the range [-180, 180].
	**/
	static function RandomDegrees():Float;
	/**
		Reverse the given angle.
	**/
	static function Reverse(angle:Float):Float;
	/**
		Rotates `currentAngle` towards `targetAngle`, taking the shortest rotation distance. The `lerp` argument is the amount to rotate by in this call.
	**/
	static function RotateTo(currentAngle:Float, targetAngle:Float, ?lerp:Float):Float;
	/**
		Gets the shortest angle between `angle1` and `angle2`.
		
		Both angles must be in the range -180 to 180, which is the same clamped
		range that `sprite.angle` uses, so you can pass in two sprite angles to
		this method and get the shortest angle back between the two of them.
		
		The angle returned will be in the same range. If the returned angle is
		greater than 0 then it's a counter-clockwise rotation, if < 0 then it's
		a clockwise rotation.
	**/
	static function ShortestBetween(angle1:Float, angle2:Float):Float;
	/**
		Wrap an angle.
		
		Wraps the angle to a value in the range of -PI to PI.
	**/
	static function Wrap(angle:Float):Float;
	/**
		Wrap an angle in degrees.
		
		Wraps the angle to a value in the range of -180 to 180.
	**/
	static function WrapDegrees(angle:Float):Float;
}