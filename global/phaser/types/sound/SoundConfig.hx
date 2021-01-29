package global.phaser.types.sound;

/**
	Config object containing various sound settings.
**/
typedef SoundConfig = {
	/**
		Boolean indicating whether the sound should be muted or not.
	**/
	@:optional
	var mute : Bool;
	/**
		A value between 0 (silence) and 1 (full volume).
	**/
	@:optional
	var volume : Float;
	/**
		Defines the speed at which the sound should be played.
	**/
	@:optional
	var rate : Float;
	/**
		Represents detuning of sound in [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
	**/
	@:optional
	var detune : Float;
	/**
		Position of playback for this sound, in seconds.
	**/
	@:optional
	var seek : Float;
	/**
		Whether or not the sound or current sound marker should loop.
	**/
	@:optional
	var loop : Bool;
	/**
		Time, in seconds, that should elapse before the sound actually starts its playback.
	**/
	@:optional
	var delay : Float;
	/**
		A value between -1 (full left pan) and 1 (full right pan). 0 means no pan.
	**/
	@:optional
	var pan : Float;
};