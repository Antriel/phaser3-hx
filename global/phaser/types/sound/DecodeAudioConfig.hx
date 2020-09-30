package global.phaser.types.sound;

/**
	A Audio Data object.
	
	You can pass an array of these objects to the WebAudioSoundManager `decodeAudio` method to have it decode
	them all at once.
**/
typedef DecodeAudioConfig = {
	/**
		The string-based key to be used to reference the decoded audio in the audio cache.
	**/
	var key : String;
	/**
		The audio data, either a base64 encoded string, an audio media-type data uri, or an ArrayBuffer instance.
	**/
	var data : ts.AnyOf2<String, js.lib.ArrayBuffer>;
};