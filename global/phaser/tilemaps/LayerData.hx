package global.phaser.tilemaps;

/**
	A class for representing data about about a layer in a map. Maps are parsed from CSV, Tiled,
	etc. into this format. Tilemap, StaticTilemapLayer and DynamicTilemapLayer have a reference
	to this data and use it to look up and perform operations on tiles.
**/
@:native("Phaser.Tilemaps.LayerData") extern class LayerData {
	function new(?config:global.phaser.types.tilemaps.LayerDataConfig);
	/**
		The name of the layer, if specified in Tiled.
	**/
	var name : String;
	/**
		The x offset of where to draw from the top left.
	**/
	var x : Float;
	/**
		The y offset of where to draw from the top left.
	**/
	var y : Float;
	/**
		The width of the layer in tiles.
	**/
	var width : Float;
	/**
		The height of the layer in tiles.
	**/
	var height : Float;
	/**
		The pixel width of the tiles.
	**/
	var tileWidth : Float;
	/**
		The pixel height of the tiles.
	**/
	var tileHeight : Float;
	/**
		The base tile width.
	**/
	var baseTileWidth : Float;
	/**
		The base tile height.
	**/
	var baseTileHeight : Float;
	/**
		The width in pixels of the entire layer.
	**/
	var widthInPixels : Float;
	/**
		The height in pixels of the entire layer.
	**/
	var heightInPixels : Float;
	/**
		The alpha value of the layer.
	**/
	var alpha : Float;
	/**
		Is the layer visible or not?
	**/
	var visible : Bool;
	/**
		Layer specific properties (can be specified in Tiled)
	**/
	var properties : Array<Dynamic>;
	/**
		Tile ID index map.
	**/
	var indexes : Array<Dynamic>;
	/**
		Tile Collision ID index map.
	**/
	var collideIndexes : Array<Dynamic>;
	/**
		An array of callbacks.
	**/
	var callbacks : Array<Dynamic>;
	/**
		An array of physics bodies.
	**/
	var bodies : Array<Dynamic>;
	/**
		An array of the tile data indexes.
	**/
	var data : Array<Array<Tile>>;
	/**
		A reference to the Tilemap layer that owns this data.
	**/
	var tilemapLayer : ts.AnyOf2<DynamicTilemapLayer, StaticTilemapLayer>;
	static var prototype : LayerData;
}