package global.phaser.sound;

/**
	Web Audio API implementation of the Sound Manager.
	
	Not all browsers can play all audio formats.
	
	There is a good guide to what's supported: [Cross-browser audio basics: Audio codec support](https://developer.mozilla.org/en-US/Apps/Fundamentals/Audio_and_video_delivery/Cross-browser_audio_basics#Audio_Codec_Support).
**/
@:native("Phaser.Sound.WebAudioSoundManager") extern class WebAudioSoundManager extends BaseSoundManager {
	function new(game:global.phaser.Game);
	/**
		This method takes a new AudioContext reference and then sets
		this Sound Manager to use that context for all playback.
		
		As part of this call it also disconnects the master mute and volume
		nodes and then re-creates them on the new given context.
	**/
	function setAudioContext(context:js.html.audio.AudioContext):WebAudioSoundManager;
	/**
		Adds a new sound into the sound manager.
	**/
	function add(key:String, ?config:global.phaser.types.sound.SoundConfig):WebAudioSound;
	/**
		Decode audio data into a format ready for playback via Web Audio.
		
		The audio data can be a base64 encoded string, an audio media-type data uri, or an ArrayBuffer instance.
		
		The `audioKey` is the key that will be used to save the decoded audio to the audio cache.
		
		Instead of passing a single entry you can instead pass an array of `Phaser.Types.Sound.DecodeAudioConfig`
		objects as the first and only argument.
		
		Decoding is an async process, so be sure to listen for the events to know when decoding has completed.
		
		Once the audio has decoded it can be added to the Sound Manager or played via its key.
	**/
	function decodeAudio(?audioKey:ts.AnyOf2<String, Array<global.phaser.types.sound.DecodeAudioConfig>>, ?audioData:ts.AnyOf2<String, js.lib.ArrayBuffer>):Void;
	/**
		Sets the muted state of all this Sound Manager.
	**/
	function setMute(value:Bool):WebAudioSoundManager;
	/**
		Sets the volume of this Sound Manager.
	**/
	function setVolume(value:Float):WebAudioSoundManager;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSoundManager;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSoundManager;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebAudioSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebAudioSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebAudioSoundManager;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):WebAudioSoundManager;
	static var prototype : WebAudioSoundManager;
}