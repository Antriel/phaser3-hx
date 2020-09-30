package global.phaser.types.tilemaps;

typedef LayerDataConfig = {
	/**
		The name of the layer, if specified in Tiled.
	**/
	@:optional
	var name : String;
	/**
		The x offset of where to draw from the top left.
	**/
	@:optional
	var x : Float;
	/**
		The y offset of where to draw from the top left.
	**/
	@:optional
	var y : Float;
	/**
		The width of the layer in tiles.
	**/
	@:optional
	var width : Float;
	/**
		The height of the layer in tiles.
	**/
	@:optional
	var height : Float;
	/**
		The pixel width of the tiles.
	**/
	@:optional
	var tileWidth : Float;
	/**
		The pixel height of the tiles.
	**/
	@:optional
	var tileHeight : Float;
	/**
		The base tile width.
	**/
	@:optional
	var baseTileWidth : Float;
	/**
		The base tile height.
	**/
	@:optional
	var baseTileHeight : Float;
	/**
		The width in pixels of the entire layer.
	**/
	@:optional
	var widthInPixels : Float;
	/**
		The height in pixels of the entire layer.
	**/
	@:optional
	var heightInPixels : Float;
	/**
		The alpha value of the layer.
	**/
	@:optional
	var alpha : Float;
	/**
		Is the layer visible or not?
	**/
	@:optional
	var visible : Bool;
	/**
		Layer specific properties (can be specified in Tiled)
	**/
	@:optional
	var properties : Array<Dynamic>;
	/**
		Tile ID index map.
	**/
	@:optional
	var indexes : Array<Dynamic>;
	/**
		Tile Collision ID index map.
	**/
	@:optional
	var collideIndexes : Array<Dynamic>;
	/**
		An array of callbacks.
	**/
	@:optional
	var callbacks : Array<Dynamic>;
	/**
		An array of physics bodies.
	**/
	@:optional
	var bodies : Array<Dynamic>;
	/**
		An array of the tile data indexes.
	**/
	@:optional
	var data : Array<Dynamic>;
	/**
		A reference to the Tilemap layer that owns this data.
	**/
	@:optional
	var tilemapLayer : ts.AnyOf2<global.phaser.tilemaps.DynamicTilemapLayer, global.phaser.tilemaps.StaticTilemapLayer>;
};