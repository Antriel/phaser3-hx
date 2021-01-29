package global.phaser.types.geom.mesh;

typedef OBJData = {
	/**
		An array of material library filenames found in the OBJ file.
	**/
	var materialLibraries : Array<String>;
	/**
		If the obj was loaded with an mtl file, the parsed material names are stored in this object.
	**/
	var materials : Dynamic;
	/**
		An array of parsed models extracted from the OBJ file.
	**/
	var models : Array<OBJModel>;
};