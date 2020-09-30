package global.phaser.types.tilemaps;

typedef MapDataConfig = {
	/**
		The key in the Phaser cache that corresponds to the loaded tilemap data.
	**/
	@:optional
	var name : String;
	/**
		The width of the entire tilemap.
	**/
	@:optional
	var width : Float;
	/**
		The height of the entire tilemap.
	**/
	@:optional
	var height : Float;
	/**
		The width of the tiles.
	**/
	@:optional
	var tileWidth : Float;
	/**
		The height of the tiles.
	**/
	@:optional
	var tileHeight : Float;
	/**
		The width in pixels of the entire tilemap.
	**/
	@:optional
	var widthInPixels : Float;
	/**
		The height in pixels of the entire tilemap.
	**/
	@:optional
	var heightInPixels : Float;
	/**
		The format of the Tilemap, as defined in Tiled.
	**/
	@:optional
	var format : Float;
	/**
		The orientation of the map data (i.e. orthogonal, isometric, hexagonal), default 'orthogonal'.
	**/
	@:optional
	var orientation : String;
	/**
		Determines the draw order of tilemap. Default is right-down.
	**/
	@:optional
	var renderOrder : String;
	/**
		The version of Tiled the map uses.
	**/
	@:optional
	var version : Float;
	/**
		Map specific properties (can be specified in Tiled).
	**/
	@:optional
	var properties : Float;
	/**
		The layers of the tilemap.
	**/
	@:optional
	var layers : Array<global.phaser.tilemaps.LayerData>;
	/**
		An array with all the layers configured to the MapData.
	**/
	@:optional
	var images : Array<Dynamic>;
	/**
		An array of Tiled Image Layers.
	**/
	@:optional
	var objects : Dynamic;
	/**
		An object of Tiled Object Layers.
	**/
	@:optional
	var collision : Dynamic;
	/**
		The tilesets the map uses.
	**/
	@:optional
	var tilesets : Array<global.phaser.tilemaps.Tileset>;
	/**
		The collection of images the map uses(specified in Tiled).
	**/
	@:optional
	var imageCollections : Array<Dynamic>;
	/**
		Array of Tile instances.
	**/
	@:optional
	var tiles : Array<Dynamic>;
};