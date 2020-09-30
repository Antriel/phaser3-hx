package global.matterjs;

@:native("MatterJS.AxesFactory") extern class AxesFactory {
	function new();
	/**
		Creates a new set of axes from the given vertices.
	**/
	function fromVertices(vertices:Array<Vector>):Array<Vector>;
	/**
		Rotates a set of axes by the given angle.
	**/
	function rotate(axes:Array<Vector>, angle:Float):Void;
	static var prototype : AxesFactory;
}