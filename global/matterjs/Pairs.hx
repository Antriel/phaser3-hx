package global.matterjs;

/**
	The `Matter.Pairs` module contains methods for creating and manipulating collision pair sets.
**/
@:native("MatterJS.Pairs") extern class Pairs {
	function new();
	static var prototype : Pairs;
	/**
		Clears the given pairs structure.
	**/
	static function clear(pairs:Dynamic):Dynamic;
}