package global.matterjs;

/**
	The `Matter.Vector` module contains methods for creating and manipulating vectors.
	Vectors are the basis of all the geometry related operations in the engine.
	A `Matter.Vector` object is of the form `{ x: 0, y: 0 }`.
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.Vector") extern class Vector {
	function new();
	var x : Float;
	var y : Float;
	static var prototype : Vector;
	/**
		Creates a new vector.
	**/
	static function create(?x:Float, ?y:Float):Vector;
	/**
		Returns a new vector with `x` and `y` copied from the given `vector`.
	**/
	static function clone(vector:Vector):Vector;
	/**
		Returns the cross-product of three vectors.
	**/
	static function cross3(vectorA:Vector, vectorB:Vector, vectorC:Vector):Float;
	/**
		Adds the two vectors.
	**/
	static function add(vectorA:Vector, vectorB:Vector, ?output:Vector):Vector;
	/**
		Returns the angle in radians between the two vectors relative to the x-axis.
	**/
	static function angle(vectorA:Vector, vectorB:Vector):Float;
	/**
		Returns the cross-product of two vectors.
	**/
	static function cross(vectorA:Vector, vectorB:Vector):Float;
	/**
		Divides a vector and a scalar.
	**/
	static function div(vector:Vector, scalar:Float):Vector;
	/**
		Returns the dot-product of two vectors.
	**/
	static function dot(vectorA:Vector, vectorB:Vector):js.lib.Number;
	/**
		Returns the magnitude (length) of a vector.
	**/
	static function magnitude(vector:Vector):Float;
	/**
		Returns the magnitude (length) of a vector (therefore saving a `sqrt` operation).
	**/
	static function magnitudeSquared(vector:Vector):Float;
	/**
		Multiplies a vector and a scalar.
	**/
	static function mult(vector:Vector, scalar:Float):Vector;
	/**
		Negates both components of a vector such that it points in the opposite direction.
	**/
	static function neg(vector:Vector):Vector;
	/**
		Normalises a vector (such that its magnitude is `1`).
	**/
	static function normalise(vector:Vector):Vector;
	/**
		Returns the perpendicular vector. Set `negate` to true for the perpendicular in the opposite direction.
	**/
	static function perp(vector:Vector, ?negate:Bool):Vector;
	/**
		Rotates the vector about (0, 0) by specified angle.
	**/
	static function rotate(vector:Vector, angle:Float):Vector;
	/**
		Rotates the vector about a specified point by specified angle.
	**/
	static function rotateAbout(vector:Vector, angle:Float, point:Vector, ?output:Vector):Vector;
	/**
		Subtracts the two vectors.
	**/
	static function sub(vectorA:Vector, vectorB:Vector, ?optional:Vector):Vector;
}