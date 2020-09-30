package global.phaser.types.tilemaps;

typedef TilemapConfig = {
	/**
		The key in the Phaser cache that corresponds to the loaded tilemap data.
	**/
	@:optional
	var key : String;
	/**
		Instead of loading from the cache, you can also load directly from a 2D array of tile indexes.
	**/
	@:optional
	var data : Array<Array<Float>>;
	/**
		The width of a tile in pixels.
	**/
	@:optional
	var tileWidth : Float;
	/**
		The height of a tile in pixels.
	**/
	@:optional
	var tileHeight : Float;
	/**
		The width of the map in tiles.
	**/
	@:optional
	var width : Float;
	/**
		The height of the map in tiles.
	**/
	@:optional
	var height : Float;
	/**
		Controls how empty tiles, tiles with an index of -1,
		in the map data are handled. If `true`, empty locations will get a value of `null`. If `false`,
		empty location will get a Tile object with an index of -1. If you've a large sparsely populated
		map and the tile data doesn't need to change then setting this value to `true` will help with
		memory consumption. However if your map is small or you need to update the tiles dynamically,
		then leave the default value set.
	**/
	@:optional
	var insertNull : Bool;
};