package global.phaser.sound;

/**
	Base class for other Sound Manager classes.
**/
@:native("Phaser.Sound.BaseSoundManager") extern class BaseSoundManager extends global.phaser.events.EventEmitter {
	function new(game:global.phaser.Game);
	/**
		Local reference to game.
	**/
	final game : global.phaser.Game;
	/**
		Local reference to the JSON Cache, as used by Audio Sprites.
	**/
	final jsonCache : global.phaser.cache.BaseCache;
	/**
		Global mute setting.
	**/
	var mute : Bool;
	/**
		Global volume setting.
	**/
	var volume : Float;
	/**
		Flag indicating if sounds should be paused when game looses focus,
		for instance when user switches to another tab/program/app.
	**/
	var pauseOnBlur : Bool;
	/**
		Mobile devices require sounds to be triggered from an explicit user action,
		such as a tap, before any sound can be loaded/played on a web page.
		Set to true if the audio system is currently locked awaiting user interaction.
	**/
	final locked : Bool;
	/**
		Adds a new sound into the sound manager.
	**/
	function add(key:String, ?config:global.phaser.types.sound.SoundConfig):BaseSound;
	/**
		Adds a new audio sprite sound into the sound manager.
		Audio Sprites are a combination of audio files and a JSON configuration.
		The JSON follows the format of that created by https://github.com/tonistiigi/audiosprite
	**/
	function addAudioSprite(key:String, ?config:global.phaser.types.sound.SoundConfig):ts.AnyOf2<HTML5AudioSound, WebAudioSound>;
	/**
		Gets the first sound in the manager matching the given key, if any.
	**/
	function get(key:String):BaseSound;
	/**
		Gets any sounds in the manager matching the given key.
	**/
	function getAll(key:String):Array<BaseSound>;
	/**
		Adds a new sound to the sound manager and plays it.
		The sound will be automatically removed (destroyed) once playback ends.
		This lets you play a new sound on the fly without the need to keep a reference to it.
	**/
	function play(key:String, ?extra:ts.AnyOf2<global.phaser.types.sound.SoundConfig, global.phaser.types.sound.SoundMarker>):Bool;
	/**
		Adds a new audio sprite sound to the sound manager and plays it.
		The sprite will be automatically removed (destroyed) once playback ends.
		This lets you play a new sound on the fly without the need to keep a reference to it.
	**/
	function playAudioSprite(key:String, spriteName:String, ?config:global.phaser.types.sound.SoundConfig):Bool;
	/**
		Removes a sound from the sound manager.
		The removed sound is destroyed before removal.
	**/
	function remove(sound:BaseSound):Bool;
	/**
		Removes all sounds from the manager, destroying the sounds.
	**/
	function removeAll():Void;
	/**
		Removes all sounds from the sound manager that have an asset key matching the given value.
		The removed sounds are destroyed before removal.
	**/
	function removeByKey(key:String):Float;
	/**
		Pauses all the sounds in the game.
	**/
	function pauseAll():Void;
	/**
		Resumes all the sounds in the game.
	**/
	function resumeAll():Void;
	/**
		Stops all the sounds in the game.
	**/
	function stopAll():Void;
	/**
		Stops any sounds matching the given key.
	**/
	function stopByKey(key:String):Float;
	/**
		Method used internally for unlocking audio playback on devices that
		require user interaction before any sound can be played on a web page.
		
		Read more about how this issue is handled here in [this article](https://medium.com/@pgoloskokovic/unlocking-web-audio-the-smarter-way-8858218c0e09).
	**/
	private function unlock():Void;
	/**
		Method used internally for pausing sound manager if
		Phaser.Sound.BaseSoundManager#pauseOnBlur is set to true.
	**/
	private function onBlur():Void;
	/**
		Method used internally for resuming sound manager if
		Phaser.Sound.BaseSoundManager#pauseOnBlur is set to true.
	**/
	private function onFocus():Void;
	/**
		Update method called on every game step.
		Removes destroyed sounds and updates every active sound in the game.
	**/
	private function update(time:Float, delta:Float):Void;
	/**
		Sets the global playback rate at which all the sounds will be played.
		
		For example, a value of 1.0 plays the audio at full speed, 0.5 plays the audio at half speed
		and 2.0 doubles the audios playback speed.
	**/
	function setRate(value:Float):BaseSoundManager;
	/**
		Global playback rate at which all the sounds will be played.
		Value of 1.0 plays the audio at full speed, 0.5 plays the audio at half speed
		and 2.0 doubles the audio's playback speed.
	**/
	var rate : Float;
	/**
		Sets the global detuning of all sounds in [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
		The range of the value is -1200 to 1200, but we recommend setting it to [50](https://en.wikipedia.org/wiki/50_Cent).
	**/
	function setDetune(value:Float):BaseSoundManager;
	/**
		Global detuning of all sounds in [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
		The range of the value is -1200 to 1200, but we recommend setting it to [50](https://en.wikipedia.org/wiki/50_Cent).
	**/
	var detune : Float;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BaseSoundManager;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BaseSoundManager;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BaseSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):BaseSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):BaseSoundManager;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):BaseSoundManager;
	static var prototype : BaseSoundManager;
}