package global.phaser.types.curves;

typedef JSONCurve = {
	/**
		The of the curve
	**/
	var type : String;
	/**
		The arrays of points like `[x1, y1, x2, y2]`
	**/
	var points : Array<Float>;
};