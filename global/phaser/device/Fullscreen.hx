package global.phaser.device;

/**
	Determines the full screen support of the browser running this Phaser Game instance.
	These values are read-only and populated during the boot sequence of the game.
	They are then referenced by internal game systems and are available for you to access
	via `this.sys.game.device.fullscreen` from within any Scene.
**/
typedef Fullscreen = {
	/**
		Does the browser support the Full Screen API?
	**/
	var available : Bool;
	/**
		Does the browser support access to the Keyboard during Full Screen mode?
	**/
	var keyboard : Bool;
	/**
		If the browser supports the Full Screen API this holds the call you need to use to cancel it.
	**/
	var cancel : String;
	/**
		If the browser supports the Full Screen API this holds the call you need to use to activate it.
	**/
	var request : String;
};