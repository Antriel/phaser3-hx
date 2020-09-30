package global.phaser.types.physics.matter;

typedef MatterBodyRenderConfig = {
	/**
		Should this body be rendered by the Debug Renderer?
	**/
	@:optional
	var visible : Bool;
	/**
		The opacity of the body and all parts within it.
	**/
	@:optional
	var opacity : Float;
	/**
		The color value of the fill when rendering this body.
	**/
	@:optional
	var fillColor : Float;
	/**
		The opacity of the fill when rendering this body, a value between 0 and 1.
	**/
	@:optional
	var fillOpacity : Float;
	/**
		The color value of the line stroke when rendering this body.
	**/
	@:optional
	var lineColor : Float;
	/**
		The opacity of the line when rendering this body, a value between 0 and 1.
	**/
	@:optional
	var lineOpacity : Float;
	/**
		If rendering lines, the thickness of the line.
	**/
	@:optional
	var lineThickness : Float;
	/**
		Controls the offset between the body and the parent Game Object, if it has one.
	**/
	@:optional
	var sprite : Dynamic;
	/**
		The horizontal offset between the body and the parent Game Object texture, if it has one.
	**/
	@:optional
	@:native("sprite.xOffset")
	var sprite_xOffset : Float;
	/**
		The vertical offset between the body and the parent Game Object texture, if it has one.
	**/
	@:optional
	@:native("sprite.yOffset")
	var sprite_yOffset : Float;
};