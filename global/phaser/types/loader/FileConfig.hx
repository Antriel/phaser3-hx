package global.phaser.types.loader;

typedef FileConfig = {
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
	**/
	@:optional
	var url : String;
	/**
		The path of the file, not including the baseURL.
	**/
	@:optional
	var path : String;
	/**
		The default extension this file uses.
	**/
	@:optional
	var extension : String;
	/**
		The responseType to be used by the XHR request.
	**/
	@:optional
	var responseType : js.html.XMLHttpRequestResponseType;
	/**
		Custom XHR Settings specific to this file and merged with the Loader defaults.
	**/
	@:optional
	var xhrSettings : ts.AnyOf2<Bool, XHRSettingsObject>;
	/**
		A config object that can be used by file types to store transitional data.
	**/
	@:optional
	var config : Dynamic;
};