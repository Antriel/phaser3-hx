package global.phaser.loader.filetypes;

/**
	A single Impact.js Tilemap JSON File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#tilemapImpact method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#tilemapImpact.
**/
@:native("Phaser.Loader.FileTypes.TilemapImpactFile") extern class TilemapImpactFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.TilemapImpactFileConfig>, ?url:String, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	static var prototype : TilemapImpactFile;
}