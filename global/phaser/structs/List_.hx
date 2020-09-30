package global.phaser.structs;

/**
	List is a generic implementation of an ordered list which contains utility methods for retrieving, manipulating, and iterating items.
**/
@:native("Phaser.Structs.List") extern class List_<T> {
	function new<T>(parent:Dynamic);
	/**
		The parent of this list.
	**/
	var parent : Dynamic;
	/**
		The objects that belong to this collection.
	**/
	var list : Array<T>;
	/**
		The index of the current element.
		
		This is used internally when iterating through the list with the {@link #first}, {@link #last}, {@link #get}, and {@link #previous} properties.
	**/
	var position : Float;
	/**
		A callback that is invoked every time a child is added to this list.
	**/
	var addCallback : haxe.Constraints.Function;
	/**
		A callback that is invoked every time a child is removed from this list.
	**/
	var removeCallback : haxe.Constraints.Function;
	/**
		The property key to sort by.
	**/
	var _sortKey : String;
	/**
		Adds the given item to the end of the list. Each item must be unique.
	**/
	function add(child:T, ?skipCallback:Bool):T;
	/**
		Adds an item to list, starting at a specified index. Each item must be unique within the list.
	**/
	function addAt(child:T, ?index:Float, ?skipCallback:Bool):T;
	/**
		Retrieves the item at a given position inside the List.
	**/
	function getAt(index:Float):T;
	/**
		Locates an item within the List and returns its index.
	**/
	function getIndex(child:T):Float;
	/**
		Sort the contents of this List so the items are in order based on the given property.
		For example, `sort('alpha')` would sort the List contents based on the value of their `alpha` property.
	**/
	function sort(property:String, ?handler:haxe.Constraints.Function):Array<T>;
	/**
		Searches for the first instance of a child with its `name`
		property matching the given argument. Should more than one child have
		the same name only the first is returned.
	**/
	function getByName(name:String):Null<T>;
	/**
		Returns a random child from the group.
	**/
	function getRandom(?startIndex:Float, ?length:Float):Null<T>;
	/**
		Returns the first element in a given part of the List which matches a specific criterion.
	**/
	function getFirst(property:String, value:Dynamic, ?startIndex:Float, ?endIndex:Float):Null<T>;
	/**
		Returns all children in this List.
		
		You can optionally specify a matching criteria using the `property` and `value` arguments.
		
		For example: `getAll('parent')` would return only children that have a property called `parent`.
		
		You can also specify a value to compare the property to:
		
		`getAll('visible', true)` would return only children that have their visible property set to `true`.
		
		Optionally you can specify a start and end index. For example if this List had 100 children,
		and you set `startIndex` to 0 and `endIndex` to 50, it would return matches from only
		the first 50 children in the List.
	**/
	function getAll(?property:String, ?value:T, ?startIndex:Float, ?endIndex:Float):Array<T>;
	/**
		Returns the total number of items in the List which have a property matching the given value.
	**/
	function count(property:String, value:T):Float;
	/**
		Swaps the positions of two items in the list.
	**/
	function swap(child1:T, child2:T):Void;
	/**
		Moves an item in the List to a new position.
	**/
	function moveTo(child:T, index:Float):T;
	/**
		Removes one or many items from the List.
	**/
	function remove(child:T, ?skipCallback:Bool):T;
	/**
		Removes the item at the given position in the List.
	**/
	function removeAt(index:Float, ?skipCallback:Bool):T;
	/**
		Removes the items within the given range in the List.
	**/
	function removeBetween(?startIndex:Float, ?endIndex:Float, ?skipCallback:Bool):Array<T>;
	/**
		Removes all the items.
	**/
	function removeAll(?skipCallback:Bool):List_<T>;
	/**
		Brings the given child to the top of this List.
	**/
	function bringToTop(child:T):T;
	/**
		Sends the given child to the bottom of this List.
	**/
	function sendToBack(child:T):T;
	/**
		Moves the given child up one place in this group unless it's already at the top.
	**/
	function moveUp(child:T):T;
	/**
		Moves the given child down one place in this group unless it's already at the bottom.
	**/
	function moveDown(child:T):T;
	/**
		Reverses the order of all children in this List.
	**/
	function reverse():List_<T>;
	/**
		Shuffles the items in the list.
	**/
	function shuffle():List_<T>;
	/**
		Replaces a child of this List with the given newChild. The newChild cannot be a member of this List.
	**/
	function replace(oldChild:T, newChild:T):T;
	/**
		Checks if an item exists within the List.
	**/
	function exists(child:T):Bool;
	/**
		Sets the property `key` to the given value on all members of this List.
	**/
	function setAll(property:String, value:T, ?startIndex:Float, ?endIndex:Float):Void;
	/**
		Passes all children to the given callback.
	**/
	function each(callback:global.EachListCallback<T>, ?context:Dynamic, args:haxe.extern.Rest<Dynamic>):Void;
	/**
		Clears the List and recreates its internal array.
	**/
	function shutdown():Void;
	/**
		Destroys this List.
	**/
	function destroy():Void;
	/**
		The number of items inside the List.
	**/
	final length : Float;
	/**
		The first item in the List or `null` for an empty List.
	**/
	final first : T;
	/**
		The last item in the List, or `null` for an empty List.
	**/
	final last : T;
	/**
		The next item in the List, or `null` if the entire List has been traversed.
		
		This property can be read successively after reading {@link #first} or manually setting the {@link #position} to iterate the List.
	**/
	final next : T;
	/**
		The previous item in the List, or `null` if the entire List has been traversed.
		
		This property can be read successively after reading {@link #last} or manually setting the {@link #position} to iterate the List backwards.
	**/
	final previous : T;
	static var prototype : List_<Dynamic>;
}