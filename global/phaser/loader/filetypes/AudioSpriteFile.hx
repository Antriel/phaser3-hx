package global.phaser.loader.filetypes;

/**
	An Audio Sprite File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#audioSprite method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#audioSprite.
**/
@:native("Phaser.Loader.FileTypes.AudioSpriteFile") extern class AudioSpriteFile extends global.phaser.loader.MultiFile {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.AudioSpriteFileConfig>, jsonURL:String, ?audioURL:Dynamic, ?audioConfig:Dynamic, ?audioXhrSettings:global.phaser.types.loader.XHRSettingsObject, ?jsonXhrSettings:global.phaser.types.loader.XHRSettingsObject);
	/**
		Adds this file to its target cache upon successful loading and processing.
	**/
	function addToCache():Void;
	static var prototype : AudioSpriteFile;
}