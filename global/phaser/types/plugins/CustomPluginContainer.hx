package global.phaser.types.plugins;

typedef CustomPluginContainer = {
	/**
		The unique name of this plugin in the custom plugin cache.
	**/
	var key : String;
	/**
		The plugin to be stored. Should be the source object, not instantiated.
	**/
	var plugin : haxe.Constraints.Function;
};