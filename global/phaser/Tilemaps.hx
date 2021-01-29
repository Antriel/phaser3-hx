package global.phaser;

@:native("Phaser.Tilemaps") @valueModuleOnly extern class Tilemaps {
	/**
		Create a Tilemap from the given key or data. If neither is given, make a blank Tilemap. When
		loading from CSV or a 2D array, you should specify the tileWidth & tileHeight. When parsing from
		a map from Tiled, the tileWidth, tileHeight, width & height will be pulled from the map data. For
		an empty map, you should specify tileWidth, tileHeight, width & height.
	**/
	static function ParseToTilemap(scene:Scene, ?key:String, ?tileWidth:Float, ?tileHeight:Float, ?width:Float, ?height:Float, ?data:Array<Array<Float>>, ?insertNull:Bool):global.phaser.tilemaps.Tilemap;
	/**
		Orthogonal Tilemap orientation constant.
	**/
	static final ORTHOGONAL : Float;
	/**
		Isometric Tilemap orientation constant.
	**/
	static final ISOMETRIC : Float;
	/**
		Staggered Tilemap orientation constant.
	**/
	static final STAGGERED : Float;
	/**
		Hexagonal Tilemap orientation constant.
	**/
	static final HEXAGONAL : Float;
}