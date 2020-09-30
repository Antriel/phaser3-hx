package global.phaser.utils.array;

@:native("Phaser.Utils.Array.StableSortFunctions") @valueModuleOnly extern class StableSortFunctions {
	/**
		Sort the input array and simply copy it back if the result isn't in the original array, which happens on an odd number of passes.
	**/
	static function inplace(arr:Array<Dynamic>, comp:haxe.Constraints.Function):Array<Dynamic>;
}