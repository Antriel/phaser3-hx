package global.phaser.types.plugins;

typedef CorePluginContainer = {
	/**
		The unique name of this plugin in the core plugin cache.
	**/
	var key : String;
	/**
		The plugin to be stored. Should be the source object, not instantiated.
	**/
	var plugin : haxe.Constraints.Function;
	/**
		If this plugin is to be injected into the Scene Systems, this is the property key map used.
	**/
	@:optional
	var mapping : String;
	/**
		Core Scene plugin or a Custom Scene plugin?
	**/
	@:optional
	var custom : Bool;
};