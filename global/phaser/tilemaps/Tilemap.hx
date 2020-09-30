package global.phaser.tilemaps;

/**
	A Tilemap is a container for Tilemap data. This isn't a display object, rather, it holds data
	about the map and allows you to add tilesets and tilemap layers to it. A map can have one or
	more tilemap layers (StaticTilemapLayer or DynamicTilemapLayer), which are the display
	objects that actually render tiles.
	
	The Tilemap data be parsed from a Tiled JSON file, a CSV file or a 2D array. Tiled is a free
	software package specifically for creating tile maps, and is available from:
	http://www.mapeditor.org
	
	A Tilemap has handy methods for getting & manipulating the tiles within a layer. You can only
	use the methods that change tiles (e.g. removeTileAt) on a DynamicTilemapLayer.
	
	Note that all Tilemaps use a base tile size to calculate dimensions from, but that a
	StaticTilemapLayer or DynamicTilemapLayer may have its own unique tile size that overrides
	it.
	
	As of Phaser 3.21.0, if your tilemap includes layer groups (a feature of Tiled 1.2.0+) these
	will be traversed and the following properties will affect children:
	- opacity (blended with parent) and visibility (parent overrides child)
	- Vertical and horizontal offset
	The grouping hierarchy is not preserved and all layers will be flattened into a single array.
	Group layers are parsed during Tilemap construction but are discarded after parsing so dynamic
	layers will NOT continue to be affected by a parent.
	
	To avoid duplicate layer names, a layer that is a child of a group layer will have its parent
	group name prepended with a '/'.  For example, consider a group called 'ParentGroup' with a
	child called 'Layer 1'. In the Tilemap object, 'Layer 1' will have the name
	'ParentGroup/Layer 1'.
**/
@:native("Phaser.Tilemaps.Tilemap") extern class Tilemap {
	function new(scene:global.phaser.Scene, mapData:MapData);
	var scene : global.phaser.Scene;
	/**
		The base width of a tile in pixels. Note that individual layers may have a different tile
		width.
	**/
	var tileWidth : Float;
	/**
		The base height of a tile in pixels. Note that individual layers may have a different
		tile height.
	**/
	var tileHeight : Float;
	/**
		The width of the map (in tiles).
	**/
	var width : Float;
	/**
		The height of the map (in tiles).
	**/
	var height : Float;
	/**
		The orientation of the map data (as specified in Tiled), usually 'orthogonal'.
	**/
	var orientation : String;
	/**
		The render (draw) order of the map data (as specified in Tiled), usually 'right-down'.
		
		The draw orders are:
		
		right-down
		left-down
		right-up
		left-up
		
		This can be changed via the `setRenderOrder` method.
	**/
	var renderOrder : String;
	/**
		The format of the map data.
	**/
	var format : Float;
	/**
		The version of the map data (as specified in Tiled, usually 1).
	**/
	var version : Float;
	/**
		Map specific properties as specified in Tiled.
	**/
	var properties : Dynamic;
	/**
		The width of the map in pixels based on width * tileWidth.
	**/
	var widthInPixels : Float;
	/**
		The height of the map in pixels based on height * tileHeight.
	**/
	var heightInPixels : Float;
	var imageCollections : Array<ImageCollection>;
	/**
		An array of Tiled Image Layers.
	**/
	var images : Array<Dynamic>;
	/**
		An array of Tilemap layer data.
	**/
	var layers : Array<LayerData>;
	/**
		An array of Tilesets used in the map.
	**/
	var tilesets : Array<Tileset>;
	/**
		An array of ObjectLayer instances parsed from Tiled object layers.
	**/
	var objects : Array<ObjectLayer>;
	/**
		The index of the currently selected LayerData object.
	**/
	var currentLayerIndex : Float;
	/**
		Sets the rendering (draw) order of the tiles in this map.
		
		The default is 'right-down', meaning it will order the tiles starting from the top-left,
		drawing to the right and then moving down to the next row.
		
		The draw orders are:
		
		0 = right-down
		1 = left-down
		2 = right-up
		3 = left-up
		
		Setting the render order does not change the tiles or how they are stored in the layer,
		it purely impacts the order in which they are rendered.
		
		You can provide either an integer (0 to 3), or the string version of the order.
		
		Calling this method _after_ creating Static or Dynamic Tilemap Layers will **not** automatically
		update them to use the new render order. If you call this method after creating layers, use their
		own `setRenderOrder` methods to change them as needed.
	**/
	function setRenderOrder(renderOrder:ts.AnyOf2<String, Float>):Tilemap;
	/**
		Adds an image to the map to be used as a tileset. A single map may use multiple tilesets.
		Note that the tileset name can be found in the JSON file exported from Tiled, or in the Tiled
		editor.
	**/
	function addTilesetImage(tilesetName:String, ?key:String, ?tileWidth:Float, ?tileHeight:Float, ?tileMargin:Float, ?tileSpacing:Float, ?gid:Float):Tileset;
	/**
		Turns the DynamicTilemapLayer associated with the given layer into a StaticTilemapLayer. If
		no layer specified, the map's current layer is used. This is useful if you want to manipulate
		a map at the start of a scene, but then make it non-manipulable and optimize it for speed.
		Note: the DynamicTilemapLayer passed in is destroyed, so make sure to store the value
		returned from this method if you want to manipulate the new StaticTilemapLayer.
	**/
	function convertLayerToStatic(?layer:ts.AnyOf3<String, Float, DynamicTilemapLayer>):StaticTilemapLayer;
	/**
		Copies the tiles in the source rectangular area to a new destination (all specified in tile
		coordinates) within the layer. This copies all tile properties & recalculates collision
		information in the destination region.
		
		If no layer specified, the map's current layer is used. This cannot be applied to StaticTilemapLayers.
	**/
	function copy(srcTileX:Float, srcTileY:Float, width:Float, height:Float, destTileX:Float, destTileY:Float, ?recalculateFaces:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Creates a new and empty DynamicTilemapLayer. The currently selected layer in the map is set to this new layer.
	**/
	function createBlankDynamicLayer(name:String, tileset:ts.AnyOf4<String, Array<String>, Tileset, Array<Tileset>>, ?x:Float, ?y:Float, ?width:Float, ?height:Float, ?tileWidth:Float, ?tileHeight:Float):DynamicTilemapLayer;
	/**
		Creates a new DynamicTilemapLayer that renders the LayerData associated with the given
		`layerID`. The currently selected layer in the map is set to this new layer.
		
		The `layerID` is important. If you've created your map in Tiled then you can get this by
		looking in Tiled and looking at the layer name. Or you can open the JSON file it exports and
		look at the layers[].name value. Either way it must match.
		
		Unlike a static layer, a dynamic layer can be modified. See DynamicTilemapLayer for more
		information.
	**/
	function createDynamicLayer(layerID:ts.AnyOf2<String, Float>, tileset:ts.AnyOf4<String, Array<String>, Tileset, Array<Tileset>>, ?x:Float, ?y:Float):DynamicTilemapLayer;
	/**
		Creates a Sprite for every object matching the given gid in the map data. All properties from
		the map data objectgroup are copied into the `spriteConfig`, so you can use this as an easy
		way to configure Sprite properties from within the map editor. For example giving an object a
		property of alpha: 0.5 in the map editor will duplicate that when the Sprite is created.
		
		Custom object properties not sharing names with the Sprite's own properties are copied to the
		Sprite's {@link Phaser.GameObjects.Sprite#data data store}.
	**/
	function createFromObjects(name:String, id:ts.AnyOf2<String, Float>, spriteConfig:global.phaser.types.gameobjects.sprite.SpriteConfig, ?scene:global.phaser.Scene):Array<global.phaser.gameobjects.Sprite>;
	/**
		Creates a Sprite for every object matching the given tile indexes in the layer. You can
		optionally specify if each tile will be replaced with a new tile after the Sprite has been
		created. This is useful if you want to lay down special tiles in a level that are converted to
		Sprites, but want to replace the tile itself with a floor tile or similar once converted.
	**/
	function createFromTiles(indexes:ts.AnyOf2<Float, Array<Dynamic>>, replacements:ts.AnyOf2<Float, Array<Dynamic>>, spriteConfig:global.phaser.types.gameobjects.sprite.SpriteConfig, ?scene:global.phaser.Scene, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Array<global.phaser.gameobjects.Sprite>;
	/**
		Creates a new StaticTilemapLayer that renders the LayerData associated with the given
		`layerID`. The currently selected layer in the map is set to this new layer.
		
		The `layerID` is important. If you've created your map in Tiled then you can get this by
		looking in Tiled and looking at the layer name. Or you can open the JSON file it exports and
		look at the layers[].name value. Either way it must match.
		
		It's important to remember that a static layer cannot be modified. See StaticTilemapLayer for
		more information.
	**/
	function createStaticLayer(layerID:ts.AnyOf2<String, Float>, tileset:ts.AnyOf4<String, Array<String>, Tileset, Array<Tileset>>, ?x:Float, ?y:Float):StaticTilemapLayer;
	/**
		Removes all layer data from this Tilemap and nulls the scene reference. This will destroy any
		StaticTilemapLayers or DynamicTilemapLayers that have been linked to LayerData.
	**/
	function destroy():Void;
	/**
		Sets the tiles in the given rectangular area (in tile coordinates) of the layer with the
		specified index. Tiles will be set to collide if the given index is a colliding index.
		Collision information in the region will be recalculated.
		
		If no layer specified, the map's current layer is used.
		This cannot be applied to StaticTilemapLayers.
	**/
	function fill(index:Float, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?recalculateFaces:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		For each object in the given object layer, run the given filter callback function. Any
		objects that pass the filter test (i.e. where the callback returns true) will returned as a
		new array. Similar to Array.prototype.Filter in vanilla JS.
	**/
	function filterObjects(objectLayer:ts.AnyOf2<String, ObjectLayer>, callback:global.TilemapFilterCallback, ?context:Dynamic):Array<global.phaser.gameobjects.GameObject>;
	/**
		For each tile in the given rectangular area (in tile coordinates) of the layer, run the given
		filter callback function. Any tiles that pass the filter test (i.e. where the callback returns
		true) will returned as a new array. Similar to Array.prototype.Filter in vanilla JS.
		If no layer specified, the map's current layer is used.
	**/
	function filterTiles(callback:haxe.Constraints.Function, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Array<Tile>;
	/**
		Searches the entire map layer for the first tile matching the given index, then returns that Tile
		object. If no match is found, it returns null. The search starts from the top-left tile and
		continues horizontally until it hits the end of the row, then it drops down to the next column.
		If the reverse boolean is true, it scans starting from the bottom-right corner traveling up to
		the top-left.
		If no layer specified, the map's current layer is used.
	**/
	function findByIndex(index:Float, ?skip:Float, ?reverse:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tile;
	/**
		Find the first object in the given object layer that satisfies the provided testing function.
		I.e. finds the first object for which `callback` returns true. Similar to
		Array.prototype.find in vanilla JS.
	**/
	function findObject(objectLayer:ts.AnyOf2<String, ObjectLayer>, callback:global.TilemapFindCallback, ?context:Dynamic):global.phaser.gameobjects.GameObject;
	/**
		Find the first tile in the given rectangular area (in tile coordinates) of the layer that
		satisfies the provided testing function. I.e. finds the first tile for which `callback` returns
		true. Similar to Array.prototype.find in vanilla JS.
		If no layer specified, the maps current layer is used.
	**/
	function findTile(callback:global.FindTileCallback, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tile;
	/**
		For each tile in the given rectangular area (in tile coordinates) of the layer, run the given
		callback. Similar to Array.prototype.forEach in vanilla JS.
		
		If no layer specified, the map's current layer is used.
	**/
	function forEachTile(callback:global.EachTileCallback, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Gets the image layer index based on its name.
	**/
	function getImageIndex(name:String):Float;
	/**
		Return a list of all valid imagelayer names loaded in this Tilemap.
	**/
	function getImageLayerNames():Array<String>;
	/**
		Internally used. Returns the index of the object in one of the Tilemaps arrays whose name
		property matches the given `name`.
	**/
	function getIndex(location:Array<Dynamic>, name:String):Float;
	/**
		Gets the LayerData from this.layers that is associated with `layer`, or null if an invalid
		`layer` is given.
	**/
	function getLayer(?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):LayerData;
	/**
		Gets the ObjectLayer from this.objects that has the given `name`, or null if no ObjectLayer
		is found with that name.
	**/
	function getObjectLayer(?name:String):ObjectLayer;
	/**
		Return a list of all valid objectgroup names loaded in this Tilemap.
	**/
	function getObjectLayerNames():Array<String>;
	/**
		Gets the LayerData index of the given `layer` within this.layers, or null if an invalid
		`layer` is given.
	**/
	function getLayerIndex(?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Float;
	/**
		Gets the index of the LayerData within this.layers that has the given `name`, or null if an
		invalid `name` is given.
	**/
	function getLayerIndexByName(name:String):Float;
	/**
		Gets a tile at the given tile coordinates from the given layer.
		If no layer specified, the map's current layer is used.
	**/
	function getTileAt(tileX:Float, tileY:Float, ?nonNull:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tile;
	/**
		Gets a tile at the given world coordinates from the given layer.
		If no layer specified, the map's current layer is used.
	**/
	function getTileAtWorldXY(worldX:Float, worldY:Float, ?nonNull:Bool, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tile;
	/**
		Return a list of all valid tilelayer names loaded in this Tilemap.
	**/
	function getTileLayerNames():Array<String>;
	/**
		Gets the tiles in the given rectangular area (in tile coordinates) of the layer.
		If no layer specified, the maps current layer is used.
	**/
	function getTilesWithin(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Array<Tile>;
	/**
		Gets the tiles that overlap with the given shape in the given layer. The shape must be a Circle,
		Line, Rectangle or Triangle. The shape should be in world coordinates.
		If no layer specified, the maps current layer is used.
	**/
	function getTilesWithinShape(shape:ts.AnyOf4<global.phaser.geom.Triangle, global.phaser.geom.Circle, global.phaser.geom.Line, global.phaser.geom.Rectangle>, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Array<Tile>;
	/**
		Gets the tiles in the given rectangular area (in world coordinates) of the layer.
		If no layer specified, the maps current layer is used.
	**/
	function getTilesWithinWorldXY(worldX:Float, worldY:Float, width:Float, height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Array<Tile>;
	/**
		Gets the Tileset that has the given `name`, or null if an invalid `name` is given.
	**/
	function getTileset(name:String):Tileset;
	/**
		Gets the index of the Tileset within this.tilesets that has the given `name`, or null if an
		invalid `name` is given.
	**/
	function getTilesetIndex(name:String):Float;
	/**
		Checks if there is a tile at the given location (in tile coordinates) in the given layer. Returns
		false if there is no tile or if the tile at that location has an index of -1.
		
		If no layer specified, the map's current layer is used.
	**/
	function hasTileAt(tileX:Float, tileY:Float, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Bool;
	/**
		Checks if there is a tile at the given location (in world coordinates) in the given layer. Returns
		false if there is no tile or if the tile at that location has an index of -1.
		
		If no layer specified, the maps current layer is used.
	**/
	function hasTileAtWorldXY(worldX:Float, worldY:Float, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Bool;
	/**
		The LayerData object that is currently selected in the map. You can set this property using
		any type supported by setLayer.
	**/
	var layer : LayerData;
	/**
		Puts a tile at the given tile coordinates in the specified layer. You can pass in either an index
		or a Tile object. If you pass in a Tile, all attributes will be copied over to the specified
		location. If you pass in an index, only the index at the specified location will be changed.
		Collision information will be recalculated at the specified location.
		
		If no layer specified, the maps current layer is used.
		
		This cannot be applied to StaticTilemapLayers.
	**/
	function putTileAt(tile:ts.AnyOf2<Float, Tile>, tileX:Float, tileY:Float, ?recalculateFaces:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tile;
	/**
		Puts a tile at the given world coordinates (pixels) in the specified layer. You can pass in either
		an index or a Tile object. If you pass in a Tile, all attributes will be copied over to the
		specified location. If you pass in an index, only the index at the specified location will be
		changed. Collision information will be recalculated at the specified location.
		
		If no layer specified, the maps current layer is used. This
		cannot be applied to StaticTilemapLayers.
	**/
	function putTileAtWorldXY(tile:ts.AnyOf2<Float, Tile>, worldX:Float, worldY:Float, ?recalculateFaces:Bool, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tile;
	/**
		Puts an array of tiles or a 2D array of tiles at the given tile coordinates in the specified
		layer. The array can be composed of either tile indexes or Tile objects. If you pass in a Tile,
		all attributes will be copied over to the specified location. If you pass in an index, only the
		index at the specified location will be changed. Collision information will be recalculated
		within the region tiles were changed.
		
		If no layer specified, the maps current layer is used.
		This cannot be applied to StaticTilemapLayers.
	**/
	function putTilesAt(tile:ts.AnyOf4<Array<Float>, Array<Array<Float>>, Array<Tile>, Array<Array<Tile>>>, tileX:Float, tileY:Float, ?recalculateFaces:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Randomizes the indexes of a rectangular region of tiles (in tile coordinates) within the
		specified layer. Each tile will receive a new index. If an array of indexes is passed in, then
		those will be used for randomly assigning new tile indexes. If an array is not provided, the
		indexes found within the region (excluding -1) will be used for randomly assigning new tile
		indexes. This method only modifies tile indexes and does not change collision information.
		
		If no layer specified, the maps current layer is used.
		This cannot be applied to StaticTilemapLayers.
	**/
	function randomize(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?indexes:Array<Float>, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Calculates interesting faces at the given tile coordinates of the specified layer. Interesting
		faces are used internally for optimizing collisions against tiles. This method is mostly used
		internally to optimize recalculating faces when only one tile has been changed.
		
		If no layer specified, the maps current layer is used.
	**/
	function calculateFacesAt(tileX:Float, tileY:Float, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Calculates interesting faces within the rectangular area specified (in tile coordinates) of the
		layer. Interesting faces are used internally for optimizing collisions against tiles. This method
		is mostly used internally.
		
		If no layer specified, the map's current layer is used.
	**/
	function calculateFacesWithin(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Removes the given TilemapLayer from this Tilemap without destroying it.
		
		If no layer specified, the map's current layer is used.
	**/
	function removeLayer(?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Destroys the given TilemapLayer and removes it from this Tilemap.
		
		If no layer specified, the map's current layer is used.
	**/
	function destroyLayer(?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Removes all layers from this Tilemap and destroys any associated StaticTilemapLayers or
		DynamicTilemapLayers.
	**/
	function removeAllLayers():Tilemap;
	/**
		Removes the given Tile, or an array of Tiles, from the layer to which they belong,
		and optionally recalculates the collision information.
		
		This cannot be applied to Tiles that belong to Static Tilemap Layers.
	**/
	function removeTile(tiles:ts.AnyOf2<Tile, Array<Tile>>, ?replaceIndex:Float, ?recalculateFaces:Bool):Array<Tile>;
	/**
		Removes the tile at the given tile coordinates in the specified layer and updates the layer's
		collision information.
		
		If no layer specified, the maps current layer is used.
		This cannot be applied to StaticTilemapLayers.
	**/
	function removeTileAt(tileX:Float, tileY:Float, ?replaceWithNull:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tile;
	/**
		Removes the tile at the given world coordinates in the specified layer and updates the layer's
		collision information.
		
		If no layer specified, the maps current layer is used.
		This cannot be applied to StaticTilemapLayers.
	**/
	function removeTileAtWorldXY(worldX:Float, worldY:Float, ?replaceWithNull:Bool, ?recalculateFaces:Bool, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tile;
	/**
		Draws a debug representation of the layer to the given Graphics. This is helpful when you want to
		get a quick idea of which of your tiles are colliding and which have interesting faces. The tiles
		are drawn starting at (0, 0) in the Graphics, allowing you to place the debug representation
		wherever you want on the screen.
		
		If no layer specified, the maps current layer is used.
	**/
	function renderDebug(graphics:global.phaser.gameobjects.Graphics, styleConfig:global.phaser.types.tilemaps.StyleConfig, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Draws a debug representation of all layers within this Tilemap to the given Graphics object.
		
		This is helpful when you want to get a quick idea of which of your tiles are colliding and which
		have interesting faces. The tiles are drawn starting at (0, 0) in the Graphics, allowing you to
		place the debug representation wherever you want on the screen.
	**/
	function renderDebugFull(graphics:global.phaser.gameobjects.Graphics, styleConfig:global.phaser.types.tilemaps.StyleConfig):Tilemap;
	/**
		Scans the given rectangular area (given in tile coordinates) for tiles with an index matching
		`findIndex` and updates their index to match `newIndex`. This only modifies the index and does
		not change collision information.
		
		If no layer specified, the maps current layer is used.
		This cannot be applied to StaticTilemapLayers.
	**/
	function replaceByIndex(findIndex:Float, newIndex:Float, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Sets collision on the given tile or tiles within a layer by index. You can pass in either a
		single numeric index or an array of indexes: [2, 3, 15, 20]. The `collides` parameter controls if
		collision will be enabled (true) or disabled (false).
		
		If no layer specified, the map's current layer is used.
	**/
	function setCollision(indexes:ts.AnyOf2<Float, Array<Dynamic>>, ?collides:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>, ?updateLayer:Bool):Tilemap;
	/**
		Sets collision on a range of tiles in a layer whose index is between the specified `start` and
		`stop` (inclusive). Calling this with a start value of 10 and a stop value of 14 would set
		collision for tiles 10, 11, 12, 13 and 14. The `collides` parameter controls if collision will be
		enabled (true) or disabled (false).
		
		If no layer specified, the map's current layer is used.
	**/
	function setCollisionBetween(start:Float, stop:Float, ?collides:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Sets collision on the tiles within a layer by checking tile properties. If a tile has a property
		that matches the given properties object, its collision flag will be set. The `collides`
		parameter controls if collision will be enabled (true) or disabled (false). Passing in
		`{ collides: true }` would update the collision flag on any tiles with a "collides" property that
		has a value of true. Any tile that doesn't have "collides" set to true will be ignored. You can
		also use an array of values, e.g. `{ types: ["stone", "lava", "sand" ] }`. If a tile has a
		"types" property that matches any of those values, its collision flag will be updated.
		
		If no layer specified, the map's current layer is used.
	**/
	function setCollisionByProperty(properties:Dynamic, ?collides:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Sets collision on all tiles in the given layer, except for tiles that have an index specified in
		the given array. The `collides` parameter controls if collision will be enabled (true) or
		disabled (false). Tile indexes not currently in the layer are not affected.
		
		If no layer specified, the map's current layer is used.
	**/
	function setCollisionByExclusion(indexes:Array<Float>, ?collides:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Sets collision on the tiles within a layer by checking each tile's collision group data
		(typically defined in Tiled within the tileset collision editor). If any objects are found within
		a tile's collision group, the tile's colliding information will be set. The `collides` parameter
		controls if collision will be enabled (true) or disabled (false).
		
		If no layer specified, the map's current layer is used.
	**/
	function setCollisionFromCollisionGroup(?collides:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Sets a global collision callback for the given tile index within the layer. This will affect all
		tiles on this layer that have the same index. If a callback is already set for the tile index it
		will be replaced. Set the callback to null to remove it. If you want to set a callback for a tile
		at a specific location on the map then see setTileLocationCallback.
		
		If no layer specified, the map's current layer is used.
	**/
	function setTileIndexCallback(indexes:ts.AnyOf2<Float, Array<Dynamic>>, callback:haxe.Constraints.Function, callbackContext:Dynamic, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Sets a collision callback for the given rectangular area (in tile coordinates) within the layer.
		If a callback is already set for the tile index it will be replaced. Set the callback to null to
		remove it.
		
		If no layer specified, the map's current layer is used.
	**/
	function setTileLocationCallback(tileX:Float, tileY:Float, width:Float, height:Float, callback:haxe.Constraints.Function, ?callbackContext:Dynamic, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Sets the current layer to the LayerData associated with `layer`.
	**/
	function setLayer(?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Sets the base tile size for the map. Note: this does not necessarily match the tileWidth and
		tileHeight for all layers. This also updates the base size on all tiles across all layers.
	**/
	function setBaseTileSize(tileWidth:Float, tileHeight:Float):Tilemap;
	/**
		Sets the tile size for a specific `layer`. Note: this does not necessarily match the map's
		tileWidth and tileHeight for all layers. This will set the tile size for the layer and any
		tiles the layer has.
	**/
	function setLayerTileSize(tileWidth:Float, tileHeight:Float, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Shuffles the tiles in a rectangular region (specified in tile coordinates) within the given
		layer. It will only randomize the tiles in that area, so if they're all the same nothing will
		appear to have changed! This method only modifies tile indexes and does not change collision
		information.
		
		If no layer specified, the maps current layer is used.
		This cannot be applied to StaticTilemapLayers.
	**/
	function shuffle(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Scans the given rectangular area (given in tile coordinates) for tiles with an index matching
		`indexA` and swaps then with `indexB`. This only modifies the index and does not change collision
		information.
		
		If no layer specified, the maps current layer is used.
		This cannot be applied to StaticTilemapLayers.
	**/
	function swapByIndex(tileA:Float, tileB:Float, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Converts from tile X coordinates (tile units) to world X coordinates (pixels), factoring in the
		layers position, scale and scroll.
		
		If no layer specified, the maps current layer is used.
	**/
	function tileToWorldX(tileX:Float, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Float;
	/**
		Converts from tile Y coordinates (tile units) to world Y coordinates (pixels), factoring in the
		layers position, scale and scroll.
		
		If no layer specified, the maps current layer is used.
	**/
	function tileToWorldY(tileY:Float, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Float;
	/**
		Converts from tile XY coordinates (tile units) to world XY coordinates (pixels), factoring in the
		layers position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
		
		If no layer specified, the maps current layer is used.
	**/
	function tileToWorldXY(tileX:Float, tileY:Float, ?point:global.phaser.math.Vector2, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):global.phaser.math.Vector2;
	/**
		Randomizes the indexes of a rectangular region of tiles (in tile coordinates) within the
		specified layer. Each tile will receive a new index. New indexes are drawn from the given
		weightedIndexes array. An example weighted array:
		
		[
		  { index: 6, weight: 4 },    // Probability of index 6 is 4 / 8
		  { index: 7, weight: 2 },    // Probability of index 7 would be 2 / 8
		  { index: 8, weight: 1.5 },  // Probability of index 8 would be 1.5 / 8
		  { index: 26, weight: 0.5 }  // Probability of index 27 would be 0.5 / 8
		]
		
		The probability of any index being choose is (the index's weight) / (sum of all weights). This
		method only modifies tile indexes and does not change collision information.
		
		If no layer specified, the map's current layer is used. This
		cannot be applied to StaticTilemapLayers.
	**/
	function weightedRandomize(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?weightedIndexes:Array<Dynamic>, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Tilemap;
	/**
		Converts from world X coordinates (pixels) to tile X coordinates (tile units), factoring in the
		layers position, scale and scroll.
		
		If no layer specified, the maps current layer is used.
	**/
	function worldToTileX(worldX:Float, ?snapToFloor:Bool, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Float;
	/**
		Converts from world Y coordinates (pixels) to tile Y coordinates (tile units), factoring in the
		layers position, scale and scroll.
		
		If no layer specified, the maps current layer is used.
	**/
	function worldToTileY(worldY:Float, ?snapToFloor:Bool, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):Float;
	/**
		Converts from world XY coordinates (pixels) to tile XY coordinates (tile units), factoring in the
		layers position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
		
		If no layer specified, the maps current layer is used.
	**/
	function worldToTileXY(worldX:Float, worldY:Float, ?snapToFloor:Bool, ?point:global.phaser.math.Vector2, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf4<String, Float, DynamicTilemapLayer, StaticTilemapLayer>):global.phaser.math.Vector2;
	static var prototype : Tilemap;
}