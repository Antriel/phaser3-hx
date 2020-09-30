package global.matterjs;

@:native("MatterJS.VectorFactory") extern class VectorFactory {
	function new();
	/**
		Creates a new vector.
	**/
	function create(?x:Float, ?y:Float):Vector;
	/**
		Returns a new vector with `x` and `y` copied from the given `vector`.
	**/
	function clone(vector:Vector):Vector;
	/**
		Returns the cross-product of three vectors.
	**/
	function cross3(vectorA:Vector, vectorB:Vector, vectorC:Vector):Float;
	/**
		Adds the two vectors.
	**/
	function add(vectorA:Vector, vectorB:Vector, ?output:Vector):Vector;
	/**
		Returns the angle in radians between the two vectors relative to the x-axis.
	**/
	function angle(vectorA:Vector, vectorB:Vector):Float;
	/**
		Returns the cross-product of two vectors.
	**/
	function cross(vectorA:Vector, vectorB:Vector):Float;
	/**
		Divides a vector and a scalar.
	**/
	function div(vector:Vector, scalar:Float):Vector;
	/**
		Returns the dot-product of two vectors.
	**/
	function dot(vectorA:Vector, vectorB:Vector):Float;
	/**
		Returns the magnitude (length) of a vector.
	**/
	function magnitude(vector:Vector):Float;
	/**
		Returns the magnitude (length) of a vector (therefore saving a `sqrt` operation).
	**/
	function magnitudeSquared(vector:Vector):Float;
	/**
		Multiplies a vector and a scalar.
	**/
	function mult(vector:Vector, scalar:Float):Vector;
	/**
		Negates both components of a vector such that it points in the opposite direction.
	**/
	function neg(vector:Vector):Vector;
	/**
		Normalises a vector (such that its magnitude is `1`).
	**/
	function normalise(vector:Vector):Vector;
	/**
		Returns the perpendicular vector. Set `negate` to true for the perpendicular in the opposite direction.
	**/
	function perp(vector:Vector, ?negate:Bool):Vector;
	/**
		Rotates the vector about (0, 0) by specified angle.
	**/
	function rotate(vector:Vector, angle:Float):Vector;
	/**
		Rotates the vector about a specified point by specified angle.
	**/
	function rotateAbout(vector:Vector, angle:Float, point:Vector, ?output:Vector):Vector;
	/**
		Subtracts the two vectors.
	**/
	function sub(vectorA:Vector, vectorB:Vector, ?optional:Vector):Vector;
	static var prototype : VectorFactory;
}