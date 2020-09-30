package global.phaser.sound;

/**
	No-audio implementation of the Sound Manager. It is used if audio has been
	disabled in the game config or the device doesn't support any audio.
	
	It represents a graceful degradation of Sound Manager logic that provides
	minimal functionality and prevents Phaser projects that use audio from
	breaking on devices that don't support any audio playback technologies.
**/
@:native("Phaser.Sound.NoAudioSoundManager") extern class NoAudioSoundManager extends BaseSoundManager {
	function new(game:global.phaser.Game);
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NoAudioSoundManager;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NoAudioSoundManager;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):NoAudioSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):NoAudioSoundManager;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):NoAudioSoundManager;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):NoAudioSoundManager;
	static var prototype : NoAudioSoundManager;
}