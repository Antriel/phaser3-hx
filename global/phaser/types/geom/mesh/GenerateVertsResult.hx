package global.phaser.types.geom.mesh;

typedef GenerateVertsResult = {
	/**
		An array of Face objects generated from the OBJ Data.
	**/
	var faces : Array<global.phaser.geom.mesh.Face>;
	/**
		An array of Vertex objects generated from the OBJ Data.
	**/
	var vertices : Array<global.phaser.geom.mesh.Vertex>;
};