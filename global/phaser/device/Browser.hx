package global.phaser.device;

/**
	Determines the browser type and version running this Phaser Game instance.
	These values are read-only and populated during the boot sequence of the game.
	They are then referenced by internal game systems and are available for you to access
	via `this.sys.game.device.browser` from within any Scene.
**/
typedef Browser = {
	/**
		Set to true if running in Chrome.
	**/
	var chrome : Bool;
	/**
		Set to true if running in Microsoft Edge browser.
	**/
	var edge : Bool;
	/**
		Set to true if running in Firefox.
	**/
	var firefox : Bool;
	/**
		Set to true if running in Internet Explorer 11 or less (not Edge).
	**/
	var ie : Bool;
	/**
		Set to true if running in Mobile Safari.
	**/
	var mobileSafari : Bool;
	/**
		Set to true if running in Opera.
	**/
	var opera : Bool;
	/**
		Set to true if running in Safari.
	**/
	var safari : Bool;
	/**
		Set to true if running in the Silk browser (as used on the Amazon Kindle)
	**/
	var silk : Bool;
	/**
		Set to true if running a Trident version of Internet Explorer (IE11+)
	**/
	var trident : Bool;
	/**
		If running in Chrome this will contain the major version number.
	**/
	var chromeVersion : Float;
	/**
		If running in Firefox this will contain the major version number.
	**/
	var firefoxVersion : Float;
	/**
		If running in Internet Explorer this will contain the major version number. Beyond IE10 you should use Browser.trident and Browser.tridentVersion.
	**/
	var ieVersion : Float;
	/**
		If running in Safari this will contain the major version number.
	**/
	var safariVersion : Float;
	/**
		If running in Internet Explorer 11 this will contain the major version number. See {@link http://msdn.microsoft.com/en-us/library/ie/ms537503(v=vs.85).aspx}
	**/
	var tridentVersion : Float;
};