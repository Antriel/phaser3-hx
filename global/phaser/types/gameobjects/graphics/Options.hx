package global.phaser.types.gameobjects.graphics;

/**
	Options for the Graphics Game Object.
**/
typedef Options = Styles & {
	/**
		The x coordinate of the Graphics.
	**/
	@:optional
	var x : Float;
	/**
		The y coordinate of the Graphics.
	**/
	@:optional
	var y : Float;
};