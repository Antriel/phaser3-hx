package global.phaser.cache;

/**
	The BaseCache is a base Cache class that can be used for storing references to any kind of data.
	
	Data can be added, retrieved and removed based on the given keys.
	
	Keys are string-based.
**/
@:native("Phaser.Cache.BaseCache") extern class BaseCache {
	function new();
	/**
		The Map in which the cache objects are stored.
		
		You can query the Map directly or use the BaseCache methods.
	**/
	var entries : global.phaser.structs.Map_<String, Dynamic>;
	/**
		An instance of EventEmitter used by the cache to emit related events.
	**/
	var events : global.phaser.events.EventEmitter;
	/**
		Adds an item to this cache. The item is referenced by a unique string, which you are responsible
		for setting and keeping track of. The item can only be retrieved by using this string.
	**/
	function add(key:String, data:Dynamic):BaseCache;
	/**
		Checks if this cache contains an item matching the given key.
		This performs the same action as `BaseCache.exists`.
	**/
	function has(key:String):Bool;
	/**
		Checks if this cache contains an item matching the given key.
		This performs the same action as `BaseCache.has` and is called directly by the Loader.
	**/
	function exists(key:String):Bool;
	/**
		Gets an item from this cache based on the given key.
	**/
	function get(key:String):Dynamic;
	/**
		Removes and item from this cache based on the given key.
		
		If an entry matching the key is found it is removed from the cache and a `remove` event emitted.
		No additional checks are done on the item removed. If other systems or parts of your game code
		are relying on this item, it is up to you to sever those relationships prior to removing the item.
	**/
	function remove(key:String):BaseCache;
	/**
		Returns all keys in use in this cache.
	**/
	function getKeys():Array<String>;
	/**
		Destroys this cache and all items within it.
	**/
	function destroy():Void;
	static var prototype : BaseCache;
}