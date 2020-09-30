package global.phaser.utils;

@:native("Phaser.Utils.Base64") @valueModuleOnly extern class Base64 {
	/**
		Converts an ArrayBuffer into a base64 string.
		
		The resulting string can optionally be a data uri if the `mediaType` argument is provided.
		
		See https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URIs for more details.
	**/
	static function ArrayBufferToBase64(arrayBuffer:js.lib.ArrayBuffer, ?mediaType:String):String;
	/**
		Converts a base64 string, either with or without a data uri, into an Array Buffer.
	**/
	static function Base64ToArrayBuffer(base64:String):js.lib.ArrayBuffer;
}