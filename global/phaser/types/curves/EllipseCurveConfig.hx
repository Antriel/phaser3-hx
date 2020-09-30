package global.phaser.types.curves;

typedef EllipseCurveConfig = {
	/**
		The x coordinate of the ellipse.
	**/
	@:optional
	var x : Float;
	/**
		The y coordinate of the ellipse.
	**/
	@:optional
	var y : Float;
	/**
		The horizontal radius of the ellipse.
	**/
	@:optional
	var xRadius : Float;
	/**
		The vertical radius of the ellipse.
	**/
	@:optional
	var yRadius : Float;
	/**
		The start angle of the ellipse, in degrees.
	**/
	@:optional
	var startAngle : Float;
	/**
		The end angle of the ellipse, in degrees.
	**/
	@:optional
	var endAngle : Float;
	/**
		Sets if the the ellipse rotation is clockwise (true) or anti-clockwise (false)
	**/
	@:optional
	var clockwise : Bool;
	/**
		The rotation of the ellipse, in degrees.
	**/
	@:optional
	var rotation : Float;
};