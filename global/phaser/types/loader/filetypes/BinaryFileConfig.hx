package global.phaser.types.loader.filetypes;

typedef BinaryFileConfig = {
	/**
		The key of the file. Must be unique within both the Loader and the Binary Cache.
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
		Optional type to cast the binary file to once loaded. For example, `Uint8Array`.
	**/
	@:optional
	var dataType : Dynamic;
};