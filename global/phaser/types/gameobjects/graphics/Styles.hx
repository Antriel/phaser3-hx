package global.phaser.types.gameobjects.graphics;

/**
	Graphics style settings.
**/
typedef Styles = {
	/**
		The style applied to shape outlines.
	**/
	@:optional
	var lineStyle : LineStyle;
	/**
		The style applied to shape areas.
	**/
	@:optional
	var fillStyle : FillStyle;
};