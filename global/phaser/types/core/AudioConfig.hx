package global.phaser.types.core;

/**
	Config object containing various sound settings.
**/
typedef AudioConfig = {
	/**
		Use HTML5 Audio instead of Web Audio.
	**/
	@:optional
	var disableWebAudio : Bool;
	/**
		An existing Web Audio context.
	**/
	@:optional
	var context : js.html.audio.AudioContext;
	/**
		Disable all audio output.
	**/
	@:optional
	var noAudio : Bool;
};