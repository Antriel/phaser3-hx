package global.phaser.plugins;

@:native("Phaser.Plugins.PluginCache") @valueModuleOnly extern class PluginCache {
	/**
		Static method called directly by the Core internal Plugins.
		Key is a reference used to get the plugin from the plugins object (i.e. InputPlugin)
		Plugin is the object to instantiate to create the plugin
		Mapping is what the plugin is injected into the Scene.Systems as (i.e. input)
	**/
	static function register(key:String, plugin:haxe.Constraints.Function, mapping:String, ?custom:Bool):Void;
	/**
		Stores a custom plugin in the global plugin cache.
		The key must be unique, within the scope of the cache.
	**/
	static function registerCustom(key:String, plugin:haxe.Constraints.Function, mapping:String, data:Dynamic):Void;
	/**
		Checks if the given key is already being used in the core plugin cache.
	**/
	static function hasCore(key:String):Bool;
	/**
		Checks if the given key is already being used in the custom plugin cache.
	**/
	static function hasCustom(key:String):Bool;
	/**
		Returns the core plugin object from the cache based on the given key.
	**/
	static function getCore(key:String):global.phaser.types.plugins.CorePluginContainer;
	/**
		Returns the custom plugin object from the cache based on the given key.
	**/
	static function getCustom(key:String):global.phaser.types.plugins.CustomPluginContainer;
	/**
		Returns an object from the custom cache based on the given key that can be instantiated.
	**/
	static function getCustomClass(key:String):haxe.Constraints.Function;
	/**
		Removes a core plugin based on the given key.
	**/
	static function remove(key:String):Void;
	/**
		Removes a custom plugin based on the given key.
	**/
	static function removeCustom(key:String):Void;
	/**
		Removes all Core Plugins.
		
		This includes all of the internal system plugins that Phaser needs, like the Input Plugin and Loader Plugin.
		So be sure you only call this if you do not wish to run Phaser again.
	**/
	static function destroyCorePlugins():Void;
	/**
		Removes all Custom Plugins.
	**/
	static function destroyCustomPlugins():Void;
}