package global.phaser.loader.filetypes;

/**
	A single Multi Texture Atlas File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#multiatlas method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#multiatlas.
**/
@:native("Phaser.Loader.FileTypes.MultiAtlasFile") extern class MultiAtlasFile extends global.phaser.loader.MultiFile {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.MultiAtlasFileConfig>, ?atlasURL:String, ?path:String, ?baseURL:String, ?atlasXhrSettings:global.phaser.types.loader.XHRSettingsObject, ?textureXhrSettings:global.phaser.types.loader.XHRSettingsObject);
	/**
		Adds this file to its target cache upon successful loading and processing.
	**/
	function addToCache():Void;
	static var prototype : MultiAtlasFile;
}