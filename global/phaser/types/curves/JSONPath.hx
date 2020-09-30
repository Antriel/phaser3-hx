package global.phaser.types.curves;

typedef JSONPath = {
	/**
		The of the curve.
	**/
	var type : String;
	/**
		The X coordinate of the curve's starting point.
	**/
	var x : Float;
	/**
		The Y coordinate of the path's starting point.
	**/
	var y : Float;
	/**
		The path is auto closed.
	**/
	var autoClose : Bool;
	/**
		The list of the curves
	**/
	var curves : Array<JSONCurve>;
};