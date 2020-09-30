package global.phaser.cache;

/**
	The Cache Manager is the global cache owned and maintained by the Game instance.
	
	Various systems, such as the file Loader, rely on this cache in order to store the files
	it has loaded. The manager itself doesn't store any files, but instead owns multiple BaseCache
	instances, one per type of file. You can also add your own custom caches.
**/
@:native("Phaser.Cache.CacheManager") extern class CacheManager {
	function new(game:global.phaser.Game);
	/**
		A reference to the Phaser.Game instance that owns this CacheManager.
	**/
	private var game : global.phaser.Game;
	/**
		A Cache storing all binary files, typically added via the Loader.
	**/
	var binary : BaseCache;
	/**
		A Cache storing all bitmap font data files, typically added via the Loader.
		Only the font data is stored in this cache, the textures are part of the Texture Manager.
	**/
	var bitmapFont : BaseCache;
	/**
		A Cache storing all JSON data files, typically added via the Loader.
	**/
	var json : BaseCache;
	/**
		A Cache storing all physics data files, typically added via the Loader.
	**/
	var physics : BaseCache;
	/**
		A Cache storing all shader source files, typically added via the Loader.
	**/
	var shader : BaseCache;
	/**
		A Cache storing all non-streaming audio files, typically added via the Loader.
	**/
	var audio : BaseCache;
	/**
		A Cache storing all non-streaming video files, typically added via the Loader.
	**/
	var video : BaseCache;
	/**
		A Cache storing all text files, typically added via the Loader.
	**/
	var text : BaseCache;
	/**
		A Cache storing all html files, typically added via the Loader.
	**/
	var html : BaseCache;
	/**
		A Cache storing all WaveFront OBJ files, typically added via the Loader.
	**/
	var obj : BaseCache;
	/**
		A Cache storing all tilemap data files, typically added via the Loader.
		Only the data is stored in this cache, the textures are part of the Texture Manager.
	**/
	var tilemap : BaseCache;
	/**
		A Cache storing all xml data files, typically added via the Loader.
	**/
	var xml : BaseCache;
	/**
		An object that contains your own custom BaseCache entries.
		Add to this via the `addCustom` method.
	**/
	var custom : { };
	/**
		Add your own custom Cache for storing your own files.
		The cache will be available under `Cache.custom.key`.
		The cache will only be created if the key is not already in use.
	**/
	function addCustom(key:String):BaseCache;
	/**
		Removes all entries from all BaseCaches and destroys all custom caches.
	**/
	function destroy():Void;
	static var prototype : CacheManager;
}