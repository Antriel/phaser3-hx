package global.phaser.types.loader.filetypes;

typedef MultiAtlasFileConfig = {
	/**
		The key of the file. Must be unique within both the Loader and the Texture Manager.
	**/
	var key : String;
	/**
		The absolute or relative URL to load the multi atlas json file from. Or, a well formed JSON object.
	**/
	@:optional
	var atlasURL : String;
	/**
		An alias for 'atlasURL'. If given, it overrides anything set in 'atlasURL'.
	**/
	@:optional
	var url : String;
	/**
		The default file extension to use for the atlas json if no url is provided.
	**/
	@:optional
	var atlasExtension : String;
	/**
		Extra XHR Settings specifically for the atlas json file.
	**/
	@:optional
	var atlasXhrSettings : global.phaser.types.loader.XHRSettingsObject;
	/**
		Optional path to use when loading the textures defined in the atlas data.
	**/
	@:optional
	var path : String;
	/**
		Optional Base URL to use when loading the textures defined in the atlas data.
	**/
	@:optional
	var baseURL : String;
	/**
		Extra XHR Settings specifically for the texture files.
	**/
	@:optional
	var textureXhrSettings : global.phaser.types.loader.XHRSettingsObject;
};