package global.phaser.types.gameobjects.text;

/**
	A Text Padding configuration object as used by the Text Style.
**/
typedef TextPadding = {
	/**
		If set this value is used for both the left and right padding.
	**/
	@:optional
	var x : Float;
	/**
		If set this value is used for both the top and bottom padding.
	**/
	@:optional
	var y : Float;
	/**
		The amount of padding added to the left of the Text object.
	**/
	@:optional
	var left : Float;
	/**
		The amount of padding added to the right of the Text object.
	**/
	@:optional
	var right : Float;
	/**
		The amount of padding added to the top of the Text object.
	**/
	@:optional
	var top : Float;
	/**
		The amount of padding added to the bottom of the Text object.
	**/
	@:optional
	var bottom : Float;
};