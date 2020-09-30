package global.phaser.device;

/**
	Determines the input support of the browser running this Phaser Game instance.
	These values are read-only and populated during the boot sequence of the game.
	They are then referenced by internal game systems and are available for you to access
	via `this.sys.game.device.input` from within any Scene.
**/
typedef Input = {
	/**
		The newest type of Wheel/Scroll event supported: 'wheel', 'mousewheel', 'DOMMouseScroll'
	**/
	var wheelType : String;
	/**
		Is navigator.getGamepads available?
	**/
	var gamepads : Bool;
	/**
		Is mspointer available?
	**/
	var mspointer : Bool;
	/**
		Is touch available?
	**/
	var touch : Bool;
};