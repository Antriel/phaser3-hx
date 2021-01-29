package global.phaser.tilemaps;

/**
	A Tilemap is a container for Tilemap data. This isn't a display object, rather, it holds data
	about the map and allows you to add tilesets and tilemap layers to it. A map can have one or
	more tilemap layers, which are the display objects that actually render the tiles.
	
	The Tilemap data can be parsed from a Tiled JSON file, a CSV file or a 2D array. Tiled is a free
	software package specifically for creating tile maps, and is available from:
	http://www.mapeditor.org
	
	As of Phaser 3.50.0 the Tilemap API now supports the following types of map:
	
	1) Orthogonal
	2) Isometric
	3) Hexagonal
	4) Staggered
	
	Prior to this release, only orthogonal maps were supported.
	
	Another large change in 3.50 was the consolidation of Tilemap Layers. Previously, you created
	either a Static or Dynamic Tilemap Layer. However, as of 3.50 the features of both have been
	merged and the API simplified, so now there is just the single `TilemapLayer` class.
	
	A Tilemap has handy methods for getting and manipulating the tiles within a layer, allowing
	you to build or modify the tilemap data at runtime.
	
	Note that all Tilemaps use a base tile size to calculate dimensions from, but that a
	TilemapLayer may have its own unique tile size that overrides this.
	
	As of Phaser 3.21.0, if your tilemap includes layer groups (a feature of Tiled 1.2.0+) these
	will be traversed and the following properties will impact children:
	
	- Opacity (blended with parent) and visibility (parent overrides child)
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
	/**
		A collection of Images, as parsed from Tiled map data.
	**/
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
		The length of the horizontal sides of the hexagon.
		Only used for hexagonal orientation Tilemaps.
	**/
	var hexSideLength : Float;
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
		
		Calling this method _after_ creating Tilemap Layers will **not** automatically
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
		Copies the tiles in the source rectangular area to a new destination (all specified in tile
		coordinates) within the layer. This copies all tile properties & recalculates collision
		information in the destination region.
		
		If no layer specified, the map's current layer is used. This cannot be applied to StaticTilemapLayers.
	**/
	function copy(srcTileX:Float, srcTileY:Float, width:Float, height:Float, destTileX:Float, destTileY:Float, ?recalculateFaces:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Creates a new and empty Tilemap Layer. The currently selected layer in the map is set to this new layer.
		
		Prior to v3.50.0 this method was called `createBlankDynamicLayer`.
	**/
	function createBlankLayer(name:String, tileset:ts.AnyOf4<String, Array<String>, Tileset, Array<Tileset>>, ?x:Float, ?y:Float, ?width:Float, ?height:Float, ?tileWidth:Float, ?tileHeight:Float):TilemapLayer;
	/**
		Creates a new Tilemap Layer that renders the LayerData associated with the given
		`layerID`. The currently selected layer in the map is set to this new layer.
		
		The `layerID` is important. If you've created your map in Tiled then you can get this by
		looking in Tiled and looking at the layer name. Or you can open the JSON file it exports and
		look at the layers[].name value. Either way it must match.
		
		Prior to v3.50.0 this method was called `createDynamicLayer`.
	**/
	function createLayer(layerID:ts.AnyOf2<String, Float>, tileset:ts.AnyOf4<String, Array<String>, Tileset, Array<Tileset>>, ?x:Float, ?y:Float):TilemapLayer;
	/**
		This method will iterate through all of the objects defined in a Tiled Object Layer and then
		convert the matching results into Phaser Game Objects (by default, Sprites)
		
		Objects are matched on one of 3 criteria: The Object ID, the Object GID or the Object Name.
		
		Within Tiled, Object IDs are unique per Object. Object GIDs, however, are shared by all objects
		using the same image. Finally, Object Names are strings and the same name can be used on multiple
		Objects in Tiled, they do not have to be unique.
		
		You set the configuration parameter accordingly, based on which type of criteria you wish
		to match against. For example, to convert all items on an Object Layer with a `gid` of 26:
		
		```javascript
		createFromObjects(layerName, {
		   gid: 26
		});
		```
		
		Or, to convert objects with the name 'bonus':
		
		```javascript
		createFromObjects(layerName, {
		   name: 'bonus'
		});
		```
		
		Or, to convert an object with a specific id:
		
		```javascript
		createFromObjects(layerName, {
		   id: 9
		});
		```
		
		You should only specify either `id`, `gid`, `name`, or none of them. Do not add more than
		one criteria to your config. If you do not specify any criteria, then _all_ objects in the
		Object Layer will be converted.
		
		By default this method will convert objects into `Sprite` instances, but you can override
		this by providing your own class type:
		
		```javascript
		createFromObjects(layerName, {
		   gid: 26,
		   classType: Coin
		});
		```
		
		This will convert all Objects with a gid of 26 into your custom `Coin` class. You can pass
		any class type here, but it _must_ extend `Phaser.GameObjects.GameObject` as its base class.
		Your class will always be passed 1 parameter: `scene`, which is a reference to either the Scene
		specified in the config object or, if not given, the Scene to which this Tilemap belongs.
		
		All properties from object are copied into the Game Object, so you can use this as an easy
		way to configure properties from within the map editor. For example giving an object a
		property of `alpha: 0.5` in Tiled will be reflected in the Game Object that is created.
		
		Custom object properties that do not exist as a Game Object property are set in the
		Game Objects {@link Phaser.GameObjects.GameObject#data data store}.
		
		You can use set a `container` property in the config. If given, the class will be added to
		the Container instance instead of the Scene.
		
		Finally, you can provide an array of config objects, to convert multiple types of object in
		a single call:
		
		```javascript
		createFromObjects(layerName, [
		   {
		     gid: 26,
		     classType: Coin
		   },
		   {
		     id: 9,
		     classType: BossMonster
		   },
		   {
		     name: 'lava',
		     classType: LavaTile
		   }
		]);
		```
		
		The signature of this method changed significantly in v3.50.0. Prior to this, it did not take config objects.
	**/
	function createFromObjects(objectLayerName:String, config:ts.AnyOf2<global.phaser.types.tilemaps.CreateFromObjectLayerConfig, Array<global.phaser.types.tilemaps.CreateFromObjectLayerConfig>>):Array<global.phaser.gameobjects.GameObject>;
	/**
		Creates a Sprite for every object matching the given tile indexes in the layer. You can
		optionally specify if each tile will be replaced with a new tile after the Sprite has been
		created. This is useful if you want to lay down special tiles in a level that are converted to
		Sprites, but want to replace the tile itself with a floor tile or similar once converted.
	**/
	function createFromTiles(indexes:ts.AnyOf2<Float, Array<Dynamic>>, replacements:ts.AnyOf2<Float, Array<Dynamic>>, spriteConfig:global.phaser.types.gameobjects.sprite.SpriteConfig, ?scene:global.phaser.Scene, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Array<global.phaser.gameobjects.Sprite>;
	/**
		Sets the tiles in the given rectangular area (in tile coordinates) of the layer with the
		specified index. Tiles will be set to collide if the given index is a colliding index.
		Collision information in the region will be recalculated.
		
		If no layer specified, the map's current layer is used.
		This cannot be applied to StaticTilemapLayers.
	**/
	function fill(index:Float, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?recalculateFaces:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		For each object in the given object layer, run the given filter callback function. Any
		objects that pass the filter test (i.e. where the callback returns true) will returned as a
		new array. Similar to Array.prototype.Filter in vanilla JS.
	**/
	function filterObjects(objectLayer:ts.AnyOf2<String, ObjectLayer>, callback:global.TilemapFilterCallback, ?context:Dynamic):Array<global.phaser.types.tilemaps.TiledObject>;
	/**
		For each tile in the given rectangular area (in tile coordinates) of the layer, run the given
		filter callback function. Any tiles that pass the filter test (i.e. where the callback returns
		true) will returned as a new array. Similar to Array.prototype.Filter in vanilla JS.
		If no layer specified, the map's current layer is used.
	**/
	function filterTiles(callback:haxe.Constraints.Function, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Array<Tile>;
	/**
		Searches the entire map layer for the first tile matching the given index, then returns that Tile
		object. If no match is found, it returns null. The search starts from the top-left tile and
		continues horizontally until it hits the end of the row, then it drops down to the next column.
		If the reverse boolean is true, it scans starting from the bottom-right corner traveling up to
		the top-left.
		If no layer specified, the map's current layer is used.
	**/
	function findByIndex(index:Float, ?skip:Float, ?reverse:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tile;
	/**
		Find the first object in the given object layer that satisfies the provided testing function.
		I.e. finds the first object for which `callback` returns true. Similar to
		Array.prototype.find in vanilla JS.
	**/
	function findObject(objectLayer:ts.AnyOf2<String, ObjectLayer>, callback:global.TilemapFindCallback, ?context:Dynamic):global.phaser.types.tilemaps.TiledObject;
	/**
		Find the first tile in the given rectangular area (in tile coordinates) of the layer that
		satisfies the provided testing function. I.e. finds the first tile for which `callback` returns
		true. Similar to Array.prototype.find in vanilla JS.
		If no layer specified, the maps current layer is used.
	**/
	function findTile(callback:global.FindTileCallback, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tile;
	/**
		For each tile in the given rectangular area (in tile coordinates) of the layer, run the given
		callback. Similar to Array.prototype.forEach in vanilla JS.
		
		If no layer specified, the map's current layer is used.
	**/
	function forEachTile(callback:global.EachTileCallback, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
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
		Gets the LayerData from `this.layers` that is associated with the given `layer`, or null if the layer is invalid.
	**/
	function getLayer(?layer:ts.AnyOf3<String, Float, TilemapLayer>):LayerData;
	/**
		Gets the ObjectLayer from `this.objects` that has the given `name`, or null if no ObjectLayer is found with that name.
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
	function getLayerIndex(?layer:ts.AnyOf3<String, Float, TilemapLayer>):Float;
	/**
		Gets the index of the LayerData within this.layers that has the given `name`, or null if an
		invalid `name` is given.
	**/
	function getLayerIndexByName(name:String):Float;
	/**
		Gets a tile at the given tile coordinates from the given layer.
		
		If no layer is specified, the maps current layer is used.
	**/
	function getTileAt(tileX:Float, tileY:Float, ?nonNull:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tile;
	/**
		Gets a tile at the given world coordinates from the given layer.
		
		If no layer is specified, the maps current layer is used.
	**/
	function getTileAtWorldXY(worldX:Float, worldY:Float, ?nonNull:Bool, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tile;
	/**
		Return a list of all valid tilelayer names loaded in this Tilemap.
	**/
	function getTileLayerNames():Array<String>;
	/**
		Gets the tiles in the given rectangular area (in tile coordinates) of the layer.
		
		If no layer is specified, the maps current layer is used.
	**/
	function getTilesWithin(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Array<Tile>;
	/**
		Gets the tiles that overlap with the given shape in the given layer. The shape must be a Circle,
		Line, Rectangle or Triangle. The shape should be in world coordinates.
		
		If no layer is specified, the maps current layer is used.
	**/
	function getTilesWithinShape(shape:ts.AnyOf4<global.phaser.geom.Triangle, global.phaser.geom.Circle, global.phaser.geom.Line, global.phaser.geom.Rectangle>, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Array<Tile>;
	/**
		Gets the tiles in the given rectangular area (in world coordinates) of the layer.
		
		If no layer is specified, the maps current layer is used.
	**/
	function getTilesWithinWorldXY(worldX:Float, worldY:Float, width:Float, height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Array<Tile>;
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
		
		If no layer is specified, the maps current layer is used.
	**/
	function hasTileAt(tileX:Float, tileY:Float, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Bool;
	/**
		Checks if there is a tile at the given location (in world coordinates) in the given layer. Returns
		false if there is no tile or if the tile at that location has an index of -1.
		
		If no layer is specified, the maps current layer is used.
	**/
	function hasTileAtWorldXY(worldX:Float, worldY:Float, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Bool;
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
		
		If no layer is specified, the maps current layer is used.
	**/
	function putTileAt(tile:ts.AnyOf2<Float, Tile>, tileX:Float, tileY:Float, ?recalculateFaces:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tile;
	/**
		Puts a tile at the given world coordinates (pixels) in the specified layer. You can pass in either
		an index or a Tile object. If you pass in a Tile, all attributes will be copied over to the
		specified location. If you pass in an index, only the index at the specified location will be
		changed. Collision information will be recalculated at the specified location.
		
		If no layer is specified, the maps current layer is used.
	**/
	function putTileAtWorldXY(tile:ts.AnyOf2<Float, Tile>, worldX:Float, worldY:Float, ?recalculateFaces:Bool, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tile;
	/**
		Puts an array of tiles or a 2D array of tiles at the given tile coordinates in the specified
		layer. The array can be composed of either tile indexes or Tile objects. If you pass in a Tile,
		all attributes will be copied over to the specified location. If you pass in an index, only the
		index at the specified location will be changed. Collision information will be recalculated
		within the region tiles were changed.
		
		If no layer is specified, the maps current layer is used.
	**/
	function putTilesAt(tile:ts.AnyOf4<Array<Float>, Array<Array<Float>>, Array<Tile>, Array<Array<Tile>>>, tileX:Float, tileY:Float, ?recalculateFaces:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Randomizes the indexes of a rectangular region of tiles (in tile coordinates) within the
		specified layer. Each tile will receive a new index. If an array of indexes is passed in, then
		those will be used for randomly assigning new tile indexes. If an array is not provided, the
		indexes found within the region (excluding -1) will be used for randomly assigning new tile
		indexes. This method only modifies tile indexes and does not change collision information.
		
		If no layer is specified, the maps current layer is used.
	**/
	function randomize(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?indexes:Array<Float>, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Calculates interesting faces at the given tile coordinates of the specified layer. Interesting
		faces are used internally for optimizing collisions against tiles. This method is mostly used
		internally to optimize recalculating faces when only one tile has been changed.
		
		If no layer is specified, the maps current layer is used.
	**/
	function calculateFacesAt(tileX:Float, tileY:Float, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Calculates interesting faces within the rectangular area specified (in tile coordinates) of the
		layer. Interesting faces are used internally for optimizing collisions against tiles. This method
		is mostly used internally.
		
		If no layer is specified, the maps current layer is used.
	**/
	function calculateFacesWithin(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Removes the given TilemapLayer from this Tilemap without destroying it.
		
		If no layer is specified, the maps current layer is used.
	**/
	function removeLayer(?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Destroys the given TilemapLayer and removes it from this Tilemap.
		
		If no layer is specified, the maps current layer is used.
	**/
	function destroyLayer(?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Removes all Tilemap Layers from this Tilemap and calls `destroy` on each of them.
	**/
	function removeAllLayers():Tilemap;
	/**
		Removes the given Tile, or an array of Tiles, from the layer to which they belong,
		and optionally recalculates the collision information.
	**/
	function removeTile(tiles:ts.AnyOf2<Tile, Array<Tile>>, ?replaceIndex:Float, ?recalculateFaces:Bool):Array<Tile>;
	/**
		Removes the tile at the given tile coordinates in the specified layer and updates the layers collision information.
		
		If no layer is specified, the maps current layer is used.
	**/
	function removeTileAt(tileX:Float, tileY:Float, ?replaceWithNull:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tile;
	/**
		Removes the tile at the given world coordinates in the specified layer and updates the layers collision information.
		
		If no layer is specified, the maps current layer is used.
	**/
	function removeTileAtWorldXY(worldX:Float, worldY:Float, ?replaceWithNull:Bool, ?recalculateFaces:Bool, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tile;
	/**
		Draws a debug representation of the layer to the given Graphics object. This is helpful when you want to
		get a quick idea of which of your tiles are colliding and which have interesting faces. The tiles
		are drawn starting at (0, 0) in the Graphics, allowing you to place the debug representation
		wherever you want on the screen.
		
		If no layer is specified, the maps current layer is used.
		
		**Note:** This method currently only works with orthogonal tilemap layers.
	**/
	function renderDebug(graphics:global.phaser.gameobjects.Graphics, ?styleConfig:global.phaser.types.tilemaps.StyleConfig, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Draws a debug representation of all layers within this Tilemap to the given Graphics object.
		
		This is helpful when you want to get a quick idea of which of your tiles are colliding and which
		have interesting faces. The tiles are drawn starting at (0, 0) in the Graphics, allowing you to
		place the debug representation wherever you want on the screen.
	**/
	function renderDebugFull(graphics:global.phaser.gameobjects.Graphics, ?styleConfig:global.phaser.types.tilemaps.StyleConfig):Tilemap;
	/**
		Scans the given rectangular area (given in tile coordinates) for tiles with an index matching
		`findIndex` and updates their index to match `newIndex`. This only modifies the index and does
		not change collision information.
		
		If no layer is specified, the maps current layer is used.
	**/
	function replaceByIndex(findIndex:Float, newIndex:Float, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Sets collision on the given tile or tiles within a layer by index. You can pass in either a
		single numeric index or an array of indexes: [2, 3, 15, 20]. The `collides` parameter controls if
		collision will be enabled (true) or disabled (false).
		
		If no layer is specified, the maps current layer is used.
	**/
	function setCollision(indexes:ts.AnyOf2<Float, Array<Dynamic>>, ?collides:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>, ?updateLayer:Bool):Tilemap;
	/**
		Sets collision on a range of tiles in a layer whose index is between the specified `start` and
		`stop` (inclusive). Calling this with a start value of 10 and a stop value of 14 would set
		collision for tiles 10, 11, 12, 13 and 14. The `collides` parameter controls if collision will be
		enabled (true) or disabled (false).
		
		If no layer is specified, the maps current layer is used.
	**/
	function setCollisionBetween(start:Float, stop:Float, ?collides:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Sets collision on the tiles within a layer by checking tile properties. If a tile has a property
		that matches the given properties object, its collision flag will be set. The `collides`
		parameter controls if collision will be enabled (true) or disabled (false). Passing in
		`{ collides: true }` would update the collision flag on any tiles with a "collides" property that
		has a value of true. Any tile that doesn't have "collides" set to true will be ignored. You can
		also use an array of values, e.g. `{ types: ["stone", "lava", "sand" ] }`. If a tile has a
		"types" property that matches any of those values, its collision flag will be updated.
		
		If no layer is specified, the maps current layer is used.
	**/
	function setCollisionByProperty(properties:Dynamic, ?collides:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Sets collision on all tiles in the given layer, except for tiles that have an index specified in
		the given array. The `collides` parameter controls if collision will be enabled (true) or
		disabled (false). Tile indexes not currently in the layer are not affected.
		
		If no layer is specified, the maps current layer is used.
	**/
	function setCollisionByExclusion(indexes:Array<Float>, ?collides:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Sets collision on the tiles within a layer by checking each tiles collision group data
		(typically defined in Tiled within the tileset collision editor). If any objects are found within
		a tiles collision group, the tiles colliding information will be set. The `collides` parameter
		controls if collision will be enabled (true) or disabled (false).
		
		If no layer is specified, the maps current layer is used.
	**/
	function setCollisionFromCollisionGroup(?collides:Bool, ?recalculateFaces:Bool, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Sets a global collision callback for the given tile index within the layer. This will affect all
		tiles on this layer that have the same index. If a callback is already set for the tile index it
		will be replaced. Set the callback to null to remove it. If you want to set a callback for a tile
		at a specific location on the map then see `setTileLocationCallback`.
		
		If no layer is specified, the maps current layer is used.
	**/
	function setTileIndexCallback(indexes:ts.AnyOf2<Float, Array<Float>>, callback:haxe.Constraints.Function, callbackContext:Dynamic, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Sets a collision callback for the given rectangular area (in tile coordinates) within the layer.
		If a callback is already set for the tile index it will be replaced. Set the callback to null to
		remove it.
		
		If no layer is specified, the maps current layer is used.
	**/
	function setTileLocationCallback(tileX:Float, tileY:Float, width:Float, height:Float, callback:haxe.Constraints.Function, ?callbackContext:Dynamic, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Sets the current layer to the LayerData associated with `layer`.
	**/
	function setLayer(?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Sets the base tile size for the map. Note: this does not necessarily match the tileWidth and
		tileHeight for all layers. This also updates the base size on all tiles across all layers.
	**/
	function setBaseTileSize(tileWidth:Float, tileHeight:Float):Tilemap;
	/**
		Sets the tile size for a specific `layer`. Note: this does not necessarily match the maps
		tileWidth and tileHeight for all layers. This will set the tile size for the layer and any
		tiles the layer has.
	**/
	function setLayerTileSize(tileWidth:Float, tileHeight:Float, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Shuffles the tiles in a rectangular region (specified in tile coordinates) within the given
		layer. It will only randomize the tiles in that area, so if they're all the same nothing will
		appear to have changed! This method only modifies tile indexes and does not change collision
		information.
		
		If no layer is specified, the maps current layer is used.
	**/
	function shuffle(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Scans the given rectangular area (given in tile coordinates) for tiles with an index matching
		`indexA` and swaps then with `indexB`. This only modifies the index and does not change collision
		information.
		
		If no layer is specified, the maps current layer is used.
	**/
	function swapByIndex(tileA:Float, tileB:Float, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Converts from tile X coordinates (tile units) to world X coordinates (pixels), factoring in the
		layers position, scale and scroll.
		
		If no layer is specified, the maps current layer is used.
	**/
	function tileToWorldX(tileX:Float, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Float;
	/**
		Converts from tile Y coordinates (tile units) to world Y coordinates (pixels), factoring in the
		layers position, scale and scroll.
		
		If no layer is specified, the maps current layer is used.
	**/
	function tileToWorldY(tileY:Float, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Float;
	/**
		Converts from tile XY coordinates (tile units) to world XY coordinates (pixels), factoring in the
		layers position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
		
		If no layer is specified, the maps current layer is used.
	**/
	function tileToWorldXY(tileX:Float, tileY:Float, ?vec2:global.phaser.math.Vector2, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):global.phaser.math.Vector2;
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
		
		The probability of any index being picked is (the indexs weight) / (sum of all weights). This
		method only modifies tile indexes and does not change collision information.
		
		If no layer is specified, the maps current layer is used.
	**/
	function weightedRandomize(weightedIndexes:Array<Dynamic>, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Tilemap;
	/**
		Converts from world X coordinates (pixels) to tile X coordinates (tile units), factoring in the
		layers position, scale and scroll.
		
		If no layer is specified, the maps current layer is used.
	**/
	function worldToTileX(worldX:Float, ?snapToFloor:Bool, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Float;
	/**
		Converts from world Y coordinates (pixels) to tile Y coordinates (tile units), factoring in the
		layers position, scale and scroll.
		
		If no layer is specified, the maps current layer is used.
	**/
	function worldToTileY(worldY:Float, ?snapToFloor:Bool, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):Float;
	/**
		Converts from world XY coordinates (pixels) to tile XY coordinates (tile units), factoring in the
		layers position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
		
		If no layer is specified, the maps current layer is used.
	**/
	function worldToTileXY(worldX:Float, worldY:Float, ?snapToFloor:Bool, ?vec2:global.phaser.math.Vector2, ?camera:global.phaser.cameras.scene2d.Camera, ?layer:ts.AnyOf3<String, Float, TilemapLayer>):global.phaser.math.Vector2;
	/**
		Removes all layer data from this Tilemap and nulls the scene reference. This will destroy any
		TilemapLayers that have been created.
	**/
	function destroy():Void;
	static var prototype : Tilemap;
}