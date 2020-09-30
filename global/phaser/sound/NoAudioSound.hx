package global.phaser.sound;

/**
	No audio implementation of the sound. It is used if audio has been
	disabled in the game config or the device doesn't support any audio.
	
	It represents a graceful degradation of sound logic that provides
	minimal functionality and prevents Phaser projects that use audio from
	breaking on devices that don't support any audio playback technologies.
**/
@:native("Phaser.Sound.NoAudioSound") extern class NoAudioSound {
	function new(manager:NoAudioSoundManager, key:String, ?config:global.phaser.types.sound.SoundConfig);
	function addMarker(marker:global.phaser.types.sound.SoundMarker):Bool;
	function updateMarker(marker:global.phaser.types.sound.SoundMarker):Bool;
	function removeMarker(markerName:String):Dynamic;
	function play(?markerName:ts.AnyOf2<String, global.phaser.types.sound.SoundConfig>, ?config:global.phaser.types.sound.SoundConfig):Bool;
	function pause():Bool;
	/**
		Resumes the sound.
	**/
	function resume():Bool;
	/**
		Stop playing this sound.
	**/
	function stop():Bool;
	/**
		Destroys this sound and all associated events and marks it for removal from the sound manager.
	**/
	function destroy():Void;
	static var prototype : NoAudioSound;
}