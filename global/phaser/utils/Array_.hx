package global.phaser.utils;

@:native("Phaser.Utils.Array") @valueModuleOnly extern class Array_ {
	/**
		Adds the given item, or array of items, to the array.
		
		Each item must be unique within the array.
		
		The array is modified in-place and returned.
		
		You can optionally specify a limit to the maximum size of the array. If the quantity of items being
		added will take the array length over this limit, it will stop adding once the limit is reached.
		
		You can optionally specify a callback to be invoked for each item successfully added to the array.
	**/
	static function Add(array:Array<Dynamic>, item:Dynamic, ?limit:Float, ?callback:haxe.Constraints.Function, ?context:Dynamic):Array<Dynamic>;
	/**
		Adds the given item, or array of items, to the array starting at the index specified.
		
		Each item must be unique within the array.
		
		Existing elements in the array are shifted up.
		
		The array is modified in-place and returned.
		
		You can optionally specify a limit to the maximum size of the array. If the quantity of items being
		added will take the array length over this limit, it will stop adding once the limit is reached.
		
		You can optionally specify a callback to be invoked for each item successfully added to the array.
	**/
	static function AddAt(array:Array<Dynamic>, item:Dynamic, ?index:Float, ?limit:Float, ?callback:haxe.Constraints.Function, ?context:Dynamic):Array<Dynamic>;
	/**
		Moves the given element to the top of the array.
		The array is modified in-place.
	**/
	static function BringToTop(array:Array<Dynamic>, item:Dynamic):Dynamic;
	/**
		Returns the total number of elements in the array which have a property matching the given value.
	**/
	static function CountAllMatching(array:Array<Dynamic>, property:String, value:Dynamic, ?startIndex:Float, ?endIndex:Float):Float;
	/**
		Passes each element in the array to the given callback.
	**/
	static function Each(array:Array<Dynamic>, callback:haxe.Constraints.Function, context:Dynamic, args:haxe.extern.Rest<Dynamic>):Array<Dynamic>;
	/**
		Passes each element in the array, between the start and end indexes, to the given callback.
	**/
	static function EachInRange(array:Array<Dynamic>, callback:haxe.Constraints.Function, context:Dynamic, startIndex:Float, endIndex:Float, args:haxe.extern.Rest<Dynamic>):Array<Dynamic>;
	/**
		Searches a pre-sorted array for the closet value to the given number.
		
		If the `key` argument is given it will assume the array contains objects that all have the required `key` property name,
		and will check for the closest value of those to the given number.
	**/
	static function FindClosestInSorted(value:Float, array:Array<Dynamic>, ?key:String):Dynamic;
	/**
		Returns all elements in the array.
		
		You can optionally specify a matching criteria using the `property` and `value` arguments.
		
		For example: `getAll('visible', true)` would return only elements that have their visible property set.
		
		Optionally you can specify a start and end index. For example if the array had 100 elements,
		and you set `startIndex` to 0 and `endIndex` to 50, it would return matches from only
		the first 50 elements.
	**/
	static function GetAll(array:Array<Dynamic>, ?property:String, ?value:Dynamic, ?startIndex:Float, ?endIndex:Float):Array<Dynamic>;
	/**
		Returns the first element in the array.
		
		You can optionally specify a matching criteria using the `property` and `value` arguments.
		
		For example: `getAll('visible', true)` would return the first element that had its `visible` property set.
		
		Optionally you can specify a start and end index. For example if the array had 100 elements,
		and you set `startIndex` to 0 and `endIndex` to 50, it would search only the first 50 elements.
	**/
	static function GetFirst(array:Array<Dynamic>, ?property:String, ?value:Dynamic, ?startIndex:Float, ?endIndex:Float):Dynamic;
	/**
		Returns a Random element from the array.
	**/
	static function GetRandom(array:Array<Dynamic>, ?startIndex:Float, ?length:Float):Dynamic;
	/**
		Moves the given array element down one place in the array.
		The array is modified in-place.
	**/
	static function MoveDown(array:Array<Dynamic>, item:Dynamic):Array<Dynamic>;
	/**
		Moves an element in an array to a new position within the same array.
		The array is modified in-place.
	**/
	static function MoveTo(array:Array<Dynamic>, item:Dynamic, index:Float):Dynamic;
	/**
		Moves the given array element up one place in the array.
		The array is modified in-place.
	**/
	static function MoveUp(array:Array<Dynamic>, item:Dynamic):Array<Dynamic>;
	/**
		Create an array representing the range of numbers (usually integers), between, and inclusive of,
		the given `start` and `end` arguments. For example:
		
		`var array = numberArray(2, 4); // array = [2, 3, 4]`
		`var array = numberArray(0, 9); // array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]`
		
		This is equivalent to `numberArrayStep(start, end, 1)`.
		
		You can optionally provide a prefix and / or suffix string. If given the array will contain
		strings, not integers. For example:
		
		`var array = numberArray(1, 4, 'Level '); // array = ["Level 1", "Level 2", "Level 3", "Level 4"]`
		`var array = numberArray(5, 7, 'HD-', '.png'); // array = ["HD-5.png", "HD-6.png", "HD-7.png"]`
	**/
	static function NumberArray(start:Float, end:Float, ?prefix:String, ?suffix:String):ts.AnyOf2<Array<String>, Array<Float>>;
	/**
		Create an array of numbers (positive and/or negative) progressing from `start`
		up to but not including `end` by advancing by `step`.
		
		If `start` is less than `end` a zero-length range is created unless a negative `step` is specified.
		
		Certain values for `start` and `end` (eg. NaN/undefined/null) are currently coerced to 0;
		for forward compatibility make sure to pass in actual numbers.
	**/
	static function NumberArrayStep(?start:Float, ?end:Float, ?step:Float):Array<Float>;
	/**
		A [Floyd-Rivest](https://en.wikipedia.org/wiki/Floyd%E2%80%93Rivest_algorithm) quick selection algorithm.
		
		Rearranges the array items so that all items in the [left, k] range are smaller than all items in [k, right];
		The k-th element will have the (k - left + 1)th smallest value in [left, right].
		
		The array is modified in-place.
		
		Based on code by [Vladimir Agafonkin](https://www.npmjs.com/~mourner)
	**/
	static function QuickSelect(arr:Array<Dynamic>, k:Float, ?left:Float, ?right:Float, ?compare:haxe.Constraints.Function):Void;
	/**
		Creates an array populated with a range of values, based on the given arguments and configuration object.
		
		Range ([a,b,c], [1,2,3]) =
		a1, a2, a3, b1, b2, b3, c1, c2, c3
		
		Range ([a,b], [1,2,3], qty = 3) =
		a1, a1, a1, a2, a2, a2, a3, a3, a3, b1, b1, b1, b2, b2, b2, b3, b3, b3
		
		Range ([a,b,c], [1,2,3], repeat x1) =
		a1, a2, a3, b1, b2, b3, c1, c2, c3, a1, a2, a3, b1, b2, b3, c1, c2, c3
		
		Range ([a,b], [1,2], repeat -1 = endless, max = 14) =
		Maybe if max is set then repeat goes to -1 automatically?
		a1, a2, b1, b2, a1, a2, b1, b2, a1, a2, b1, b2, a1, a2 (capped at 14 elements)
		
		Range ([a], [1,2,3,4,5], random = true) =
		a4, a1, a5, a2, a3
		
		Range ([a, b], [1,2,3], random = true) =
		b3, a2, a1, b1, a3, b2
		
		Range ([a, b, c], [1,2,3], randomB = true) =
		a3, a1, a2, b2, b3, b1, c1, c3, c2
		
		Range ([a], [1,2,3,4,5], yoyo = true) =
		a1, a2, a3, a4, a5, a5, a4, a3, a2, a1
		
		Range ([a, b], [1,2,3], yoyo = true) =
		a1, a2, a3, b1, b2, b3, b3, b2, b1, a3, a2, a1
	**/
	static function Range(a:Array<Dynamic>, b:Array<Dynamic>, ?options:Dynamic):Array<Dynamic>;
	/**
		Removes the given item, or array of items, from the array.
		
		The array is modified in-place.
		
		You can optionally specify a callback to be invoked for each item successfully removed from the array.
	**/
	static function Remove(array:Array<Dynamic>, item:Dynamic, ?callback:haxe.Constraints.Function, ?context:Dynamic):Dynamic;
	/**
		Removes the item from the given position in the array.
		
		The array is modified in-place.
		
		You can optionally specify a callback to be invoked for the item if it is successfully removed from the array.
	**/
	static function RemoveAt(array:Array<Dynamic>, index:Float, ?callback:haxe.Constraints.Function, ?context:Dynamic):Dynamic;
	/**
		Removes the item within the given range in the array.
		
		The array is modified in-place.
		
		You can optionally specify a callback to be invoked for the item/s successfully removed from the array.
	**/
	static function RemoveBetween(array:Array<Dynamic>, startIndex:Float, endIndex:Float, ?callback:haxe.Constraints.Function, ?context:Dynamic):Array<Dynamic>;
	/**
		Removes a random object from the given array and returns it.
		Will return null if there are no array items that fall within the specified range or if there is no item for the randomly chosen index.
	**/
	static function RemoveRandomElement(array:Array<Dynamic>, ?start:Float, ?length:Float):Dynamic;
	/**
		Replaces an element of the array with the new element.
		The new element cannot already be a member of the array.
		The array is modified in-place.
	**/
	static function Replace(array:Array<Dynamic>, oldChild:Dynamic, newChild:Dynamic):Bool;
	/**
		Moves the element at the start of the array to the end, shifting all items in the process.
		The "rotation" happens to the left.
	**/
	static function RotateLeft(array:Array<Dynamic>, ?total:Float):Dynamic;
	/**
		Moves the element at the end of the array to the start, shifting all items in the process.
		The "rotation" happens to the right.
	**/
	static function RotateRight(array:Array<Dynamic>, ?total:Float):Dynamic;
	/**
		Tests if the start and end indexes are a safe range for the given array.
	**/
	static function SafeRange(array:Array<Dynamic>, startIndex:Float, endIndex:Float, ?throwError:Bool):Bool;
	/**
		Moves the given element to the bottom of the array.
		The array is modified in-place.
	**/
	static function SendToBack(array:Array<Dynamic>, item:Dynamic):Dynamic;
	/**
		Scans the array for elements with the given property. If found, the property is set to the `value`.
		
		For example: `SetAll('visible', true)` would set all elements that have a `visible` property to `false`.
		
		Optionally you can specify a start and end index. For example if the array had 100 elements,
		and you set `startIndex` to 0 and `endIndex` to 50, it would update only the first 50 elements.
	**/
	static function SetAll(array:Array<Dynamic>, property:String, value:Dynamic, ?startIndex:Float, ?endIndex:Float):Array<Dynamic>;
	/**
		Shuffles the contents of the given array using the Fisher-Yates implementation.
		
		The original array is modified directly and returned.
	**/
	static function Shuffle<T>(array:Array<T>):Array<T>;
	/**
		Removes a single item from an array and returns it without creating gc, like the native splice does.
		Based on code by Mike Reinstein.
	**/
	static function SpliceOne(array:Array<Dynamic>, index:Float):Dynamic;
	/**
		A stable array sort, because `Array#sort()` is not guaranteed stable.
		This is an implementation of merge sort, without recursion.
	**/
	static function StableSort(arr:Array<Dynamic>, comp:haxe.Constraints.Function):Array<Dynamic>;
	/**
		Swaps the position of two elements in the given array.
		The elements must exist in the same array.
		The array is modified in-place.
	**/
	static function Swap(array:Array<Dynamic>, item1:Dynamic, item2:Dynamic):Array<Dynamic>;
}