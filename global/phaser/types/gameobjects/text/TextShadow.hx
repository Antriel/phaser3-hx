package global.phaser.types.gameobjects.text;

/**
	A Text Shadow configuration object as used by the Text Style.
**/
typedef TextShadow = {
	/**
		The horizontal offset of the shadow.
	**/
	@:optional
	var offsetX : Float;
	/**
		The vertical offset of the shadow.
	**/
	@:optional
	var offsetY : Float;
	/**
		The color of the shadow, given as a CSS string value.
	**/
	@:optional
	var color : String;
	/**
		The amount of blur applied to the shadow. Leave as zero for a hard shadow.
	**/
	@:optional
	var blur : Float;
	/**
		Apply the shadow to the stroke effect on the Text object?
	**/
	@:optional
	var stroke : Bool;
	/**
		Apply the shadow to the fill effect on the Text object?
	**/
	@:optional
	var fill : Bool;
};