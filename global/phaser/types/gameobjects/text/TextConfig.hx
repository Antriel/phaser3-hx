package global.phaser.types.gameobjects.text;

typedef TextConfig = global.phaser.types.gameobjects.GameObjectConfig & {
	/**
		The text this Text object will display.
	**/
	@:optional
	var text : ts.AnyOf2<String, Array<String>>;
	/**
		The Text style configuration object.
	**/
	@:optional
	var style : TextStyle;
	/**
		A Text Padding object.
	**/
	@:optional
	var padding : TextPadding;
};