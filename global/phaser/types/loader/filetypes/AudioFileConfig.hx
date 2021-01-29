package global.phaser.types.loader.filetypes;

typedef AudioFileConfig = {
	/**
		The key of the file. Must be unique within the Loader and Audio Cache.
	**/
	var key : String;
	/**
		The absolute or relative URLs to load the audio files from.
	**/
	@:optional
	var url : ts.AnyOf2<String, Array<String>>;
	/**
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : global.phaser.types.loader.XHRSettingsObject;
	/**
		The optional AudioContext this file will use to process itself.
	**/
	@:optional
	var context : js.html.audio.AudioContext;
};