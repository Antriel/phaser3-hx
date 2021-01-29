package global.phaser.loader.filetypes;

/**
	A single Wavefront OBJ File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#obj method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#obj.
**/
@:native("Phaser.Loader.FileTypes.OBJFile") extern class OBJFile extends global.phaser.loader.MultiFile {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.OBJFileConfig>, ?objURL:String, ?matURL:String, ?flipUV:Bool, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	/**
		Adds this file to its target cache upon successful loading and processing.
	**/
	function addToCache():Void;
	static var prototype : OBJFile;
}