package global.matterjs;

typedef IBodyRenderOptions = {
	/**
		A flag that indicates if the body should be rendered.
	**/
	@:optional
	var visible : Bool;
	/**
		Sets the opacity. 1.0 is fully opaque. 0.0 is fully translucent.
	**/
	@:optional
	var opacity : Float;
	/**
		An `Object` that defines the sprite properties to use when rendering, if any.
	**/
	@:optional
	var sprite : IBodyRenderOptionsSprite;
	/**
		A hex color value that defines the fill color to use when rendering the body.
	**/
	@:optional
	var fillColor : Float;
	/**
		A value that defines the fill opacity to use when rendering the body.
	**/
	@:optional
	var fillOpacity : Float;
	/**
		A hex color value that defines the line color to use when rendering the body.
	**/
	@:optional
	var lineColor : Float;
	/**
		A value that defines the line opacity to use when rendering the body.
	**/
	@:optional
	var lineOpacity : Float;
	/**
		A `Number` that defines the line width to use when rendering the body outline.
	**/
	@:optional
	var lineThickness : Float;
};