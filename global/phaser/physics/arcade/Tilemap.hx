package global.phaser.physics.arcade;

@:native("Phaser.Physics.Arcade.Tilemap") @valueModuleOnly extern class Tilemap {
	/**
		A function to process the collision callbacks between a single tile and an Arcade Physics enabled Game Object.
	**/
	static function ProcessTileCallbacks(tile:global.phaser.tilemaps.Tile, sprite:global.phaser.gameobjects.Sprite):Bool;
	/**
		Internal function to process the separation of a physics body from a tile.
	**/
	static function ProcessTileSeparationX(body:Body, x:Float):Void;
	/**
		Internal function to process the separation of a physics body from a tile.
	**/
	static function ProcessTileSeparationY(body:Body, y:Float):Void;
	/**
		The core separation function to separate a physics body and a tile.
	**/
	static function SeparateTile(i:Float, body:Body, tile:global.phaser.tilemaps.Tile, tileWorldRect:global.phaser.geom.Rectangle, tilemapLayer:ts.AnyOf2<global.phaser.tilemaps.DynamicTilemapLayer, global.phaser.tilemaps.StaticTilemapLayer>, tileBias:Float, isLayer:Bool):Bool;
	/**
		Check the body against the given tile on the X axis.
		Used internally by the SeparateTile function.
	**/
	static function TileCheckX(body:Body, tile:global.phaser.tilemaps.Tile, tileLeft:Float, tileRight:Float, tileBias:Float, isLayer:Bool):Float;
	/**
		Check the body against the given tile on the Y axis.
		Used internally by the SeparateTile function.
	**/
	static function TileCheckY(body:Body, tile:global.phaser.tilemaps.Tile, tileTop:Float, tileBottom:Float, tileBias:Float, isLayer:Bool):Float;
	/**
		Checks for intersection between the given tile rectangle-like object and an Arcade Physics body.
	**/
	static function TileIntersectsBody(tileWorldRect:Dynamic, body:Body):Bool;
}