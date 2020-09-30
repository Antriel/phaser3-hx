package global.phaser.types.loader.filetypes;

typedef BitmapFontFileConfig = {
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
		The filename of an associated normal map. It uses the same path and url to load as the texture image.
	**/
	@:optional
	var normalMap : String;
	/**
		The absolute or relative URL to load the font data xml file from.
	**/
	@:optional
	var fontDataURL : String;
	/**
		The default file extension to use for the font data xml if no url is provided.
	**/
	@:optional
	var fontDataExtension : String;
	/**
		Extra XHR Settings specifically for the font data xml file.
	**/
	@:optional
	var fontDataXhrSettings : global.phaser.types.loader.XHRSettingsObject;
};