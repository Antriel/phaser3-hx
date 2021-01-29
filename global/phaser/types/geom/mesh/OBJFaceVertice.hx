package global.phaser.types.geom.mesh;

typedef OBJFaceVertice = {
	/**
		The index in the `textureCoords` array that this vertex uses.
	**/
	var textureCoordsIndex : Float;
	/**
		The index in the `vertices` array that this vertex uses.
	**/
	var vertexIndex : Float;
	/**
		The index in the `vertexNormals` array that this vertex uses.
	**/
	var vertexNormalIndex : Float;
};