package global.phaser.scale;

@:native("Phaser.Scale.Events") @valueModuleOnly extern class Events {
	/**
		The Scale Manager has successfully entered fullscreen mode.
	**/
	static final ENTER_FULLSCREEN : Dynamic;
	/**
		The Scale Manager tried to enter fullscreen mode but failed.
	**/
	static final FULLSCREEN_FAILED : Dynamic;
	/**
		The Scale Manager tried to enter fullscreen mode, but it is unsupported by the browser.
	**/
	static final FULLSCREEN_UNSUPPORTED : Dynamic;
	/**
		The Scale Manager was in fullscreen mode, but has since left, either directly via game code,
		or via a user gestured, such as pressing the ESC key.
	**/
	static final LEAVE_FULLSCREEN : Dynamic;
	/**
		The Scale Manager Orientation Change Event.
		
		This event is dispatched whenever the Scale Manager detects an orientation change event from the browser.
	**/
	static final ORIENTATION_CHANGE : Dynamic;
	/**
		The Scale Manager Resize Event.
		
		This event is dispatched whenever the Scale Manager detects a resize event from the browser.
		It sends three parameters to the callback, each of them being Size components. You can read
		the `width`, `height`, `aspectRatio` and other properties of these components to help with
		scaling your own game content.
	**/
	static final RESIZE : Dynamic;
}