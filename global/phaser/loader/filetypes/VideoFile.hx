package global.phaser.loader.filetypes;

/**
	A single Video File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#video method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#video.
**/
@:native("Phaser.Loader.FileTypes.VideoFile") extern class VideoFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.VideoFileConfig>, ?urlConfig:Dynamic, ?loadEvent:String, ?asBlob:Bool, ?noAudio:Bool, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	static var prototype : VideoFile;
}