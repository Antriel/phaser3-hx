package global.phaser.sound;

/**
	Web Audio API implementation of the sound.
**/
@:native("Phaser.Sound.WebAudioSound") extern class WebAudioSound extends BaseSound {
	function new(manager:WebAudioSoundManager, key:String, ?config:global.phaser.types.sound.SoundConfig);
	/**
		Rate at which this Sound will be played.
		Value of 1.0 plays the audio at full speed, 0.5 plays the audio at half speed
		and 2.0 doubles the audios playback speed.
	**/
	var rate : Float;
	/**
		Sets the playback rate of this Sound.
		
		For example, a value of 1.0 plays the audio at full speed, 0.5 plays the audio at half speed
		and 2.0 doubles the audios playback speed.
	**/
	function setRate(value:Float):WebAudioSound;
	/**
		The detune value of this Sound, given in [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
		The range of the value is -1200 to 1200, but we recommend setting it to [50](https://en.wikipedia.org/wiki/50_Cent).
	**/
	var detune : Float;
	/**
		Sets the detune value of this Sound, given in [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
		The range of the value is -1200 to 1200, but we recommend setting it to [50](https://en.wikipedia.org/wiki/50_Cent).
	**/
	function setDetune(value:Float):WebAudioSound;
	/**
		Boolean indicating whether the sound is muted or not.
		Gets or sets the muted state of this sound.
	**/
	var mute : Bool;
	/**
		Sets the muted state of this Sound.
	**/
	function setMute(value:Bool):WebAudioSound;
	/**
		Gets or sets the volume of this sound, a value between 0 (silence) and 1 (full volume).
	**/
	var volume : Float;
	/**
		Sets the volume of this Sound.
	**/
	function setVolume(value:Float):WebAudioSound;
	/**
		Property representing the position of playback for this sound, in seconds.
		Setting it to a specific value moves current playback to that position.
		The value given is clamped to the range 0 to current marker duration.
		Setting seek of a stopped sound has no effect.
	**/
	var seek : Float;
	/**
		Seeks to a specific point in this sound.
	**/
	function setSeek(value:Float):WebAudioSound;
	/**
		Flag indicating whether or not the sound or current sound marker will loop.
	**/
	var loop : Bool;
	/**
		Sets the loop state of this Sound.
	**/
	function setLoop(value:Bool):WebAudioSound;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSound;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSound;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSound;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebAudioSound;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebAudioSound;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):WebAudioSound;
	static var prototype : WebAudioSound;
}