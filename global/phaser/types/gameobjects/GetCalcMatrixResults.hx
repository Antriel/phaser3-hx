package global.phaser.types.gameobjects;

typedef GetCalcMatrixResults = {
	/**
		The calculated Camera matrix.
	**/
	var camera : global.phaser.gameobjects.components.TransformMatrix;
	/**
		The calculated Sprite (Game Object) matrix.
	**/
	var sprite : global.phaser.gameobjects.components.TransformMatrix;
	/**
		The calculated results matrix, factoring all others in.
	**/
	var calc : global.phaser.gameobjects.components.TransformMatrix;
};