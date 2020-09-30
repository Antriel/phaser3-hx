package global.phaser.loader.filetypes;

/**
	A single JSON based Texture Atlas File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#atlas method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#atlas.
	
	https://www.codeandweb.com/texturepacker/tutorials/how-to-create-sprite-sheets-for-phaser3?source=photonstorm
**/
@:native("Phaser.Loader.FileTypes.AtlasJSONFile") extern class AtlasJSONFile extends global.phaser.loader.MultiFile {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.AtlasJSONFileConfig>, ?textureURL:ts.AnyOf2<String, Array<String>>, ?atlasURL:ts.AnyOf2<String, Dynamic>, ?textureXhrSettings:global.phaser.types.loader.XHRSettingsObject, ?atlasXhrSettings:global.phaser.types.loader.XHRSettingsObject);
	/**
		Adds this file to its target cache upon successful loading and processing.
	**/
	function addToCache():Void;
	static var prototype : AtlasJSONFile;
}