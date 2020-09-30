package global.phaser.types.loader.filetypes;

typedef TilemapJSONFileConfig = {
	/**
		The key of the file. Must be unique within both the Loader and the Tilemap Cache.
	**/
	var key : String;
	/**
		The absolute or relative URL to load the file from. Or, a well formed JSON object.
	**/
	@:optional
	var url : ts.AnyOf2<String, Dynamic>;
	/**
		The default file extension to use if no url is provided.
	**/
	@:optional
	var extension : String;
	/**
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : global.phaser.types.loader.XHRSettingsObject;
};