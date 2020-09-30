package global.phaser.types.loader.filetypes;

typedef AudioFileConfig = {
	/**
		The key of the file. Must be unique within the Loader and Audio Cache.
	**/
	var key : String;
	/**
		The absolute or relative URL to load the file from.
	**/
	@:optional
	var urlConfig : String;
	/**
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : global.phaser.types.loader.XHRSettingsObject;
	/**
		The AudioContext this file will use to process itself.
	**/
	@:optional
	var audioContext : js.html.audio.AudioContext;
};