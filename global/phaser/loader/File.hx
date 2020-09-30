package global.phaser.loader;

/**
	The base File class used by all File Types that the Loader can support.
	You shouldn't create an instance of a File directly, but should extend it with your own class, setting a custom type and processing methods.
**/
@:native("Phaser.Loader.File") extern class File {
	function new(loader:LoaderPlugin, fileConfig:global.phaser.types.loader.FileConfig);
	/**
		A reference to the Loader that is going to load this file.
	**/
	var loader : LoaderPlugin;
	/**
		A reference to the Cache, or Texture Manager, that is going to store this file if it loads.
	**/
	var cache : ts.AnyOf2<global.phaser.textures.TextureManager, global.phaser.cache.BaseCache>;
	/**
		The file type string (image, json, etc) for sorting within the Loader.
	**/
	var type : String;
	/**
		Unique cache key (unique within its file type)
	**/
	var key : String;
	/**
		The URL of the file, not including baseURL.
		
		Automatically has Loader.path prepended to it if a string.
		
		Can also be a JavaScript Object, such as the results of parsing JSON data.
	**/
	var url : ts.AnyOf2<String, Dynamic>;
	/**
		The final URL this file will load from, including baseURL and path.
		Set automatically when the Loader calls 'load' on this file.
	**/
	var src : String;
	/**
		The merged XHRSettings for this file.
	**/
	var xhrSettings : global.phaser.types.loader.XHRSettingsObject;
	/**
		The XMLHttpRequest instance (as created by XHR Loader) that is loading this File.
	**/
	var xhrLoader : js.html.XMLHttpRequest;
	/**
		The current state of the file. One of the FILE_CONST values.
	**/
	var state : Float;
	/**
		The total size of this file.
		Set by onProgress and only if loading via XHR.
	**/
	var bytesTotal : Float;
	/**
		Updated as the file loads.
		Only set if loading via XHR.
	**/
	var bytesLoaded : Float;
	/**
		A percentage value between 0 and 1 indicating how much of this file has loaded.
		Only set if loading via XHR.
	**/
	var percentComplete : Float;
	/**
		For CORs based loading.
		If this is undefined then the File will check BaseLoader.crossOrigin and use that (if set)
	**/
	var crossOrigin : Null<String>;
	/**
		The processed file data, stored here after the file has loaded.
	**/
	var data : Dynamic;
	/**
		A config object that can be used by file types to store transitional data.
	**/
	var config : Dynamic;
	/**
		If this is a multipart file, i.e. an atlas and its json together, then this is a reference
		to the parent MultiFile. Set and used internally by the Loader or specific file types.
	**/
	var multiFile : MultiFile;
	/**
		Does this file have an associated linked file? Such as an image and a normal map.
		Atlases and Bitmap Fonts use the multiFile, because those files need loading together but aren't
		actually bound by data, where-as a linkFile is.
	**/
	var linkFile : File;
	/**
		Links this File with another, so they depend upon each other for loading and processing.
	**/
	function setLink(fileB:File):Void;
	/**
		Resets the XHRLoader instance this file is using.
	**/
	function resetXHR():Void;
	/**
		Called by the Loader, starts the actual file downloading.
		During the load the methods onLoad, onError and onProgress are called, based on the XHR events.
		You shouldn't normally call this method directly, it's meant to be invoked by the Loader.
	**/
	function load():Void;
	/**
		Called when the file finishes loading, is sent a DOM ProgressEvent.
	**/
	function onLoad(xhr:js.html.XMLHttpRequest, event:js.html.ProgressEvent<js.html.EventTarget>):Void;
	/**
		Called if the file errors while loading, is sent a DOM ProgressEvent.
	**/
	function onError(xhr:js.html.XMLHttpRequest, event:js.html.ProgressEvent<js.html.EventTarget>):Void;
	/**
		Called during the file load progress. Is sent a DOM ProgressEvent.
	**/
	function onProgress(event:js.html.ProgressEvent<js.html.EventTarget>):Void;
	/**
		Usually overridden by the FileTypes and is called by Loader.nextFile.
		This method controls what extra work this File does with its loaded data, for example a JSON file will parse itself during this stage.
	**/
	function onProcess():Void;
	/**
		Called when the File has completed processing.
		Checks on the state of its multifile, if set.
	**/
	function onProcessComplete():Void;
	/**
		Called when the File has completed processing but it generated an error.
		Checks on the state of its multifile, if set.
	**/
	function onProcessError():Void;
	/**
		Checks if a key matching the one used by this file exists in the target Cache or not.
		This is called automatically by the LoaderPlugin to decide if the file can be safely
		loaded or will conflict.
	**/
	function hasCacheConflict():Bool;
	/**
		Adds this file to its target cache upon successful loading and processing.
		This method is often overridden by specific file types.
	**/
	function addToCache():Void;
	/**
		Called once the file has been added to its cache and is now ready for deletion from the Loader.
		It will emit a `filecomplete` event from the LoaderPlugin.
	**/
	function pendingDestroy():Void;
	/**
		Destroy this File and any references it holds.
	**/
	function destroy():Void;
	static var prototype : File;
	/**
		Static method for creating object URL using URL API and setting it as image 'src' attribute.
		If URL API is not supported (usually on old browsers) it falls back to creating Base64 encoded url using FileReader.
	**/
	static function createObjectURL(image:js.html.ImageElement, blob:js.html.Blob, defaultType:String):Void;
	/**
		Static method for releasing an existing object URL which was previously created
		by calling {@link File#createObjectURL} method.
	**/
	static function revokeObjectURL(image:js.html.ImageElement):Void;
}