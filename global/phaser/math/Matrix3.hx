package global.phaser.math;

/**
	A three-dimensional matrix.
	
	Defaults to the identity matrix when instantiated.
**/
@:native("Phaser.Math.Matrix3") extern class Matrix3 {
	function new(?m:Matrix3);
	/**
		The matrix values.
	**/
	var val : js.lib.Float32Array;
	/**
		Make a clone of this Matrix3.
	**/
	function clone():Matrix3;
	/**
		This method is an alias for `Matrix3.copy`.
	**/
	function set(src:Matrix3):Matrix3;
	/**
		Copy the values of a given Matrix into this Matrix.
	**/
	function copy(src:Matrix3):Matrix3;
	/**
		Copy the values of a given Matrix4 into this Matrix3.
	**/
	function fromMat4(m:Matrix4):Matrix3;
	/**
		Set the values of this Matrix from the given array.
	**/
	function fromArray(a:Array<Dynamic>):Matrix3;
	/**
		Reset this Matrix to an identity (default) matrix.
	**/
	function identity():Matrix3;
	/**
		Transpose this Matrix.
	**/
	function transpose():Matrix3;
	/**
		Invert this Matrix.
	**/
	function invert():Matrix3;
	/**
		Calculate the adjoint, or adjugate, of this Matrix.
	**/
	function adjoint():Matrix3;
	/**
		Calculate the determinant of this Matrix.
	**/
	function determinant():Float;
	/**
		Multiply this Matrix by the given Matrix.
	**/
	function multiply(src:Matrix3):Matrix3;
	/**
		Translate this Matrix using the given Vector.
	**/
	function translate(v:ts.AnyOf3<Vector2, Vector4, Vector3>):Matrix3;
	/**
		Apply a rotation transformation to this Matrix.
	**/
	function rotate(rad:Float):Matrix3;
	/**
		Apply a scale transformation to this Matrix.
		
		Uses the `x` and `y` components of the given Vector to scale the Matrix.
	**/
	function scale(v:ts.AnyOf3<Vector2, Vector4, Vector3>):Matrix3;
	/**
		Set the values of this Matrix from the given Quaternion.
	**/
	function fromQuat(q:Quaternion):Matrix3;
	/**
		Set the values of this Matrix3 to be normalized from the given Matrix4.
	**/
	function normalFromMat4(m:Matrix4):Matrix3;
	static var prototype : Matrix3;
}