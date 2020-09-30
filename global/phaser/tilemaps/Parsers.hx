package global.phaser.tilemaps;

@:native("Phaser.Tilemaps.Parsers") @valueModuleOnly extern class Parsers {
	/**
		Parses raw data of a given Tilemap format into a new MapData object. If no recognized data format
		is found, returns `null`. When loading from CSV or a 2D array, you should specify the tileWidth &
		tileHeight. When parsing from a map from Tiled, the tileWidth & tileHeight will be pulled from
		the map data.
	**/
	static function Parse(name:String, mapFormat:Float, data:ts.AnyOf3<String, Dynamic, Array<Array<Float>>>, tileWidth:Float, tileHeight:Float, insertNull:Bool):MapData;
	/**
		Parses a 2D array of tile indexes into a new MapData object with a single layer.
	**/
	static function Parse2DArray(name:String, data:Array<Array<Float>>, tileWidth:Float, tileHeight:Float, insertNull:Bool):MapData;
	/**
		Parses a CSV string of tile indexes into a new MapData object with a single layer.
	**/
	static function ParseCSV(name:String, data:String, tileWidth:Float, tileHeight:Float, insertNull:Bool):MapData;
}