package global.phaser.types.gameobjects.graphics;

/**
	Graphics line style (or stroke style) settings.
**/
typedef LineStyle = {
	/**
		The stroke width.
	**/
	@:optional
	var width : Float;
	/**
		The stroke color.
	**/
	@:optional
	var color : Float;
	/**
		The stroke alpha.
	**/
	@:optional
	var alpha : Float;
};