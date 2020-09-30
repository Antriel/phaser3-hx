package global.phaser.types.core;

typedef PluginObjectItem = {
	/**
		A key to identify the plugin in the Plugin Manager.
	**/
	@:optional
	var key : String;
	/**
		The plugin itself. Usually a class/constructor.
	**/
	@:optional
	var plugin : Dynamic;
	/**
		Whether the plugin should be started automatically.
	**/
	@:optional
	var start : Bool;
	/**
		For a scene plugin, add the plugin to the scene's systems object under this key (`this.sys.KEY`, from the scene).
	**/
	@:optional
	var systemKey : String;
	/**
		For a scene plugin, add the plugin to the scene object under this key (`this.KEY`, from the scene).
	**/
	@:optional
	var sceneKey : String;
	/**
		If this plugin is to be injected into the Scene Systems, this is the property key map used.
	**/
	@:optional
	var mapping : String;
	/**
		Arbitrary data passed to the plugin's init() method.
	**/
	@:optional
	var data : Dynamic;
};