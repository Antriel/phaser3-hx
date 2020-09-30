package global.phaser.types.loader.filetypes;

typedef ScenePluginFileConfig = {
	/**
		The key of the file. Must be unique within the Loader.
	**/
	var key : String;
	/**
		The absolute or relative URL to load the file from. Or, a Scene Plugin.
	**/
	@:optional
	var url : ts.AnyOf2<String, haxe.Constraints.Function>;
	/**
		The default file extension to use if no url is provided.
	**/
	@:optional
	var extension : String;
	/**
		If this plugin is to be added to Scene.Systems, this is the property key for it.
	**/
	@:optional
	var systemKey : String;
	/**
		If this plugin is to be added to the Scene, this is the property key for it.
	**/
	@:optional
	var sceneKey : String;
	/**
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : global.phaser.types.loader.XHRSettingsObject;
};