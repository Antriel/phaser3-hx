package global.phaser.loader.filetypes;

/**
	A single Binary File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#binary method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#binary.
**/
@:native("Phaser.Loader.FileTypes.BinaryFile") extern class BinaryFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.BinaryFileConfig>, ?url:String, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject, ?dataType:Dynamic);
	static var prototype : BinaryFile;
}