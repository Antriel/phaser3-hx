package global.phaser.types.geom.mesh;

typedef GenerateGridVertsResult = {
	/**
		An array of vertex values in x, y pairs.
	**/
	var verts : Array<Float>;
	/**
		An array of vertex indexes. This array will be empty if the `tile` parameter was `true`.
	**/
	var indices : Array<Float>;
	/**
		An array of UV values, two per vertex.
	**/
	var uvs : Array<Float>;
	/**
		An array of colors, one per vertex, or a single color value applied to all vertices.
	**/
	@:optional
	var colors : ts.AnyOf2<Float, Array<Float>>;
	/**
		An array of alpha values, one per vertex, or a single alpha value applied to all vertices.
	**/
	@:optional
	var alphas : ts.AnyOf2<Float, Array<Float>>;
};