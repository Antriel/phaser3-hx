package global.phaser.tilemaps;

/**
	A class for representing data about a map. Maps are parsed from CSV, Tiled, etc. into this
	format. A Tilemap object get a copy of this data and then unpacks the needed properties into
	itself.
**/
@:native("Phaser.Tilemaps.MapData") extern class MapData {
	function new(?config:global.phaser.types.tilemaps.MapDataConfig);
	/**
		The key in the Phaser cache that corresponds to the loaded tilemap data.
	**/
	var name : String;
	/**
		The width of the entire tilemap.
	**/
	var width : Float;
	/**
		The height of the entire tilemap.
	**/
	var height : Float;
	/**
		If the map is infinite or not.
	**/
	var infinite : Bool;
	/**
		The width of the tiles.
	**/
	var tileWidth : Float;
	/**
		The height of the tiles.
	**/
	var tileHeight : Float;
	/**
		The width in pixels of the entire tilemap.
	**/
	var widthInPixels : Float;
	/**
		The height in pixels of the entire tilemap.
	**/
	var heightInPixels : Float;
	/**
		The format of the map data.
	**/
	var format : Float;
	/**
		The orientation of the map data (i.e. orthogonal, isometric, hexagonal), default 'orthogonal'.
	**/
	var orientation : String;
	/**
		Determines the draw order of tilemap. Default is right-down
		
		0, or 'right-down'
		1, or 'left-down'
		2, or 'right-up'
		3, or 'left-up'
	**/
	var renderOrder : String;
	/**
		The version of the map data (as specified in Tiled).
	**/
	var version : String;
	/**
		Map specific properties (can be specified in Tiled)
	**/
	var properties : Dynamic;
	/**
		An array with all the layers configured to the MapData.
	**/
	var layers : ts.AnyOf2<Array<LayerData>, ObjectLayer>;
	/**
		An array of Tiled Image Layers.
	**/
	var images : Array<Dynamic>;
	/**
		An object of Tiled Object Layers.
	**/
	var objects : Dynamic;
	/**
		An object of collision data. Must be created as physics object or will return undefined.
	**/
	var collision : Dynamic;
	/**
		An array of Tilesets.
	**/
	var tilesets : Array<Tileset>;
	/**
		The collection of images the map uses(specified in Tiled)
	**/
	var imageCollections : Array<Dynamic>;
	/**
		An array of tile instances.
	**/
	var tiles : Array<Dynamic>;
	static var prototype : MapData;
}