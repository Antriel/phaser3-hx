package global.matterjs;

@:native("MatterJS.BoundsFactory") extern class BoundsFactory {
	function new();
	/**
		Creates a new axis-aligned bounding box (AABB) for the given vertices.
	**/
	function create(vertices:Vertices):IBound;
	/**
		Updates bounds using the given vertices and extends the bounds given a velocity.
	**/
	function update(bounds:IBound, vertices:Vertices, velocity:Vector):Void;
	/**
		Returns true if the bounds contains the given point.
	**/
	function contains(bounds:IBound, point:Vector):Bool;
	/**
		Returns true if the two bounds intersect.
	**/
	function overlaps(boundsA:IBound, boundsB:IBound):Bool;
	/**
		Translates the bounds by the given vector.
	**/
	function translate(bounds:IBound, vector:Vector):Void;
	/**
		Shifts the bounds to the given position.
	**/
	function shift(bounds:IBound, position:Vector):Void;
	static var prototype : BoundsFactory;
}