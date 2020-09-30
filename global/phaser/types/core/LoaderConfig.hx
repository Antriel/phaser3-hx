package global.phaser.types.core;

typedef LoaderConfig = {
	/**
		A URL used to resolve paths given to the loader. Example: 'http://labs.phaser.io/assets/'.
	**/
	@:optional
	var baseURL : String;
	/**
		A URL path used to resolve relative paths given to the loader. Example: 'images/sprites/'.
	**/
	@:optional
	var path : String;
	/**
		The maximum number of resources the loader will start loading at once.
	**/
	@:optional
	var maxParallelDownloads : Float;
	/**
		'anonymous', 'use-credentials', or `undefined`. If you're not making cross-origin requests, leave this as `undefined`. See {@link https://developer.mozilla.org/en-US/docs/Web/HTML/CORS_settings_attributes}.
	**/
	@:optional
	var crossOrigin : String;
	/**
		The response type of the XHR request, e.g. `blob`, `text`, etc.
	**/
	@:optional
	var responseType : String;
	/**
		Should the XHR request use async or not?
	**/
	@:optional
	var async : Bool;
	/**
		Optional username for all XHR requests.
	**/
	@:optional
	var user : String;
	/**
		Optional password for all XHR requests.
	**/
	@:optional
	var password : String;
	/**
		Optional XHR timeout value, in ms.
	**/
	@:optional
	var timeout : Float;
};