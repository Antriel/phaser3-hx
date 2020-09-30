package global.phaser.device;

/**
	Determines the canvas features of the browser running this Phaser Game instance.
	These values are read-only and populated during the boot sequence of the game.
	They are then referenced by internal game systems and are available for you to access
	via `this.sys.game.device.canvasFeatures` from within any Scene.
**/
typedef CanvasFeatures = {
	/**
		Set to true if the browser supports inversed alpha.
	**/
	var supportInverseAlpha : Bool;
	/**
		Set to true if the browser supports new canvas blend modes.
	**/
	var supportNewBlendModes : Bool;
};