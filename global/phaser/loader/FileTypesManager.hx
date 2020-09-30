package global.phaser.loader;

@:native("Phaser.Loader.FileTypesManager") @valueModuleOnly extern class FileTypesManager {
	/**
		Static method called when a LoaderPlugin is created.
		
		Loops through the local types object and injects all of them as
		properties into the LoaderPlugin instance.
	**/
	static function install(loader:LoaderPlugin):Void;
	/**
		Static method called directly by the File Types.
		
		The key is a reference to the function used to load the files via the Loader, i.e. `image`.
	**/
	static function register(key:String, factoryFunction:haxe.Constraints.Function):Void;
	/**
		Removed all associated file types.
	**/
	static function destroy():Void;
}