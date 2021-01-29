package global.phaser.types.loader.filetypes;

typedef OBJFileConfig = {
	/**
		The key of the file. Must be unique within both the Loader and the OBJ Cache.
	**/
	var key : String;
	/**
		The absolute or relative URL to load this file from. If undefined or `null` it will be set to `<key>.obj`, i.e. if `key` was "alien" then the URL will be "alien.obj".
	**/
	@:optional
	var url : String;
	/**
		The default file extension to use if no url is provided.
	**/
	@:optional
	var extension : String;
	/**
		Flip the UV coordinates stored in the model data?
	**/
	@:optional
	var flipUV : Bool;
	/**
		An optional absolute or relative URL to the object material file from. If undefined or `null`, no material file will be loaded.
	**/
	@:optional
	var matURL : String;
	/**
		The default material file extension to use if no url is provided.
	**/
	@:optional
	var matExtension : String;
	/**
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : global.phaser.types.loader.XHRSettingsObject;
};