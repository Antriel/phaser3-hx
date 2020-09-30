package global.phaser;

@:native("Phaser.Loader") @valueModuleOnly extern class Loader {
	/**
		Given a File and a baseURL value this returns the URL the File will use to download from.
	**/
	static function GetURL(file:global.phaser.loader.File, baseURL:String):String;
	/**
		Takes two XHRSettings Objects and creates a new XHRSettings object from them.
		
		The new object is seeded by the values given in the global settings, but any setting in
		the local object overrides the global ones.
	**/
	static function MergeXHRSettings(global:global.phaser.types.loader.XHRSettingsObject, local:global.phaser.types.loader.XHRSettingsObject):global.phaser.types.loader.XHRSettingsObject;
	/**
		Creates a new XMLHttpRequest (xhr) object based on the given File and XHRSettings
		and starts the download of it. It uses the Files own XHRSettings and merges them
		with the global XHRSettings object to set the xhr values before download.
	**/
	static function XHRLoader(file:global.phaser.loader.File, globalXHRSettings:global.phaser.types.loader.XHRSettingsObject):js.html.XMLHttpRequest;
	/**
		Creates an XHRSettings Object with default values.
	**/
	static function XHRSettings(?responseType:js.html.XMLHttpRequestResponseType, ?async:Bool, ?user:String, ?password:String, ?timeout:Float, ?withCredentials:Bool):global.phaser.types.loader.XHRSettingsObject;
	/**
		The Loader is idle.
	**/
	static var LOADER_IDLE : Float;
	/**
		The Loader is actively loading.
	**/
	static var LOADER_LOADING : Float;
	/**
		The Loader is processing files is has loaded.
	**/
	static var LOADER_PROCESSING : Float;
	/**
		The Loader has completed loading and processing.
	**/
	static var LOADER_COMPLETE : Float;
	/**
		The Loader is shutting down.
	**/
	static var LOADER_SHUTDOWN : Float;
	/**
		The Loader has been destroyed.
	**/
	static var LOADER_DESTROYED : Float;
	/**
		File is in the load queue but not yet started
	**/
	static var FILE_PENDING : Float;
	/**
		File has been started to load by the loader (onLoad called)
	**/
	static var FILE_LOADING : Float;
	/**
		File has loaded successfully, awaiting processing
	**/
	static var FILE_LOADED : Float;
	/**
		File failed to load
	**/
	static var FILE_FAILED : Float;
	/**
		File is being processed (onProcess callback)
	**/
	static var FILE_PROCESSING : Float;
	/**
		The File has errored somehow during processing.
	**/
	static var FILE_ERRORED : Float;
	/**
		File has finished processing.
	**/
	static var FILE_COMPLETE : Float;
	/**
		File has been destroyed
	**/
	static var FILE_DESTROYED : Float;
	/**
		File was populated from local data and doesn't need an HTTP request
	**/
	static var FILE_POPULATED : Float;
}