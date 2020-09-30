package global.phaser;

typedef DeviceConf = {
	/**
		The OS Device functions.
	**/
	var os : global.phaser.device.OS;
	/**
		The Browser Device functions.
	**/
	var browser : global.phaser.device.Browser;
	/**
		The Features Device functions.
	**/
	var features : global.phaser.device.Features;
	/**
		The Input Device functions.
	**/
	var input : global.phaser.device.Input;
	/**
		The Audio Device functions.
	**/
	var audio : global.phaser.device.Audio;
	/**
		The Video Device functions.
	**/
	var video : global.phaser.device.Video;
	/**
		The Fullscreen Device functions.
	**/
	var fullscreen : global.phaser.device.Fullscreen;
	/**
		The Canvas Device functions.
	**/
	var canvasFeatures : global.phaser.device.CanvasFeatures;
};