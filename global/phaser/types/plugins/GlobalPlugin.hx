package global.phaser.types.plugins;

typedef GlobalPlugin = {
	/**
		The unique name of this plugin within the plugin cache.
	**/
	var key : String;
	/**
		An instance of the plugin.
	**/
	var plugin : haxe.Constraints.Function;
	/**
		Is the plugin active or not?
	**/
	@:optional
	var active : Bool;
	/**
		If this plugin is to be injected into the Scene Systems, this is the property key map used.
	**/
	@:optional
	var mapping : String;
};