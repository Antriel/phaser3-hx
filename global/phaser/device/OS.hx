package global.phaser.device;

/**
	Determines the operating system of the device running this Phaser Game instance.
	These values are read-only and populated during the boot sequence of the game.
	They are then referenced by internal game systems and are available for you to access
	via `this.sys.game.device.os` from within any Scene.
**/
typedef OS = {
	/**
		Is running on android?
	**/
	var android : Bool;
	/**
		Is running on chromeOS?
	**/
	var chromeOS : Bool;
	/**
		Is the game running under Apache Cordova?
	**/
	var cordova : Bool;
	/**
		Is the game running under the Intel Crosswalk XDK?
	**/
	var crosswalk : Bool;
	/**
		Is running on a desktop?
	**/
	var desktop : Bool;
	/**
		Is the game running under Ejecta?
	**/
	var ejecta : Bool;
	/**
		Is the game running under GitHub Electron?
	**/
	var electron : Bool;
	/**
		Is running on iOS?
	**/
	var iOS : Bool;
	/**
		Is running on iPad?
	**/
	var iPad : Bool;
	/**
		Is running on iPhone?
	**/
	var iPhone : Bool;
	/**
		Is running on an Amazon Kindle?
	**/
	var kindle : Bool;
	/**
		Is running on linux?
	**/
	var linux : Bool;
	/**
		Is running on macOS?
	**/
	var macOS : Bool;
	/**
		Is the game running under Node.js?
	**/
	var node : Bool;
	/**
		Is the game running under Node-Webkit?
	**/
	var nodeWebkit : Bool;
	/**
		Set to true if running as a WebApp, i.e. within a WebView
	**/
	var webApp : Bool;
	/**
		Is running on windows?
	**/
	var windows : Bool;
	/**
		Is running on a Windows Phone?
	**/
	var windowsPhone : Bool;
	/**
		If running in iOS this will contain the major version number.
	**/
	var iOSVersion : Float;
	/**
		PixelRatio of the host device?
	**/
	var pixelRatio : Float;
};