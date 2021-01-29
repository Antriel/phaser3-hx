package global.phaser.math;

/**
	A four-dimensional matrix.
	
	Adapted from [gl-matrix](https://github.com/toji/gl-matrix) by toji
	and [vecmath](https://github.com/mattdesl/vecmath) by mattdesl
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
		Sets all values of this Matrix4.
	**/
	function setValues(m00:Float, m01:Float, m02:Float, m03:Float, m10:Float, m11:Float, m12:Float, m13:Float, m20:Float, m21:Float, m22:Float, m23:Float, m30:Float, m31:Float, m32:Float, m33:Float):Matrix4;
	/**
		Copy the values of a given Matrix into this Matrix.
	**/
	function copy(src:Matrix4):Matrix4;
	/**
		Set the values of this Matrix from the given array.
	**/
	function fromArray(a:Array<Float>):Matrix4;
	/**
		Reset this Matrix.
		
		Sets all values to `0`.
	**/
	function zero():Matrix4;
	/**
		Generates a transform matrix based on the given position, scale and rotation.
	**/
	function transform(position:Vector3, scale:Vector3, rotation:Quaternion):Matrix4;
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
		Copies the given Matrix4 into this Matrix and then inverses it.
	**/
	function getInverse(m:Matrix4):Matrix4;
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
		Multiplies the given Matrix4 object with this Matrix.
		
		This is the same as calling `multiplyMatrices(m, this)`.
	**/
	function premultiply(m:Matrix4):Matrix4;
	/**
		Multiplies the two given Matrix4 objects and stores the results in this Matrix.
	**/
	function multiplyMatrices(a:Matrix4, b:Matrix4):Matrix4;
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
		Generate a right-handed look-at matrix with the given eye position, target and up axis.
	**/
	function lookAtRH(eye:Vector3, target:Vector3, up:Vector3):Matrix4;
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
	/**
		Multiplies this Matrix4 by the given `src` Matrix4 and stores the results in the `out` Matrix4.
	**/
	function multiplyToMat4(src:Matrix4, out:Matrix4):Matrix4;
	/**
		Takes the rotation and position vectors and builds this Matrix4 from them.
	**/
	function fromRotationXYTranslation(rotation:Vector3, position:Vector3, translateFirst:Bool):Matrix4;
	/**
		Returns the maximum axis scale from this Matrix4.
	**/
	function getMaxScaleOnAxis():Float;
	static var prototype : Matrix4;
}