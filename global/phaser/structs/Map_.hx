package global.phaser.structs;

/**
	The keys of a Map can be arbitrary values.
	
	```javascript
	var map = new Map([
	    [ 1, 'one' ],
	    [ 2, 'two' ],
	    [ 3, 'three' ]
	]);
	```
**/
@:native("Phaser.Structs.Map") extern class Map_<K, V> {
	function new<K, V>(elements:Array<V>);
	/**
		The entries in this Map.
	**/
	var entries : { };
	/**
		The number of key / value pairs in this Map.
	**/
	var size : Float;
	/**
		Adds an element with a specified `key` and `value` to this Map.
		If the `key` already exists, the value will be replaced.
	**/
	function set(key:K, value:V):Map_<K, V>;
	/**
		Returns the value associated to the `key`, or `undefined` if there is none.
	**/
	function get(key:K):V;
	/**
		Returns an `Array` of all the values stored in this Map.
	**/
	function getArray():Array<V>;
	/**
		Returns a boolean indicating whether an element with the specified key exists or not.
	**/
	function has(key:K):Bool;
	/**
		Delete the specified element from this Map.
	**/
	function delete(key:K):Map_<K, V>;
	/**
		Delete all entries from this Map.
	**/
	function clear():Map_<K, V>;
	/**
		Returns all entries keys in this Map.
	**/
	function keys():Array<K>;
	/**
		Returns an `Array` of all entries.
	**/
	function values():Array<V>;
	/**
		Dumps the contents of this Map to the console via `console.group`.
	**/
	function dump():Void;
	/**
		Passes all entries in this Map to the given callback.
	**/
	function each(callback:global.EachMapCallback<V>):Map_<K, V>;
	/**
		Returns `true` if the value exists within this Map. Otherwise, returns `false`.
	**/
	function contains(value:V):Bool;
	/**
		Merges all new keys from the given Map into this one.
		If it encounters a key that already exists it will be skipped unless override is set to `true`.
	**/
	function merge(map:Map_<K, V>, ?override_:Bool):Map_<K, V>;
	static var prototype : Map_<Dynamic, Dynamic>;
}