package global.phaser.types.geom.mesh;

typedef GenerateGridConfig = {
	/**
		The texture to be used for this Grid. Must be a Texture instance. Can also be a string but only if the `mesh` property is set.
	**/
	var texture : ts.AnyOf2<String, global.phaser.textures.Texture>;
	/**
		The name or index of the frame within the Texture.
	**/
	@:optional
	var frame : ts.AnyOf2<String, Float>;
	/**
		If specified, the vertices of the generated grid will be added to this Mesh Game Object.
	**/
	@:optional
	var mesh : global.phaser.gameobjects.Mesh;
	/**
		The width of the grid in 3D units. If you wish to get a pixel accurate grid based on a texture, you can use an Ortho Mesh or the `isOrtho` parameter.
	**/
	@:optional
	var width : Float;
	/**
		The height of the grid in 3D units.
	**/
	@:optional
	var height : Float;
	/**
		The number of segments to split the grid horizontally in to.
	**/
	@:optional
	var widthSegments : Float;
	/**
		The number of segments to split the grid vertically in to.
	**/
	@:optional
	var heightSegments : Float;
	/**
		Offset the grid x position by this amount.
	**/
	@:optional
	var x : Float;
	/**
		Offset the grid y position by this amount.
	**/
	@:optional
	var y : Float;
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
	/**
		Should the texture tile (repeat) across the grid segments, or display as a single texture?
	**/
	@:optional
	var tile : Bool;
	/**
		If set and using a texture with an ortho Mesh, the `width` and `height` parameters will be calculated based on the frame size for you.
	**/
	@:optional
	var isOrtho : Bool;
	/**
		If set and using a texture, vertically flipping render result.
	**/
	@:optional
	var flipY : Bool;
};