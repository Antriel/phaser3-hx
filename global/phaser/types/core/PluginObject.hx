package global.phaser.types.core;

typedef PluginObject = {
	/**
		Global plugins to install.
	**/
	@:optional
	var global : Array<PluginObjectItem>;
	/**
		Scene plugins to install.
	**/
	@:optional
	var scene : Array<PluginObjectItem>;
	/**
		The default set of scene plugins (names).
	**/
	@:optional
	@:native("default")
	var default_ : Array<String>;
	/**
		Plugins to *add* to the default set of scene plugins.
	**/
	@:optional
	var defaultMerge : Array<String>;
};