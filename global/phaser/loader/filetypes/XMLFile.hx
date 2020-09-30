package global.phaser.loader.filetypes;

/**
	A single XML File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#xml method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#xml.
**/
@:native("Phaser.Loader.FileTypes.XMLFile") extern class XMLFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.XMLFileConfig>, ?url:String, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	static var prototype : XMLFile;
}