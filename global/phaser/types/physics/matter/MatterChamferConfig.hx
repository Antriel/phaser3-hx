package global.phaser.types.physics.matter;

typedef MatterChamferConfig = {
	/**
		A single number, or an array, to specify the radius for each vertex.
	**/
	@:optional
	var radius : ts.AnyOf2<Float, Array<Float>>;
	/**
		The quality of the chamfering. -1 means 'auto'.
	**/
	@:optional
	var quality : Float;
	/**
		The minimum quality of the chamfering. The higher this value, the more vertices are created.
	**/
	@:optional
	var qualityMin : Float;
	/**
		The maximum quality of the chamfering. The higher this value, the more vertices are created.
	**/
	@:optional
	var qualityMax : Float;
};