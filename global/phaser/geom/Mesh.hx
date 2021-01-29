package global.phaser.geom;

@:native("Phaser.Geom.Mesh") @valueModuleOnly extern class Mesh {
	/**
		Creates a grid of vertices based on the given configuration object and optionally adds it to a Mesh.
		
		The size of the grid is given in pixels. An example configuration may be:
		
		`{ width: 256, height: 256, widthSegments: 2, heightSegments: 2, tile: true }`
		
		This will create a grid 256 x 256 pixels in size, split into 2 x 2 segments, with
		the texture tiling across the cells.
		
		You can split the grid into segments both vertically and horizontally. This will
		generate two faces per grid segment as a result.
		
		The `tile` parameter allows you to control if the tile will repeat across the grid
		segments, or be displayed in full.
		
		If adding this grid to a Mesh you can offset the grid via the `x` and `y` properties.
		
		UV coordinates are generated based on the given texture and frame in the config. For
		example, no frame is given, the UVs will be in the range 0 to 1. If a frame is given,
		such as from a texture atlas, the UVs will be generated within the range of that frame.
	**/
	static function GenerateGridVerts(config:global.phaser.types.geom.mesh.GenerateGridConfig):global.phaser.types.geom.mesh.GenerateGridVertsResult;
	/**
		This method will return an object containing Face and Vertex instances, generated
		from the parsed triangulated OBJ Model data given to this function.
		
		The obj data should have been parsed in advance via the ParseObj function:
		
		```javascript
		var data = Phaser.Geom.Mesh.ParseObj(rawData, flipUV);
		
		var results = GenerateObjVerts(data);
		```
		
		Alternatively, you can parse obj files loaded via the OBJFile loader:
		
		```javascript
		preload ()
		{
		   this.load.obj('alien', 'assets/3d/alien.obj);
		}
		
		var results = GenerateObjVerts(this.cache.obj.get('alien));
		```
		
		Make sure your 3D package has triangulated the model data prior to exporting it.
		
		You can use the data returned by this function to populate the vertices of a Mesh Game Object.
		
		You may add multiple models to a single Mesh, although they will act as one when
		moved or rotated. You can scale the model data, should it be too small (or large) to visualize.
		You can also offset the model via the `x`, `y` and `z` parameters.
	**/
	static function GenerateObjVerts(data:global.phaser.types.geom.mesh.OBJData, ?mesh:global.phaser.gameobjects.Mesh, ?scale:Float, ?x:Float, ?y:Float, ?z:Float, ?rotateX:Float, ?rotateY:Float, ?rotateZ:Float, ?zIsUp:Bool):global.phaser.types.geom.mesh.GenerateVertsResult;
	/**
		Generates a set of Face and Vertex objects by parsing the given data.
		
		This method will take vertex data in one of two formats, based on the `containsZ` parameter.
		
		If your vertex data are `x`, `y` pairs, then `containsZ` should be `false` (this is the default)
		
		If your vertex data is groups of `x`, `y` and `z` values, then the `containsZ` parameter must be true.
		
		The `uvs` parameter is a numeric array consisting of `u` and `v` pairs.
		
		The `normals` parameter is a numeric array consisting of `x`, `y` vertex normal values and, if `containsZ` is true, `z` values as well.
		
		The `indicies` parameter is an optional array that, if given, is an indexed list of vertices to be added.
		
		The `colors` parameter is an optional array, or single value, that if given sets the color of each vertex created.
		
		The `alphas` parameter is an optional array, or single value, that if given sets the alpha of each vertex created.
		
		When providing indexed data it is assumed that _all_ of the arrays are indexed, not just the vertices.
		
		The following example will create a 256 x 256 sized quad using an index array:
		
		```javascript
		const vertices = [
		   -128, 128,
		   128, 128,
		   -128, -128,
		   128, -128
		];
		
		const uvs = [
		   0, 1,
		   1, 1,
		   0, 0,
		   1, 0
		];
		
		const indices = [ 0, 2, 1, 2, 3, 1 ];
		
		GenerateVerts(vertices, uvs, indicies);
		```
		
		If the data is not indexed, it's assumed that the arrays all contain sequential data.
	**/
	static function GenerateVerts(vertices:Array<Float>, uvs:Array<Float>, ?indicies:Array<Float>, ?containsZ:Bool, ?normals:Array<Float>, ?colors:ts.AnyOf2<Float, Array<Float>>, ?alphas:ts.AnyOf2<Float, Array<Float>>):global.phaser.types.geom.mesh.GenerateVertsResult;
	/**
		Parses a Wavefront OBJ File, extracting the models from it and returning them in an array.
		
		The model data *must* be triangulated for a Mesh Game Object to be able to render it.
	**/
	static function ParseObj(data:String, ?flipUV:Bool):global.phaser.types.geom.mesh.OBJData;
	/**
		Takes a Wavefront Material file and extracts the diffuse reflectivity of the named
		materials, converts them to integer color values and returns them.
		
		This is used internally by the `addOBJ` and `addModel` methods, but is exposed for
		public consumption as well.
		
		Note this only works with diffuse values, specified in the `Kd r g b` format, where
		`g` and `b` are optional, but `r` is required. It does not support spectral rfl files,
		or any other material statement (such as `Ka` or `Ks`)
	**/
	static function ParseObjMaterial(mtl:String):Dynamic;
	/**
		Rotates the vertices of a Face to the given angle.
		
		The actual vertex positions are adjusted, not their transformed positions.
		
		Therefore, this updates the vertex data directly.
	**/
	static function RotateFace(face:global.phaser.geom.mesh.Face, angle:Float, ?cx:Float, ?cy:Float):Void;
}