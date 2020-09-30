package global.phaser.loader.filetypes;

/**
	A single SVG File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#svg method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#svg.
**/
@:native("Phaser.Loader.FileTypes.SVGFile") extern class SVGFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.SVGFileConfig>, ?url:String, ?svgConfig:global.phaser.types.loader.filetypes.SVGSizeConfig, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	static var prototype : SVGFile;
}