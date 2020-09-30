package global.phaser.math;

@:native("Phaser.Math.Distance") @valueModuleOnly extern class Distance {
	/**
		Calculate the distance between two sets of coordinates (points).
	**/
	static function Between(x1:Float, y1:Float, x2:Float, y2:Float):Float;
	/**
		Calculate the distance between two points.
	**/
	static function BetweenPoints(a:global.phaser.types.math.Vector2Like, b:global.phaser.types.math.Vector2Like):Float;
	/**
		Calculate the squared distance between two points.
	**/
	static function BetweenPointsSquared(a:global.phaser.types.math.Vector2Like, b:global.phaser.types.math.Vector2Like):Float;
	/**
		Calculate the Chebyshev distance between two sets of coordinates (points).
		
		Chebyshev distance (or chessboard distance) is the maximum of the horizontal and vertical distances.
		It's the effective distance when movement can be horizontal, vertical, or diagonal.
	**/
	static function Chebyshev(x1:Float, y1:Float, x2:Float, y2:Float):Float;
	/**
		Calculate the distance between two sets of coordinates (points) to the power of `pow`.
	**/
	static function Power(x1:Float, y1:Float, x2:Float, y2:Float, pow:Float):Float;
	/**
		Calculate the snake distance between two sets of coordinates (points).
		
		Snake distance (rectilinear distance, Manhattan distance) is the sum of the horizontal and vertical distances.
		It's the effective distance when movement is allowed only horizontally or vertically (but not both).
	**/
	static function Snake(x1:Float, y1:Float, x2:Float, y2:Float):Float;
	/**
		Calculate the distance between two sets of coordinates (points), squared.
	**/
	static function Squared(x1:Float, y1:Float, x2:Float, y2:Float):Float;
}