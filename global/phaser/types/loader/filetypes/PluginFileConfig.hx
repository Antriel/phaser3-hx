package global.phaser.types.loader.filetypes;

typedef PluginFileConfig = {
	/**
		The key of the file. Must be unique within the Loader.
	**/
	var key : String;
	/**
		The absolute or relative URL to load the file from.
	**/
	@:optional
	var url : String;
	/**
		The default file extension to use if no url is provided.
	**/
	@:optional
	var extension : String;
	/**
		Automatically start the plugin after loading?
	**/
	@:optional
	var start : Bool;
	/**
		If this plugin is to be injected into the Scene, this is the property key used.
	**/
	@:optional
	var mapping : String;
	/**
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : global.phaser.types.loader.XHRSettingsObject;
};