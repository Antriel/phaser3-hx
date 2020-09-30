package global.phaser.types.loader.filetypes;

typedef AudioSpriteFileConfig = {
	/**
		The key of the file. Must be unique within both the Loader and the Audio Cache.
	**/
	var key : String;
	/**
		The absolute or relative URL to load the json file from. Or a well formed JSON object to use instead.
	**/
	var jsonURL : String;
	/**
		Extra XHR Settings specifically for the json file.
	**/
	@:optional
	var jsonXhrSettings : global.phaser.types.loader.XHRSettingsObject;
	/**
		The absolute or relative URL to load the audio file from.
	**/
	@:optional
	var audioURL : Dynamic;
	/**
		The audio configuration options.
	**/
	@:optional
	var audioConfig : Dynamic;
	/**
		Extra XHR Settings specifically for the audio file.
	**/
	@:optional
	var audioXhrSettings : global.phaser.types.loader.XHRSettingsObject;
};