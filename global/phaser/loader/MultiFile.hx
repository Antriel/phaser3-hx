package global.phaser.loader;

/**
	A MultiFile is a special kind of parent that contains two, or more, Files as children and looks after
	the loading and processing of them all. It is commonly extended and used as a base class for file types such as AtlasJSON or BitmapFont.
	
	You shouldn't create an instance of a MultiFile directly, but should extend it with your own class, setting a custom type and processing methods.
**/
@:native("Phaser.Loader.MultiFile") extern class MultiFile {
	function new(loader:LoaderPlugin, type:String, key:String, files:Array<File>);
	/**
		A reference to the Loader that is going to load this file.
	**/
	var loader : LoaderPlugin;
	/**
		The file type string for sorting within the Loader.
	**/
	var type : String;
	/**
		Unique cache key (unique within its file type)
	**/
	var key : String;
	/**
		Array of files that make up this MultiFile.
	**/
	var files : Array<File>;
	/**
		The completion status of this MultiFile.
	**/
	var complete : Bool;
	/**
		The number of files to load.
	**/
	var pending : Float;
	/**
		The number of files that failed to load.
	**/
	var failed : Float;
	/**
		A storage container for transient data that the loading files need.
	**/
	var config : Dynamic;
	/**
		A reference to the Loaders baseURL at the time this MultiFile was created.
		Used to populate child-files.
	**/
	var baseURL : String;
	/**
		A reference to the Loaders path at the time this MultiFile was created.
		Used to populate child-files.
	**/
	var path : String;
	/**
		A reference to the Loaders prefix at the time this MultiFile was created.
		Used to populate child-files.
	**/
	var prefix : String;
	/**
		Checks if this MultiFile is ready to process its children or not.
	**/
	function isReadyToProcess():Bool;
	/**
		Adds another child to this MultiFile, increases the pending count and resets the completion status.
	**/
	function addToMultiFile(files:File):MultiFile;
	/**
		Called by each File when it finishes loading.
	**/
	function onFileComplete(file:File):Void;
	/**
		Called by each File that fails to load.
	**/
	function onFileFailed(file:File):Void;
	static var prototype : MultiFile;
}