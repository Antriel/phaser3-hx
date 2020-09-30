package global.matterjs;

@:native("MatterJS.PairsFactory") extern class PairsFactory {
	function new();
	/**
		Clears the given pairs structure.
	**/
	function clear(pairs:Dynamic):Dynamic;
	static var prototype : PairsFactory;
}