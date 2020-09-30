package global.phaser.math;

/**
	A four-dimensional matrix.
**/
@:native("Phaser.Math.Matrix4") extern class Matrix4 {
	function new(?m:Matrix4);
	/**
		The matrix values.
	**/
	var val : js.lib.Float32Array;
	/**
		Make a clone of this Matrix4.
	**/
	function clone():Matrix4;
	/**
		This method is an alias for `Matrix4.copy`.
	**/
	function set(src:Matrix4):Matrix4;
	/**
		Copy the values of a given Matrix into this Matrix.
	**/
	function copy(src:Matrix4):Matrix4;
	/**
		Set the values of this Matrix from the given array.
	**/
	function fromArray(a:Array<Dynamic>):Matrix4;
	/**
		Reset this Matrix.
		
		Sets all values to `0`.
	**/
	function zero():Matrix4;
	/**
		Set the `x`, `y` and `z` values of this Matrix.
	**/
	function xyz(x:Float, y:Float, z:Float):Matrix4;
	/**
		Set the scaling values of this Matrix.
	**/
	function scaling(x:Float, y:Float, z:Float):Matrix4;
	/**
		Reset this Matrix to an identity (default) matrix.
	**/
	function identity():Matrix4;
	/**
		Transpose this Matrix.
	**/
	function transpose():Matrix4;
	/**
		Invert this Matrix.
	**/
	function invert():Matrix4;
	/**
		Calculate the adjoint, or adjugate, of this Matrix.
	**/
	function adjoint():Matrix4;
	/**
		Calculate the determinant of this Matrix.
	**/
	function determinant():Float;
	/**
		Multiply this Matrix by the given Matrix.
	**/
	function multiply(src:Matrix4):Matrix4;
	/**
		Multiply the values of this Matrix4 by those given in the `src` argument.
	**/
	function multiplyLocal(src:Matrix4):Matrix4;
	/**
		Translate this Matrix using the given Vector.
	**/
	function translate(v:ts.AnyOf2<Vector4, Vector3>):Matrix4;
	/**
		Translate this Matrix using the given values.
	**/
	function translateXYZ(x:Float, y:Float, z:Float):Matrix4;
	/**
		Apply a scale transformation to this Matrix.
		
		Uses the `x`, `y` and `z` components of the given Vector to scale the Matrix.
	**/
	function scale(v:ts.AnyOf2<Vector4, Vector3>):Matrix4;
	/**
		Apply a scale transformation to this Matrix.
	**/
	function scaleXYZ(x:Float, y:Float, z:Float):Matrix4;
	/**
		Derive a rotation matrix around the given axis.
	**/
	function makeRotationAxis(axis:ts.AnyOf2<Vector4, Vector3>, angle:Float):Matrix4;
	/**
		Apply a rotation transformation to this Matrix.
	**/
	function rotate(rad:Float, axis:Vector3):Matrix4;
	/**
		Rotate this matrix on its X axis.
	**/
	function rotateX(rad:Float):Matrix4;
	/**
		Rotate this matrix on its Y axis.
	**/
	function rotateY(rad:Float):Matrix4;
	/**
		Rotate this matrix on its Z axis.
	**/
	function rotateZ(rad:Float):Matrix4;
	/**
		Set the values of this Matrix from the given rotation Quaternion and translation Vector.
	**/
	function fromRotationTranslation(q:Quaternion, v:Vector3):Matrix4;
	/**
		Set the values of this Matrix from the given Quaternion.
	**/
	function fromQuat(q:Quaternion):Matrix4;
	/**
		Generate a frustum matrix with the given bounds.
	**/
	function frustum(left:Float, right:Float, bottom:Float, top:Float, near:Float, far:Float):Matrix4;
	/**
		Generate a perspective projection matrix with the given bounds.
	**/
	function perspective(fovy:Float, aspect:Float, near:Float, far:Float):Matrix4;
	/**
		Generate a perspective projection matrix with the given bounds.
	**/
	function perspectiveLH(width:Float, height:Float, near:Float, far:Float):Matrix4;
	/**
		Generate an orthogonal projection matrix with the given bounds.
	**/
	function ortho(left:Float, right:Float, bottom:Float, top:Float, near:Float, far:Float):Matrix4;
	/**
		Generate a look-at matrix with the given eye position, focal point, and up axis.
	**/
	function lookAt(eye:Vector3, center:Vector3, up:Vector3):Matrix4;
	/**
		Set the values of this matrix from the given `yaw`, `pitch` and `roll` values.
	**/
	function yawPitchRoll(yaw:Float, pitch:Float, roll:Float):Matrix4;
	/**
		Generate a world matrix from the given rotation, position, scale, view matrix and projection matrix.
	**/
	function setWorldMatrix(rotation:Vector3, position:Vector3, scale:Vector3, ?viewMatrix:Matrix4, ?projectionMatrix:Matrix4):Matrix4;
	static var prototype : Matrix4;
}