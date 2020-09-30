package global.phaser.types.loader.filetypes;

typedef MultiScriptFileConfig = {
	/**
		The key of the file. Must be unique within the Loader.
	**/
	var key : String;
	/**
		An array of absolute or relative URLs to load the script files from. They are processed in the order given in the array.
	**/
	@:optional
	var url : Array<String>;
	/**
		The default file extension to use if no url is provided.
	**/
	@:optional
	var extension : String;
	/**
		Extra XHR Settings specifically for these files.
	**/
	@:optional
	var xhrSettings : global.phaser.types.loader.XHRSettingsObject;
};