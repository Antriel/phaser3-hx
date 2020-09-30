package global.phaser.math;

/**
	A representation of a vector in 2D space.
	
	A two-component vector.
**/
@:native("Phaser.Math.Vector2") extern class Vector2 {
	function new(?x:ts.AnyOf2<Float, global.phaser.types.math.Vector2Like>, ?y:Float);
	/**
		The x component of this Vector.
	**/
	var x : Float;
	/**
		The y component of this Vector.
	**/
	var y : Float;
	/**
		Make a clone of this Vector2.
	**/
	function clone():Vector2;
	/**
		Copy the components of a given Vector into this Vector.
	**/
	function copy(src:Vector2):Vector2;
	/**
		Set the component values of this Vector from a given Vector2Like object.
	**/
	function setFromObject(obj:global.phaser.types.math.Vector2Like):Vector2;
	/**
		Set the `x` and `y` components of the this Vector to the given `x` and `y` values.
	**/
	function set(x:Float, ?y:Float):Vector2;
	/**
		This method is an alias for `Vector2.set`.
	**/
	function setTo(x:Float, ?y:Float):Vector2;
	/**
		Sets the `x` and `y` values of this object from a given polar coordinate.
	**/
	function setToPolar(azimuth:Float, ?radius:Float):Vector2;
	/**
		Check whether this Vector is equal to a given Vector.
		
		Performs a strict equality check against each Vector's components.
	**/
	function equals(v:Vector2):Bool;
	/**
		Check whether this Vector is approximately equal to a given Vector.
	**/
	function fuzzyEquals(v:Vector2, ?epsilon:Float):Bool;
	/**
		Calculate the angle between this Vector and the positive x-axis, in radians.
	**/
	function angle():Float;
	/**
		Set the angle of this Vector.
	**/
	function setAngle(angle:Float):Vector2;
	/**
		Add a given Vector to this Vector. Addition is component-wise.
	**/
	function add(src:Vector2):Vector2;
	/**
		Subtract the given Vector from this Vector. Subtraction is component-wise.
	**/
	function subtract(src:Vector2):Vector2;
	/**
		Perform a component-wise multiplication between this Vector and the given Vector.
		
		Multiplies this Vector by the given Vector.
	**/
	function multiply(src:Vector2):Vector2;
	/**
		Scale this Vector by the given value.
	**/
	function scale(value:Float):Vector2;
	/**
		Perform a component-wise division between this Vector and the given Vector.
		
		Divides this Vector by the given Vector.
	**/
	function divide(src:Vector2):Vector2;
	/**
		Negate the `x` and `y` components of this Vector.
	**/
	function negate():Vector2;
	/**
		Calculate the distance between this Vector and the given Vector.
	**/
	function distance(src:Vector2):Float;
	/**
		Calculate the distance between this Vector and the given Vector, squared.
	**/
	function distanceSq(src:Vector2):Float;
	/**
		Calculate the length (or magnitude) of this Vector.
	**/
	function length():Float;
	/**
		Set the length (or magnitude) of this Vector.
	**/
	function setLength(length:Float):Vector2;
	/**
		Calculate the length of this Vector squared.
	**/
	function lengthSq():Float;
	/**
		Normalize this Vector.
		
		Makes the vector a unit length vector (magnitude of 1) in the same direction.
	**/
	function normalize():Vector2;
	/**
		Rotate this Vector to its perpendicular, in the positive direction.
	**/
	function normalizeRightHand():Vector2;
	/**
		Rotate this Vector to its perpendicular, in the negative direction.
	**/
	function normalizeLeftHand():Vector2;
	/**
		Calculate the dot product of this Vector and the given Vector.
	**/
	function dot(src:Vector2):Float;
	/**
		Calculate the cross product of this Vector and the given Vector.
	**/
	function cross(src:Vector2):Float;
	/**
		Linearly interpolate between this Vector and the given Vector.
		
		Interpolates this Vector towards the given Vector.
	**/
	function lerp(src:Vector2, ?t:Float):Vector2;
	/**
		Transform this Vector with the given Matrix.
	**/
	function transformMat3(mat:Matrix3):Vector2;
	/**
		Transform this Vector with the given Matrix.
	**/
	function transformMat4(mat:Matrix4):Vector2;
	/**
		Make this Vector the zero vector (0, 0).
	**/
	function reset():Vector2;
	/**
		Limit the length (or magnitude) of this Vector.
	**/
	function limit(max:Float):Vector2;
	/**
		Reflect this Vector off a line defined by a normal.
	**/
	function reflect(normal:Vector2):Vector2;
	/**
		Reflect this Vector across another.
	**/
	function mirror(axis:Vector2):Vector2;
	/**
		Rotate this Vector by an angle amount.
	**/
	function rotate(delta:Float):Vector2;
	static var prototype : Vector2;
	/**
		A static zero Vector2 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final ZERO : Vector2;
	/**
		A static right Vector2 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final RIGHT : Vector2;
	/**
		A static left Vector2 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final LEFT : Vector2;
	/**
		A static up Vector2 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final UP : Vector2;
	/**
		A static down Vector2 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final DOWN : Vector2;
	/**
		A static one Vector2 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final ONE : Vector2;
}