package global.matterjs;

typedef IConstraintRenderDefinition = {
	/**
		A flag that indicates if the constraint should be rendered.
	**/
	@:optional
	var visible : Bool;
	/**
		The type of constraint.
	**/
	@:optional
	var type : String;
	/**
		A flag that indicates if the constraint anchors should be rendered.
	**/
	@:optional
	var anchors : Bool;
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
	/**
		The size of the pins during rendering.
	**/
	@:optional
	var pinSize : Float;
	/**
		A hex color value that defines the color to use when rendering the anchors.
	**/
	@:optional
	var anchorColor : Float;
	/**
		The size of the anchors during rendering.
	**/
	@:optional
	var anchorSize : Float;
};