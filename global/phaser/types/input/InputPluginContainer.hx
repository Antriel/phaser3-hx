package global.phaser.types.input;

typedef InputPluginContainer = {
	/**
		The unique name of this plugin in the input plugin cache.
	**/
	var key : String;
	/**
		The plugin to be stored. Should be the source object, not instantiated.
	**/
	var plugin : haxe.Constraints.Function;
	/**
		If this plugin is to be injected into the Input Plugin, this is the property key map used.
	**/
	@:optional
	var mapping : String;
};