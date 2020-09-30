package global.phaser.math;

/**
	A representation of a vector in 4D space.
	
	A four-component vector.
**/
@:native("Phaser.Math.Vector4") extern class Vector4 {
	function new(?x:Float, ?y:Float, ?z:Float, ?w:Float);
	/**
		The x component of this Vector.
	**/
	var x : Float;
	/**
		The y component of this Vector.
	**/
	var y : Float;
	/**
		The z component of this Vector.
	**/
	var z : Float;
	/**
		The w component of this Vector.
	**/
	var w : Float;
	/**
		Make a clone of this Vector4.
	**/
	function clone():Vector4;
	/**
		Copy the components of a given Vector into this Vector.
	**/
	function copy(src:Vector4):Vector4;
	/**
		Check whether this Vector is equal to a given Vector.
		
		Performs a strict quality check against each Vector's components.
	**/
	function equals(v:Vector4):Bool;
	/**
		Set the `x`, `y`, `z` and `w` components of the this Vector to the given `x`, `y`, `z` and `w` values.
	**/
	function set(x:ts.AnyOf2<Float, Dynamic>, y:Float, z:Float, w:Float):Vector4;
	/**
		Add a given Vector to this Vector. Addition is component-wise.
	**/
	function add(v:ts.AnyOf3<Vector2, Vector4, Vector3>):Vector4;
	/**
		Subtract the given Vector from this Vector. Subtraction is component-wise.
	**/
	function subtract(v:ts.AnyOf3<Vector2, Vector4, Vector3>):Vector4;
	/**
		Scale this Vector by the given value.
	**/
	function scale(scale:Float):Vector4;
	/**
		Calculate the length (or magnitude) of this Vector.
	**/
	function length():Float;
	/**
		Calculate the length of this Vector squared.
	**/
	function lengthSq():Float;
	/**
		Normalize this Vector.
		
		Makes the vector a unit length vector (magnitude of 1) in the same direction.
	**/
	function normalize():Vector4;
	/**
		Calculate the dot product of this Vector and the given Vector.
	**/
	function dot(v:Vector4):Float;
	/**
		Linearly interpolate between this Vector and the given Vector.
		
		Interpolates this Vector towards the given Vector.
	**/
	function lerp(v:Vector4, ?t:Float):Vector4;
	/**
		Perform a component-wise multiplication between this Vector and the given Vector.
		
		Multiplies this Vector by the given Vector.
	**/
	function multiply(v:ts.AnyOf3<Vector2, Vector4, Vector3>):Vector4;
	/**
		Perform a component-wise division between this Vector and the given Vector.
		
		Divides this Vector by the given Vector.
	**/
	function divide(v:ts.AnyOf3<Vector2, Vector4, Vector3>):Vector4;
	/**
		Calculate the distance between this Vector and the given Vector.
	**/
	function distance(v:ts.AnyOf3<Vector2, Vector4, Vector3>):Float;
	/**
		Calculate the distance between this Vector and the given Vector, squared.
	**/
	function distanceSq(v:ts.AnyOf3<Vector2, Vector4, Vector3>):Float;
	/**
		Negate the `x`, `y`, `z` and `w` components of this Vector.
	**/
	function negate():Vector4;
	/**
		Transform this Vector with the given Matrix.
	**/
	function transformMat4(mat:Matrix4):Vector4;
	/**
		Transform this Vector with the given Quaternion.
	**/
	function transformQuat(q:Quaternion):Vector4;
	/**
		Make this Vector the zero vector (0, 0, 0, 0).
	**/
	function reset():Vector4;
	static var prototype : Vector4;
}