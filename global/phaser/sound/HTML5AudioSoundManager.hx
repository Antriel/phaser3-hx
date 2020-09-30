package global.phaser.sound;

/**
	HTML5AudioSoundManager
**/
@:native("Phaser.Sound.HTML5AudioSoundManager") extern class HTML5AudioSoundManager extends BaseSoundManager {
	function new(game:global.phaser.Game);
	/**
		Flag indicating whether if there are no idle instances of HTML5 Audio tag,
		for any particular sound, if one of the used tags should be hijacked and used
		for succeeding playback or if succeeding Phaser.Sound.HTML5AudioSound#play
		call should be ignored.
	**/
	@:native("override")
	var override_ : Bool;
	/**
		Value representing time difference, in seconds, between calling
		play method on an audio tag and when it actually starts playing.
		It is used to achieve more accurate delayed sound playback.
		
		You might need to tweak this value to get the desired results
		since audio play delay varies depending on the browser/platform.
	**/
	var audioPlayDelay : Float;
	/**
		A value by which we should offset the loop end marker of the
		looping sound to compensate for lag, caused by changing audio
		tag playback position, in order to achieve gapless looping.
		
		You might need to tweak this value to get the desired results
		since loop lag varies depending on the browser/platform.
	**/
	var loopEndOffset : Float;
	/**
		Adds a new sound into the sound manager.
	**/
	function add(key:String, ?config:global.phaser.types.sound.SoundConfig):HTML5AudioSound;
	/**
		Method used internally by Phaser.Sound.HTML5AudioSound class methods and property setters
		to check if sound manager is locked and then either perform action immediately or queue it
		to be performed once the sound manager gets unlocked.
	**/
	private function isLocked(sound:HTML5AudioSound, prop:String, ?value:Dynamic):Bool;
	/**
		Sets the muted state of all this Sound Manager.
	**/
	function setMute(value:Bool):HTML5AudioSoundManager;
	/**
		Sets the volume of this Sound Manager.
	**/
	function setVolume(value:Float):HTML5AudioSoundManager;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):HTML5AudioSoundManager;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):HTML5AudioSoundManager;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):HTML5AudioSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):HTML5AudioSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):HTML5AudioSoundManager;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):HTML5AudioSoundManager;
	static var prototype : HTML5AudioSoundManager;
}