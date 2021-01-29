package global.phaser.types.geom.mesh;

typedef OBJFace = {
	/**
		The name of the Group this Face is in.
	**/
	var group : String;
	/**
		The name of the material this Face uses.
	**/
	var material : String;
	/**
		An array of vertices in this Face.
	**/
	var vertices : Array<OBJFaceVertice>;
};