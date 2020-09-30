package global.phaser.device;

/**
	Determines the features of the browser running this Phaser Game instance.
	These values are read-only and populated during the boot sequence of the game.
	They are then referenced by internal game systems and are available for you to access
	via `this.sys.game.device.features` from within any Scene.
**/
typedef Features = {
	/**
		True if canvas supports a 'copy' bitblt onto itself when the source and destination regions overlap.
	**/
	var canvasBitBltShift : Bool;
	/**
		Is canvas available?
	**/
	var canvas : Bool;
	/**
		Is file available?
	**/
	var file : Bool;
	/**
		Is fileSystem available?
	**/
	var fileSystem : Bool;
	/**
		Does the device support the getUserMedia API?
	**/
	var getUserMedia : Bool;
	/**
		Is the device big or little endian? (only detected if the browser supports TypedArrays)
	**/
	var littleEndian : Bool;
	/**
		Is localStorage available?
	**/
	var localStorage : Bool;
	/**
		Is Pointer Lock available?
	**/
	var pointerLock : Bool;
	/**
		Does the device context support 32bit pixel manipulation using array buffer views?
	**/
	var support32bit : Bool;
	/**
		Does the device support the Vibration API?
	**/
	var vibration : Bool;
	/**
		Is webGL available?
	**/
	var webGL : Bool;
	/**
		Is worker available?
	**/
	var worker : Bool;
};