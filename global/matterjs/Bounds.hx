package global.matterjs;

/**
	The `Matter.Bounds` module contains methods for creating and manipulating axis-aligned bounding boxes (AABB).
**/
@:native("MatterJS.Bounds") extern class Bounds {
	function new();
	static var prototype : Bounds;
	/**
		Creates a new axis-aligned bounding box (AABB) for the given vertices.
	**/
	static function create(vertices:Vertices):IBound;
	/**
		Updates bounds using the given vertices and extends the bounds given a velocity.
	**/
	static function update(bounds:IBound, vertices:Vertices, velocity:Vector):Void;
	/**
		Returns true if the bounds contains the given point.
	**/
	static function contains(bounds:IBound, point:Vector):Bool;
	/**
		Returns true if the two bounds intersect.
	**/
	static function overlaps(boundsA:IBound, boundsB:IBound):Bool;
	/**
		Translates the bounds by the given vector.
	**/
	static function translate(bounds:IBound, vector:Vector):Void;
	/**
		Shifts the bounds to the given position.
	**/
	static function shift(bounds:IBound, position:Vector):Void;
}