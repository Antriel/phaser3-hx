package global.phaser.math;

/**
	A representation of a vector in 3D space.
	
	A three-component vector.
**/
@:native("Phaser.Math.Vector3") extern class Vector3 {
	function new(?x:Float, ?y:Float, ?z:Float);
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
		Set this Vector to point up.
		
		Sets the y component of the vector to 1, and the others to 0.
	**/
	function up():Vector3;
	/**
		Sets the components of this Vector to be the `Math.min` result from the given vector.
	**/
	function min(v:Vector3):Vector3;
	/**
		Sets the components of this Vector to be the `Math.max` result from the given vector.
	**/
	function max(v:Vector3):Vector3;
	/**
		Make a clone of this Vector3.
	**/
	function clone():Vector3;
	/**
		Adds the two given Vector3s and sets the results into this Vector3.
	**/
	function addVectors(a:Vector3, b:Vector3):Vector3;
	/**
		Calculate the cross (vector) product of two given Vectors.
	**/
	function crossVectors(a:Vector3, b:Vector3):Vector3;
	/**
		Check whether this Vector is equal to a given Vector.
		
		Performs a strict equality check against each Vector's components.
	**/
	function equals(v:Vector3):Bool;
	/**
		Copy the components of a given Vector into this Vector.
	**/
	function copy(src:ts.AnyOf2<Vector2, Vector3>):Vector3;
	/**
		Set the `x`, `y`, and `z` components of this Vector to the given `x`, `y`, and `z` values.
	**/
	function set(x:ts.AnyOf2<Float, Dynamic>, ?y:Float, ?z:Float):Vector3;
	/**
		Sets the components of this Vector3 from the position of the given Matrix4.
	**/
	function setFromMatrixPosition(mat4:Matrix4):Vector3;
	/**
		Sets the components of this Vector3 from the Matrix4 column specified.
	**/
	function setFromMatrixColumn(mat4:Matrix4, index:Float):Vector3;
	/**
		Sets the components of this Vector3 from the given array, based on the offset.
		
		Vector3.x = array[offset]
		Vector3.y = array[offset + 1]
		Vector3.z = array[offset + 2]
	**/
	function fromArray(array:Array<Float>, ?offset:Float):Vector3;
	/**
		Add a given Vector to this Vector. Addition is component-wise.
	**/
	function add(v:ts.AnyOf2<Vector2, Vector3>):Vector3;
	/**
		Add the given value to each component of this Vector.
	**/
	function addScalar(s:Float):Vector3;
	/**
		Add and scale a given Vector to this Vector. Addition is component-wise.
	**/
	function addScale(v:ts.AnyOf2<Vector2, Vector3>, scale:Float):Vector3;
	/**
		Subtract the given Vector from this Vector. Subtraction is component-wise.
	**/
	function subtract(v:ts.AnyOf2<Vector2, Vector3>):Vector3;
	/**
		Perform a component-wise multiplication between this Vector and the given Vector.
		
		Multiplies this Vector by the given Vector.
	**/
	function multiply(v:ts.AnyOf2<Vector2, Vector3>):Vector3;
	/**
		Scale this Vector by the given value.
	**/
	function scale(scale:Float):Vector3;
	/**
		Perform a component-wise division between this Vector and the given Vector.
		
		Divides this Vector by the given Vector.
	**/
	function divide(v:ts.AnyOf2<Vector2, Vector3>):Vector3;
	/**
		Negate the `x`, `y` and `z` components of this Vector.
	**/
	function negate():Vector3;
	/**
		Calculate the distance between this Vector and the given Vector.
	**/
	function distance(v:ts.AnyOf2<Vector2, Vector3>):Float;
	/**
		Calculate the distance between this Vector and the given Vector, squared.
	**/
	function distanceSq(v:ts.AnyOf2<Vector2, Vector3>):Float;
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
	function normalize():Vector3;
	/**
		Calculate the dot product of this Vector and the given Vector.
	**/
	function dot(v:Vector3):Float;
	/**
		Calculate the cross (vector) product of this Vector (which will be modified) and the given Vector.
	**/
	function cross(v:Vector3):Vector3;
	/**
		Linearly interpolate between this Vector and the given Vector.
		
		Interpolates this Vector towards the given Vector.
	**/
	function lerp(v:Vector3, ?t:Float):Vector3;
	/**
		Takes a Matrix3 and applies it to this Vector3.
	**/
	function applyMatrix3(mat3:Matrix3):Vector3;
	/**
		Takes a Matrix4 and applies it to this Vector3.
	**/
	function applyMatrix4(mat4:Matrix4):Vector3;
	/**
		Transform this Vector with the given Matrix.
	**/
	function transformMat3(mat:Matrix3):Vector3;
	/**
		Transform this Vector with the given Matrix4.
	**/
	function transformMat4(mat:Matrix4):Vector3;
	/**
		Transforms the coordinates of this Vector3 with the given Matrix4.
	**/
	function transformCoordinates(mat:Matrix4):Vector3;
	/**
		Transform this Vector with the given Quaternion.
	**/
	function transformQuat(q:Quaternion):Vector3;
	/**
		Multiplies this Vector3 by the specified matrix, applying a W divide. This is useful for projection,
		e.g. unprojecting a 2D point into 3D space.
	**/
	function project(mat:Matrix4):Vector3;
	/**
		Multiplies this Vector3 by the given view and projection matrices.
	**/
	function projectViewMatrix(viewMatrix:Matrix4, projectionMatrix:Matrix4):Vector3;
	/**
		Multiplies this Vector3 by the given inversed projection matrix and world matrix.
	**/
	function unprojectViewMatrix(projectionMatrix:Matrix4, worldMatrix:Matrix4):Vector3;
	/**
		Unproject this point from 2D space to 3D space.
		The point should have its x and y properties set to
		2D screen space, and the z either at 0 (near plane)
		or 1 (far plane). The provided matrix is assumed to already
		be combined, i.e. projection * view * model.
		
		After this operation, this vector's (x, y, z) components will
		represent the unprojected 3D coordinate.
	**/
	function unproject(viewport:Vector4, invProjectionView:Matrix4):Vector3;
	/**
		Make this Vector the zero vector (0, 0, 0).
	**/
	function reset():Vector3;
	static var prototype : Vector3;
	/**
		A static zero Vector3 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final ZERO : Vector3;
	/**
		A static right Vector3 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final RIGHT : Vector3;
	/**
		A static left Vector3 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final LEFT : Vector3;
	/**
		A static up Vector3 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final UP : Vector3;
	/**
		A static down Vector3 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final DOWN : Vector3;
	/**
		A static forward Vector3 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final FORWARD : Vector3;
	/**
		A static back Vector3 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final BACK : Vector3;
	/**
		A static one Vector3 for use by reference.
		
		This constant is meant for comparison operations and should not be modified directly.
	**/
	static final ONE : Vector3;
}