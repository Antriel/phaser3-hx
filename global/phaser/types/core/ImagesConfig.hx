package global.phaser.types.core;

typedef ImagesConfig = {
	/**
		URL to use for the 'default' texture.
	**/
	@:optional
	@:native("default")
	var default_ : String;
	/**
		URL to use for the 'missing' texture.
	**/
	@:optional
	var missing : String;
};