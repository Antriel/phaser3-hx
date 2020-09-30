package global.phaser.gameobjects;

/**
	A TextStyle class manages all of the style settings for a Text object.
	
	Text Game Objects create a TextStyle instance automatically, which is
	accessed via the `Text.style` property. You do not normally need to
	instantiate one yourself.
**/
@:native("Phaser.GameObjects.TextStyle") extern class TextStyle {
	function new(text:Text, style:global.phaser.types.gameobjects.text.TextStyle);
	/**
		The Text object that this TextStyle is styling.
	**/
	var parent : Text;
	/**
		The font family.
	**/
	var fontFamily : String;
	/**
		The font size.
	**/
	var fontSize : String;
	/**
		The font style.
	**/
	var fontStyle : String;
	/**
		The background color.
	**/
	var backgroundColor : String;
	/**
		The text fill color.
	**/
	var color : String;
	/**
		The text stroke color.
	**/
	var stroke : String;
	/**
		The text stroke thickness.
	**/
	var strokeThickness : Float;
	/**
		The horizontal shadow offset.
	**/
	var shadowOffsetX : Float;
	/**
		The vertical shadow offset.
	**/
	var shadowOffsetY : Float;
	/**
		The shadow color.
	**/
	var shadowColor : String;
	/**
		The shadow blur radius.
	**/
	var shadowBlur : Float;
	/**
		Whether shadow stroke is enabled or not.
	**/
	var shadowStroke : Bool;
	/**
		Whether shadow fill is enabled or not.
	**/
	var shadowFill : Bool;
	/**
		The text alignment.
	**/
	var align : String;
	/**
		The maximum number of lines to draw.
	**/
	var maxLines : Float;
	/**
		The fixed width of the text.
		
		`0` means no fixed with.
	**/
	var fixedWidth : Float;
	/**
		The fixed height of the text.
		
		`0` means no fixed height.
	**/
	var fixedHeight : Float;
	/**
		The resolution the text is rendered to its internal canvas at.
		The default is 0, which means it will use the resolution set in the Game Config.
	**/
	var resolution : Float;
	/**
		Whether the text should render right to left.
	**/
	var rtl : Bool;
	/**
		The test string to use when measuring the font.
	**/
	var testString : String;
	/**
		The amount of horizontal padding added to the width of the text when calculating the font metrics.
	**/
	var baselineX : Float;
	/**
		The amount of vertical padding added to the height of the text when calculating the font metrics.
	**/
	var baselineY : Float;
	/**
		The maximum width of a line of text in pixels. Null means no line wrapping. Setting this
		property directly will not re-run the word wrapping algorithm. To change the width and
		re-wrap, use {@link Phaser.GameObjects.TextStyle#setWordWrapWidth}.
	**/
	var wordWrapWidth : Null<Float>;
	/**
		A custom function that will be responsible for wrapping the text. It will receive two
		arguments: text (the string to wrap), textObject (this Text instance). It should return
		the wrapped lines either as an array of lines or as a string with newline characters in
		place to indicate where breaks should happen. Setting this directly will not re-run the
		word wrapping algorithm. To change the callback and re-wrap, use
		{@link Phaser.GameObjects.TextStyle#setWordWrapCallback}.
	**/
	@:optional
	dynamic function wordWrapCallback(text:String, textObject:Text):Void;
	/**
		The scope that will be applied when the wordWrapCallback is invoked. Setting this directly will not re-run the
		word wrapping algorithm. To change the callback and re-wrap, use
		{@link Phaser.GameObjects.TextStyle#setWordWrapCallback}.
	**/
	var wordWrapCallbackScope : Null<Dynamic>;
	/**
		Whether or not to use the advanced wrapping algorithm. If true, spaces are collapsed and
		whitespace is trimmed from lines. If false, spaces and whitespace are left as is. Setting
		this property directly will not re-run the word wrapping algorithm. To change the
		advanced setting and re-wrap, use {@link Phaser.GameObjects.TextStyle#setWordWrapWidth}.
	**/
	var wordWrapUseAdvanced : Bool;
	/**
		Set the text style.
	**/
	function setStyle(style:global.phaser.types.gameobjects.text.TextStyle, ?updateText:Bool, ?setDefaults:Bool):Text;
	/**
		Synchronize the font settings to the given Canvas Rendering Context.
	**/
	function syncFont(canvas:js.html.CanvasElement, context:js.html.CanvasRenderingContext2D):Void;
	/**
		Synchronize the text style settings to the given Canvas Rendering Context.
	**/
	function syncStyle(canvas:js.html.CanvasElement, context:js.html.CanvasRenderingContext2D):Void;
	/**
		Synchronize the shadow settings to the given Canvas Rendering Context.
	**/
	function syncShadow(context:js.html.CanvasRenderingContext2D, enabled:Bool):Void;
	/**
		Update the style settings for the parent Text object.
	**/
	function update(recalculateMetrics:Bool):Text;
	/**
		Set the font.
		
		If a string is given, the font family is set.
		
		If an object is given, the `fontFamily`, `fontSize` and `fontStyle`
		properties of that object are set.
	**/
	function setFont(font:ts.AnyOf2<String, Dynamic>, ?updateText:Bool):Text;
	/**
		Set the font family.
	**/
	function setFontFamily(family:String):Text;
	/**
		Set the font style.
	**/
	function setFontStyle(style:String):Text;
	/**
		Set the font size.
	**/
	function setFontSize(size:ts.AnyOf2<String, Float>):Text;
	/**
		Set the test string to use when measuring the font.
	**/
	function setTestString(string:String):Text;
	/**
		Set a fixed width and height for the text.
		
		Pass in `0` for either of these parameters to disable fixed width or height respectively.
	**/
	function setFixedSize(width:Float, height:Float):Text;
	/**
		Set the background color.
	**/
	function setBackgroundColor(color:String):Text;
	/**
		Set the text fill color.
	**/
	function setFill(color:String):Text;
	/**
		Set the text fill color.
	**/
	function setColor(color:String):Text;
	/**
		Set the resolution used by the Text object.
		
		By default it will be set to match the resolution set in the Game Config,
		but you can override it via this method. It allows for much clearer text on High DPI devices,
		at the cost of memory because it uses larger internal Canvas textures for the Text.
		
		Please use with caution, as the more high res Text you have, the more memory it uses up.
	**/
	function setResolution(value:Float):Text;
	/**
		Set the stroke settings.
	**/
	function setStroke(color:String, thickness:Float):Text;
	/**
		Set the shadow settings.
		
		Calling this method always re-measures the parent Text object,
		so only call it when you actually change the shadow settings.
	**/
	function setShadow(?x:Float, ?y:Float, ?color:String, ?blur:Float, ?shadowStroke:Bool, ?shadowFill:Bool):Text;
	/**
		Set the shadow offset.
	**/
	function setShadowOffset(?x:Float, ?y:Float):Text;
	/**
		Set the shadow color.
	**/
	function setShadowColor(?color:String):Text;
	/**
		Set the shadow blur radius.
	**/
	function setShadowBlur(?blur:Float):Text;
	/**
		Enable or disable shadow stroke.
	**/
	function setShadowStroke(enabled:Bool):Text;
	/**
		Enable or disable shadow fill.
	**/
	function setShadowFill(enabled:Bool):Text;
	/**
		Set the width (in pixels) to use for wrapping lines.
		
		Pass in null to remove wrapping by width.
	**/
	function setWordWrapWidth(width:Float, ?useAdvancedWrap:Bool):Text;
	/**
		Set a custom callback for wrapping lines.
		
		Pass in null to remove wrapping by callback.
	**/
	function setWordWrapCallback(callback:global.TextStyleWordWrapCallback, ?scope:Dynamic):Text;
	/**
		Set the alignment of the text in this Text object.
		
		The argument can be one of: `left`, `right`, `center` or `justify`.
		
		Alignment only works if the Text object has more than one line of text.
	**/
	function setAlign(?align:String):Text;
	/**
		Set the maximum number of lines to draw.
	**/
	function setMaxLines(?max:Float):Text;
	/**
		Get the current text metrics.
	**/
	function getTextMetrics():global.phaser.types.gameobjects.text.TextMetrics;
	/**
		Build a JSON representation of this Text Style.
	**/
	function toJSON():Dynamic;
	/**
		Destroy this Text Style.
	**/
	function destroy():Void;
	static var prototype : TextStyle;
}