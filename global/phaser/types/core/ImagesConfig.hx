package global.phaser.types.core;

typedef ImagesConfig = {
	/**
		A base64 encoded image file to use as the 'default' texture.
	**/
	@:optional
	@:native("default")
	var default_ : String;
	/**
		A base64 encoded image file to use as the 'missing' texture.
	**/
	@:optional
	var missing : String;
	/**
		A base64 encoded image file to use as the 'white' texture.
	**/
	@:optional
	var white : String;
};