package global.phaser.types.loader.filetypes;

typedef AsepriteFileConfig = {
	/**
		The key of the file. Must be unique within both the Loader and the Texture Manager.
	**/
	var key : String;
	/**
		The absolute or relative URL to load the texture image file from.
	**/
	@:optional
	var textureURL : String;
	/**
		The default file extension to use for the image texture if no url is provided.
	**/
	@:optional
	var textureExtension : String;
	/**
		Extra XHR Settings specifically for the texture image file.
	**/
	@:optional
	var textureXhrSettings : global.phaser.types.loader.XHRSettingsObject;
	/**
		The absolute or relative URL to load the atlas json file from. Or, a well formed JSON object to use instead.
	**/
	@:optional
	var atlasURL : ts.AnyOf2<String, Dynamic>;
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
};