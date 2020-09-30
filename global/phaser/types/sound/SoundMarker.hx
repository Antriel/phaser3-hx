package global.phaser.types.sound;

/**
	Marked section of a sound represented by name, and optionally start time, duration, and config object.
**/
typedef SoundMarker = {
	/**
		Unique identifier of a sound marker.
	**/
	var name : String;
	/**
		Sound position offset at witch playback should start.
	**/
	@:optional
	var start : Float;
	/**
		Playback duration of this marker.
	**/
	@:optional
	var duration : Float;
	/**
		An optional config object containing default marker settings.
	**/
	@:optional
	var config : SoundConfig;
};