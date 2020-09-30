package global.phaser.tilemaps;

/**
	A Tileset is a combination of an image containing the tiles and a container for data about
	each tile.
**/
@:native("Phaser.Tilemaps.Tileset") extern class Tileset {
	function new(name:String, firstgid:Float, ?tileWidth:Float, ?tileHeight:Float, ?tileMargin:Float, ?tileSpacing:Float, ?tileProperties:Dynamic, ?tileData:Dynamic);
	/**
		The name of the Tileset.
	**/
	var name : String;
	/**
		The starting index of the first tile index this Tileset contains.
	**/
	var firstgid : Float;
	/**
		The width of each tile (in pixels). Use setTileSize to change.
	**/
	final tileWidth : Float;
	/**
		The height of each tile (in pixels). Use setTileSize to change.
	**/
	final tileHeight : Float;
	/**
		The margin around the tiles in the sheet (in pixels). Use `setSpacing` to change.
	**/
	final tileMargin : Float;
	/**
		The spacing between each the tile in the sheet (in pixels). Use `setSpacing` to change.
	**/
	final tileSpacing : Float;
	/**
		Tileset-specific properties per tile that are typically defined in the Tiled editor in the
		Tileset editor.
	**/
	var tileProperties : Dynamic;
	/**
		Tileset-specific data per tile that are typically defined in the Tiled editor, e.g. within
		the Tileset collision editor. This is where collision objects and terrain are stored.
	**/
	var tileData : Dynamic;
	/**
		The cached image that contains the individual tiles. Use setImage to set.
	**/
	final image : global.phaser.textures.Texture;
	/**
		The gl texture used by the WebGL renderer.
	**/
	final glTexture : js.html.webgl.Texture;
	/**
		The number of tile rows in the the tileset.
	**/
	final rows : Float;
	/**
		The number of tile columns in the tileset.
	**/
	final columns : Float;
	/**
		The total number of tiles in the tileset.
	**/
	final total : Float;
	/**
		The look-up table to specific tile image texture coordinates (UV in pixels). Each element
		contains the coordinates for a tile in an object of the form {x, y}.
	**/
	final texCoordinates : Array<Dynamic>;
	/**
		Get a tiles properties that are stored in the Tileset. Returns null if tile index is not
		contained in this Tileset. This is typically defined in Tiled under the Tileset editor.
	**/
	function getTileProperties(tileIndex:Float):Null<Dynamic>;
	/**
		Get a tile's data that is stored in the Tileset. Returns null if tile index is not contained
		in this Tileset. This is typically defined in Tiled and will contain both Tileset collision
		info and terrain mapping.
	**/
	function getTileData(tileIndex:Float):Null<Dynamic>;
	/**
		Get a tile's collision group that is stored in the Tileset. Returns null if tile index is not
		contained in this Tileset. This is typically defined within Tiled's tileset collision editor.
	**/
	function getTileCollisionGroup(tileIndex:Float):Dynamic;
	/**
		Returns true if and only if this Tileset contains the given tile index.
	**/
	function containsTileIndex(tileIndex:Float):Bool;
	/**
		Returns the texture coordinates (UV in pixels) in the Tileset image for the given tile index.
		Returns null if tile index is not contained in this Tileset.
	**/
	function getTileTextureCoordinates(tileIndex:Float):Dynamic;
	/**
		Sets the image associated with this Tileset and updates the tile data (rows, columns, etc.).
	**/
	function setImage(texture:global.phaser.textures.Texture):Tileset;
	/**
		Sets the tile width & height and updates the tile data (rows, columns, etc.).
	**/
	function setTileSize(?tileWidth:Float, ?tileHeight:Float):Tileset;
	/**
		Sets the tile margin & spacing and updates the tile data (rows, columns, etc.).
	**/
	function setSpacing(?margin:Float, ?spacing:Float):Tileset;
	/**
		Updates tile texture coordinates and tileset data.
	**/
	function updateTileData(imageWidth:Float, imageHeight:Float):Tileset;
	static var prototype : Tileset;
}