package global.phaser.types.loader.filetypes;

typedef GLSLFileConfig = {
	/**
		The key of the file. Must be unique within both the Loader and the Text Cache.
	**/
	var key : String;
	/**
		The absolute or relative URL to load the file from.
	**/
	@:optional
	var url : String;
	/**
		The type of shader. Either `fragment` for a fragment shader, or `vertex` for a vertex shader. This is ignored if you load a shader bundle.
	**/
	@:optional
	var shaderType : String;
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