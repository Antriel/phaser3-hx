package global.phaser.types.loader;

typedef XHRSettingsObject = {
	/**
		The response type of the XHR request, i.e. `blob`, `text`, etc.
	**/
	var responseType : js.html.XMLHttpRequestResponseType;
	/**
		Should the XHR request use async or not?
	**/
	@:optional
	var async : Bool;
	/**
		Optional username for the XHR request.
	**/
	@:optional
	var user : String;
	/**
		Optional password for the XHR request.
	**/
	@:optional
	var password : String;
	/**
		Optional XHR timeout value.
	**/
	@:optional
	var timeout : Float;
	/**
		This value is used to populate the XHR `setRequestHeader` and is undefined by default.
	**/
	@:optional
	var headers : Dynamic;
	/**
		This value is used to populate the XHR `setRequestHeader` and is undefined by default.
	**/
	@:optional
	var header : String;
	/**
		This value is used to populate the XHR `setRequestHeader` and is undefined by default.
	**/
	@:optional
	var headerValue : String;
	/**
		This value is used to populate the XHR `setRequestHeader` and is undefined by default.
	**/
	@:optional
	var requestedWith : String;
	/**
		Provide a custom mime-type to use instead of the default.
	**/
	@:optional
	var overrideMimeType : String;
	/**
		The withCredentials property indicates whether or not cross-site Access-Control requests should be made using credentials such as cookies, authorization headers or TLS client certificates. Setting withCredentials has no effect on same-site requests.
	**/
	@:optional
	var withCredentials : Bool;
};