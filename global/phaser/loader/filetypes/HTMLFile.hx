package global.phaser.loader.filetypes;

/**
	A single HTML File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#html method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#html.
**/
@:native("Phaser.Loader.FileTypes.HTMLFile") extern class HTMLFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.HTMLFileConfig>, ?url:String, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	static var prototype : HTMLFile;
}