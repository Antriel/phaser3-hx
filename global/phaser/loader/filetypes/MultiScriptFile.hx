package global.phaser.loader.filetypes;

/**
	A Multi Script File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#scripts method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#scripts.
**/
@:native("Phaser.Loader.FileTypes.MultiScriptFile") extern class MultiScriptFile extends global.phaser.loader.MultiFile {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.MultiScriptFileConfig>, ?url:Array<String>, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject);
	/**
		Adds this file to its target cache upon successful loading and processing.
	**/
	function addToCache():Void;
	static var prototype : MultiScriptFile;
}