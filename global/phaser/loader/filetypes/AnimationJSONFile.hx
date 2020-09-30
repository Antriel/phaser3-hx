package global.phaser.loader.filetypes;

/**
	A single Animation JSON File suitable for loading by the Loader.
	
	These are created when you use the Phaser.Loader.LoaderPlugin#animation method and are not typically created directly.
	
	For documentation about what all the arguments and configuration options mean please see Phaser.Loader.LoaderPlugin#animation.
**/
@:native("Phaser.Loader.FileTypes.AnimationJSONFile") extern class AnimationJSONFile extends global.phaser.loader.File {
	function new(loader:global.phaser.loader.LoaderPlugin, key:ts.AnyOf2<String, global.phaser.types.loader.filetypes.JSONFileConfig>, ?url:String, ?xhrSettings:global.phaser.types.loader.XHRSettingsObject, ?dataKey:String);
	/**
		Called at the end of the load process, after the Loader has finished all files in its queue.
	**/
	function onLoadComplete():Void;
	static var prototype : AnimationJSONFile;
}