package global.phaser.device;

/**
	Determines the audio playback capabilities of the device running this Phaser Game instance.
	These values are read-only and populated during the boot sequence of the game.
	They are then referenced by internal game systems and are available for you to access
	via `this.sys.game.device.audio` from within any Scene.
**/
typedef Audio = {
	/**
		Can this device play HTML Audio tags?
	**/
	var audioData : Bool;
	/**
		Can this device play EC-3 Dolby Digital Plus files?
	**/
	var dolby : Bool;
	/**
		Can this device can play m4a files.
	**/
	var m4a : Bool;
	/**
		Can this device play mp3 files?
	**/
	var mp3 : Bool;
	/**
		Can this device play ogg files?
	**/
	var ogg : Bool;
	/**
		Can this device play opus files?
	**/
	var opus : Bool;
	/**
		Can this device play wav files?
	**/
	var wav : Bool;
	/**
		Does this device have the Web Audio API?
	**/
	var webAudio : Bool;
	/**
		Can this device play webm files?
	**/
	var webm : Bool;
};