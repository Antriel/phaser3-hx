package global.phaser.structs;

/**
	A Set is a collection of unique elements.
**/
@:native("Phaser.Structs.Set") extern class Set<T> {
	function new<T>(?elements:Array<T>);
	/**
		The entries of this Set. Stored internally as an array.
	**/
	var entries : Array<T>;
	/**
		Inserts the provided value into this Set. If the value is already contained in this Set this method will have no effect.
	**/
	function set(value:T):Set<T>;
	/**
		Get an element of this Set which has a property of the specified name, if that property is equal to the specified value.
		If no elements of this Set satisfy the condition then this method will return `null`.
	**/
	function get(property:String, value:T):T;
	/**
		Returns an array containing all the values in this Set.
	**/
	function getArray():Array<T>;
	/**
		Removes the given value from this Set if this Set contains that value.
	**/
	function delete(value:T):Set<T>;
	/**
		Dumps the contents of this Set to the console via `console.group`.
	**/
	function dump():Void;
	/**
		Passes each value in this Set to the given callback.
		Use this function when you know this Set will be modified during the iteration, otherwise use `iterate`.
	**/
	function each(callback:global.EachSetCallback<T>, ?callbackScope:Dynamic):Set<T>;
	/**
		Passes each value in this Set to the given callback.
		For when you absolutely know this Set won't be modified during the iteration.
	**/
	function iterate(callback:global.EachSetCallback<T>, ?callbackScope:Dynamic):Set<T>;
	/**
		Goes through each entry in this Set and invokes the given function on them, passing in the arguments.
	**/
	function iterateLocal(callbackKey:String, args:haxe.extern.Rest<Dynamic>):Set<T>;
	/**
		Clears this Set so that it no longer contains any values.
	**/
	function clear():Set<T>;
	/**
		Returns `true` if this Set contains the given value, otherwise returns `false`.
	**/
	function contains(value:T):Bool;
	/**
		Returns a new Set containing all values that are either in this Set or in the Set provided as an argument.
	**/
	function union(set:Set<T>):Set<T>;
	/**
		Returns a new Set that contains only the values which are in this Set and that are also in the given Set.
	**/
	function intersect(set:Set<T>):Set<T>;
	/**
		Returns a new Set containing all the values in this Set which are *not* also in the given Set.
	**/
	function difference(set:Set<T>):Set<T>;
	/**
		The size of this Set. This is the number of entries within it.
		Changing the size will truncate the Set if the given value is smaller than the current size.
		Increasing the size larger than the current size has no effect.
	**/
	var size : Float;
	static var prototype : Set<Dynamic>;
}