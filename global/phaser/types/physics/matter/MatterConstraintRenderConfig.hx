package global.phaser.types.physics.matter;

typedef MatterConstraintRenderConfig = {
	/**
		Should this constraint be rendered by the Debug Renderer?
	**/
	@:optional
	var visible : Bool;
	/**
		If this constraint has anchors, should they be rendered? Pin constraints never have anchors.
	**/
	@:optional
	var anchors : Bool;
	/**
		The color value of the line stroke when rendering this constraint.
	**/
	@:optional
	var lineColor : Float;
	/**
		The opacity of the line when rendering this constraint, a value between 0 and 1.
	**/
	@:optional
	var lineOpacity : Float;
	/**
		If rendering lines, the thickness of the line.
	**/
	@:optional
	var lineThickness : Float;
	/**
		The size of the circles drawn when rendering pin constraints.
	**/
	@:optional
	var pinSize : Float;
	/**
		The size of the circles drawn as the constraint anchors.
	**/
	@:optional
	var anchorSize : Float;
	/**
		The color value of constraint anchors.
	**/
	@:optional
	var anchorColor : Float;
};