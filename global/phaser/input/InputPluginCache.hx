package global.phaser.input;

@:native("Phaser.Input.InputPluginCache") @valueModuleOnly extern class InputPluginCache {
	/**
		Static method called directly by the Core internal Plugins.
		Key is a reference used to get the plugin from the plugins object (i.e. InputPlugin)
		Plugin is the object to instantiate to create the plugin
		Mapping is what the plugin is injected into the Scene.Systems as (i.e. input)
	**/
	static function register(key:String, plugin:haxe.Constraints.Function, mapping:String, settingsKey:String, configKey:String):Void;
	/**
		Returns the input plugin object from the cache based on the given key.
	**/
	static function getPlugin(key:String):global.phaser.types.input.InputPluginContainer;
	/**
		Installs all of the registered Input Plugins into the given target.
	**/
	static function install(target:InputPlugin):Void;
	/**
		Removes an input plugin based on the given key.
	**/
	static function remove(key:String):Void;
}