package global.phaser.loader.filetypes;

/**
	A single Tilemap CSV File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#tilemapCSV method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#tilemapCSV.
**/
@:native("Phaser.Loader.FileTypes.TilemapCSVFile") extern class TilemapCSVFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.TilemapCSVFileConfig>, ?url:String, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	static var prototype : TilemapCSVFile;
}