package global.phaser.types.curves;

typedef JSONEllipseCurve = {
	/**
		The of the curve.
	**/
	var type : String;
	/**
		The x coordinate of the ellipse.
	**/
	var x : Float;
	/**
		The y coordinate of the ellipse.
	**/
	var y : Float;
	/**
		The horizontal radius of ellipse.
	**/
	var xRadius : Float;
	/**
		The vertical radius of ellipse.
	**/
	var yRadius : Float;
	/**
		The start angle of the ellipse, in degrees.
	**/
	var startAngle : Float;
	/**
		The end angle of the ellipse, in degrees.
	**/
	var endAngle : Float;
	/**
		Sets if the the ellipse rotation is clockwise (true) or anti-clockwise (false)
	**/
	var clockwise : Bool;
	/**
		The rotation of ellipse, in degrees.
	**/
	var rotation : Float;
};