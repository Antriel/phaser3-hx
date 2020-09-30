package global.phaser.loader.filetypes;

/**
	A single Audio File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#audio method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#audio.
**/
@:native("Phaser.Loader.FileTypes.HTML5AudioFile") extern class HTML5AudioFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.AudioFileConfig>, ?urlConfig:String, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	/**
		Called when the file finishes loading.
	**/
	function onLoad():Void;
	/**
		Called if the file errors while loading.
	**/
	function onError():Void;
	/**
		Called during the file load progress. Is sent a DOM ProgressEvent.
	**/
	function onProgress():Void;
	static var prototype : HTML5AudioFile;
}