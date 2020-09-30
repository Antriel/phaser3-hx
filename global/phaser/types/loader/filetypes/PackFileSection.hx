package global.phaser.types.loader.filetypes;

typedef PackFileSection = {
	/**
		The files to load. See {@link Phaser.Types.Loader.FileTypes}.
	**/
	var files : Array<global.phaser.types.loader.FileConfig>;
	/**
		A URL used to resolve paths in `files`. Example: 'http://labs.phaser.io/assets/'.
	**/
	@:optional
	var baseURL : String;
	/**
		The default {@link Phaser.Types.Loader.FileConfig} `type`.
	**/
	@:optional
	var defaultType : String;
	/**
		A URL path used to resolve relative paths in `files`. Example: 'images/sprites/'.
	**/
	@:optional
	var path : String;
	/**
		An optional prefix that is automatically prepended to each file key.
	**/
	@:optional
	var prefix : String;
};