package global.phaser.device;

/**
	Determines the video support of the browser running this Phaser Game instance.
	These values are read-only and populated during the boot sequence of the game.
	They are then referenced by internal game systems and are available for you to access
	via `this.sys.game.device.video` from within any Scene.
	
	In Phaser 3.20 the properties were renamed to drop the 'Video' suffix.
**/
typedef Video = {
	/**
		Can this device play h264 mp4 video files?
	**/
	var h264 : Bool;
	/**
		Can this device play hls video files?
	**/
	var hls : Bool;
	/**
		Can this device play h264 mp4 video files?
	**/
	var mp4 : Bool;
	/**
		Can this device play ogg video files?
	**/
	var ogg : Bool;
	/**
		Can this device play vp9 video files?
	**/
	var vp9 : Bool;
	/**
		Can this device play webm video files?
	**/
	var webm : Bool;
};