package global.phaser.math;

/**
	A quaternion.
**/
@:native("Phaser.Math.Quaternion") extern class Quaternion {
	function new(?x:Float, ?y:Float, ?z:Float, ?w:Float);
	/**
		The x component of this Quaternion.
	**/
	var x : Float;
	/**
		The y component of this Quaternion.
	**/
	var y : Float;
	/**
		The z component of this Quaternion.
	**/
	var z : Float;
	/**
		The w component of this Quaternion.
	**/
	var w : Float;
	/**
		Copy the components of a given Quaternion or Vector into this Quaternion.
	**/
	function copy(src:ts.AnyOf2<Vector4, Quaternion>):Quaternion;
	/**
		Set the components of this Quaternion.
	**/
	function set(?x:ts.AnyOf2<Float, Dynamic>, ?y:Float, ?z:Float, ?w:Float):Quaternion;
	/**
		Add a given Quaternion or Vector to this Quaternion. Addition is component-wise.
	**/
	function add(v:ts.AnyOf2<Vector4, Quaternion>):Quaternion;
	/**
		Subtract a given Quaternion or Vector from this Quaternion. Subtraction is component-wise.
	**/
	function subtract(v:ts.AnyOf2<Vector4, Quaternion>):Quaternion;
	/**
		Scale this Quaternion by the given value.
	**/
	function scale(scale:Float):Quaternion;
	/**
		Calculate the length of this Quaternion.
	**/
	function length():Float;
	/**
		Calculate the length of this Quaternion squared.
	**/
	function lengthSq():Float;
	/**
		Normalize this Quaternion.
	**/
	function normalize():Quaternion;
	/**
		Calculate the dot product of this Quaternion and the given Quaternion or Vector.
	**/
	function dot(v:ts.AnyOf2<Vector4, Quaternion>):Float;
	/**
		Linearly interpolate this Quaternion towards the given Quaternion or Vector.
	**/
	function lerp(v:ts.AnyOf2<Vector4, Quaternion>, ?t:Float):Quaternion;
	/**
		Rotates this Quaternion based on the two given vectors.
	**/
	function rotationTo(a:Vector3, b:Vector3):Quaternion;
	/**
		Set the axes of this Quaternion.
	**/
	function setAxes(view:Vector3, right:Vector3, up:Vector3):Quaternion;
	/**
		Reset this Matrix to an identity (default) Quaternion.
	**/
	function identity():Quaternion;
	/**
		Set the axis angle of this Quaternion.
	**/
	function setAxisAngle(axis:Vector3, rad:Float):Quaternion;
	/**
		Multiply this Quaternion by the given Quaternion or Vector.
	**/
	function multiply(b:ts.AnyOf2<Vector4, Quaternion>):Quaternion;
	/**
		Smoothly linearly interpolate this Quaternion towards the given Quaternion or Vector.
	**/
	function slerp(b:ts.AnyOf2<Vector4, Quaternion>, t:Float):Quaternion;
	/**
		Invert this Quaternion.
	**/
	function invert():Quaternion;
	/**
		Convert this Quaternion into its conjugate.
		
		Sets the x, y and z components.
	**/
	function conjugate():Quaternion;
	/**
		Rotate this Quaternion on the X axis.
	**/
	function rotateX(rad:Float):Quaternion;
	/**
		Rotate this Quaternion on the Y axis.
	**/
	function rotateY(rad:Float):Quaternion;
	/**
		Rotate this Quaternion on the Z axis.
	**/
	function rotateZ(rad:Float):Quaternion;
	/**
		Create a unit (or rotation) Quaternion from its x, y, and z components.
		
		Sets the w component.
	**/
	function calculateW():Quaternion;
	/**
		Convert the given Matrix into this Quaternion.
	**/
	function fromMat3(mat:Matrix3):Quaternion;
	static var prototype : Quaternion;
}