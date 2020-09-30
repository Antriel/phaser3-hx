package global.phaser.loader.filetypes;

/**
	A single Sprite Sheet Image File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#spritesheet method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#spritesheet.
**/
@:native("Phaser.Loader.FileTypes.SpriteSheetFile") extern class SpriteSheetFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.SpriteSheetFileConfig>, ?url:ts.AnyOf2<String, Array<String>>, ?frameConfig:global.phaser.types.loader.filetypes.ImageFrameConfig, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	static var prototype : SpriteSheetFile;
}