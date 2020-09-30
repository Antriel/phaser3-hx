package global.phaser.tilemaps.parsers;

@:native("Phaser.Tilemaps.Parsers.Tiled") @valueModuleOnly extern class Tiled {
	/**
		Copy properties from tileset to tiles.
	**/
	static function AssignTileProperties(mapData:global.phaser.tilemaps.MapData):Void;
	/**
		Decode base-64 encoded data, for example as exported by Tiled.
	**/
	static function Base64Decode(data:Dynamic):Array<Dynamic>;
	/**
		Master list of tiles -> x, y, index in tileset.
	**/
	static function BuildTilesetIndex(mapData:global.phaser.tilemaps.MapData):Array<Dynamic>;
	/**
		Parse a Tiled group layer and create a state object for inheriting.
	**/
	static function CreateGroupLayer(json:Dynamic, ?currentl:Dynamic, ?parentstate:Dynamic):Dynamic;
	/**
		See Tiled documentation on tile flipping:
		http://docs.mapeditor.org/en/latest/reference/tmx-map-format/
	**/
	static function ParseGID(gid:Float):global.phaser.types.tilemaps.GIDData;
	/**
		Parses a Tiled JSON object into an array of objects with details about the image layers.
	**/
	static function ParseImageLayers(json:Dynamic):Array<Dynamic>;
	/**
		Parses a Tiled JSON object into a new MapData object.
	**/
	static function ParseJSONTiled(name:String, json:Dynamic, insertNull:Bool):global.phaser.tilemaps.MapData;
	/**
		Convert a Tiled object to an internal parsed object normalising and copying properties over, while applying optional x and y offsets. The parsed object will always have the properties `id`, `name`, `type`, `rotation`, `properties`, `visible`, `x`, `y`, `width` and `height`. Other properties will be added according to the object type (such as text, polyline, gid etc.)
	**/
	static function ParseObject(tiledObject:Dynamic, ?offsetX:Float, ?offsetY:Float):Dynamic;
	/**
		Parses a Tiled JSON object into an array of ObjectLayer objects.
	**/
	static function ParseObjectLayers(json:Dynamic):Array<Dynamic>;
	/**
		Parses all tilemap layers in a Tiled JSON object into new LayerData objects.
	**/
	static function ParseTileLayers(json:Dynamic, insertNull:Bool):Array<global.phaser.tilemaps.LayerData>;
	/**
		Tilesets and Image Collections
	**/
	static function ParseTilesets(json:Dynamic):Dynamic;
}