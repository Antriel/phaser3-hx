package global.phaser.loader.filetypes;

/**
	An external Scene JavaScript File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#sceneFile method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#sceneFile.
**/
@:native("Phaser.Loader.FileTypes.SceneFile") extern class SceneFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.SceneFileConfig>, ?url:String, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	static var prototype : SceneFile;
}