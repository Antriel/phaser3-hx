package global.matterjs;

/**
	The `Matter.Axes` module contains methods for creating and manipulating sets of axes.
**/
@:native("MatterJS.Axes") extern class Axes {
	function new();
	static var prototype : Axes;
	/**
		Creates a new set of axes from the given vertices.
	**/
	static function fromVertices(vertices:Array<Vector>):Array<Vector>;
	/**
		Rotates a set of axes by the given angle.
	**/
	static function rotate(axes:Array<Vector>, angle:Float):Void;
}