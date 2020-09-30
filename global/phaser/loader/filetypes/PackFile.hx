package global.phaser.loader.filetypes;

/**
	A single JSON Pack File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#pack method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#pack.
**/
@:native("Phaser.Loader.FileTypes.PackFile") extern class PackFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.PackFileConfig>, ?url:String, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject, ?dataKey:String);
	static var prototype : PackFile;
}