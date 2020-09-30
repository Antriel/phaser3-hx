package global.phaser.loader.filetypes;

/**
	A single Script File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#script method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#script.
**/
@:native("Phaser.Loader.FileTypes.ScriptFile") extern class ScriptFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.ScriptFileConfig>, ?url:String, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	static var prototype : ScriptFile;
}