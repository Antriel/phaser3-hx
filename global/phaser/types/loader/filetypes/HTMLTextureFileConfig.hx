package global.phaser.types.loader.filetypes;

typedef HTMLTextureFileConfig = {
	/**
		The key of the file. Must be unique within both the Loader and the Texture Manager.
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
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : global.phaser.types.loader.XHRSettingsObject;
	/**
		The width of the texture the HTML will be rendered to.
	**/
	@:optional
	var width : Float;
	/**
		The height of the texture the HTML will be rendered to.
	**/
	@:optional
	var height : Float;
};