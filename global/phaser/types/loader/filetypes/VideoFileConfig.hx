package global.phaser.types.loader.filetypes;

typedef VideoFileConfig = {
	/**
		The key to use for this file, or a file configuration object.
	**/
	var key : ts.AnyOf2<String, VideoFileConfig>;
	/**
		The absolute or relative URL to load this file from in a config object.
	**/
	@:optional
	var urlConfig : Dynamic;
	/**
		The load event to listen for when _not_ loading as a blob. Either 'loadeddata', 'canplay' or 'canplaythrough'.
	**/
	@:optional
	var loadEvent : String;
	/**
		Load the video as a data blob, or via the Video element?
	**/
	@:optional
	var asBlob : Bool;
	/**
		Does the video have an audio track? If not you can enable auto-playing on it.
	**/
	@:optional
	var noAudio : Bool;
	/**
		Extra XHR Settings specifically for this file.
	**/
	@:optional
	var xhrSettings : global.phaser.types.loader.XHRSettingsObject;
};