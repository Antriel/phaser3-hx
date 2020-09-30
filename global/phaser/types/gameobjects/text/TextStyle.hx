package global.phaser.types.gameobjects.text;

/**
	A Text Style configuration object as used by the Text Game Object.
**/
typedef TextStyle = {
	/**
		The font the Text object will render with. This is a Canvas style font string.
	**/
	@:optional
	var fontFamily : String;
	/**
		The font size, as a CSS size string.
	**/
	@:optional
	var fontSize : String;
	/**
		Any addition font styles, such as 'strong'.
	**/
	@:optional
	var fontStyle : String;
	/**
		A solid fill color that is rendered behind the Text object. Given as a CSS string color such as `#ff0`.
	**/
	@:optional
	var backgroundColor : String;
	/**
		The color the Text is drawn in. Given as a CSS string color such as `#fff` or `rgb()`.
	**/
	@:optional
	var color : String;
	/**
		The color used to stroke the Text if the `strokeThickness` property is greater than zero.
	**/
	@:optional
	var stroke : String;
	/**
		The thickness of the stroke around the Text. Set to zero for no stroke.
	**/
	@:optional
	var strokeThickness : Float;
	/**
		The Text shadow configuration object.
	**/
	@:optional
	var shadow : TextShadow;
	/**
		A Text Padding object.
	**/
	@:optional
	var padding : TextPadding;
	/**
		The alignment of the Text. This only impacts multi-line text. Either `left`, `right`, `center` or `justify`.
	**/
	@:optional
	var align : String;
	/**
		The maximum number of lines to display within the Text object.
	**/
	@:optional
	var maxLines : Float;
	/**
		Force the Text object to have the exact width specified in this property. Leave as zero for it to change accordingly to content.
	**/
	@:optional
	var fixedWidth : Float;
	/**
		Force the Text object to have the exact height specified in this property. Leave as zero for it to change accordingly to content.
	**/
	@:optional
	var fixedHeight : Float;
	/**
		Sets the resolution (DPI setting) of the Text object. Leave at zero for it to use the game resolution.
	**/
	@:optional
	var resolution : Float;
	/**
		Set to `true` if this Text object should render from right-to-left.
	**/
	@:optional
	var rtl : Bool;
	/**
		This is the string used to aid Canvas in calculating the height of the font.
	**/
	@:optional
	var testString : String;
	/**
		The amount of horizontal padding added to the width of the text when calculating the font metrics.
	**/
	@:optional
	var baselineX : Float;
	/**
		The amount of vertical padding added to the height of the text when calculating the font metrics.
	**/
	@:optional
	var baselineY : Float;
	/**
		The Text Word wrap configuration object.
	**/
	@:optional
	var wordWrap : TextWordWrap;
	/**
		A Text Metrics object. Use this to avoid expensive font size calculations in text heavy games.
	**/
	@:optional
	var metrics : TextMetrics;
};