package global.phaser.loader.filetypes;

/**
	A single Audio File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#audio method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#audio.
**/
@:native("Phaser.Loader.FileTypes.AudioFile") extern class AudioFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.AudioFileConfig>, ?urlConfig:Dynamic, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject, ?audioContext:js.html.audio.AudioContext);
	static var prototype : AudioFile;
}