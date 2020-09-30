package global.phaser.loader.filetypes;

/**
	A single JSON File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#json method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#json.
**/
@:native("Phaser.Loader.FileTypes.JSONFile") extern class JSONFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.JSONFileConfig>, ?url:ts.AnyOf2<String, Dynamic>, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject, ?dataKey:String);
	static var prototype : JSONFile;
}