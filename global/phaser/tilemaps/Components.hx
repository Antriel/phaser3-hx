package global.phaser.tilemaps;

@:native("Phaser.Tilemaps.Components") @valueModuleOnly extern class Components {
	/**
		Calculates interesting faces at the given tile coordinates of the specified layer. Interesting
		faces are used internally for optimizing collisions against tiles. This method is mostly used
		internally to optimize recalculating faces when only one tile has been changed.
	**/
	static function CalculateFacesAt(tileX:Float, tileY:Float, layer:LayerData):Void;
	/**
		Calculates interesting faces within the rectangular area specified (in tile coordinates) of the
		layer. Interesting faces are used internally for optimizing collisions against tiles. This method
		is mostly used internally.
	**/
	static function CalculateFacesWithin(tileX:Float, tileY:Float, width:Float, height:Float, layer:LayerData):Void;
	/**
		Checks if the given tile coordinate is within the isometric layer bounds, or not.
	**/
	static function CheckIsoBounds(tileX:Float, tileY:Float, layer:LayerData, ?camera:global.phaser.cameras.scene2d.Camera):Bool;
	/**
		Copies the tiles in the source rectangular area to a new destination (all specified in tile
		coordinates) within the layer. This copies all tile properties & recalculates collision
		information in the destination region.
	**/
	static function Copy(srcTileX:Float, srcTileY:Float, width:Float, height:Float, destTileX:Float, destTileY:Float, recalculateFaces:Bool, layer:LayerData):Void;
	/**
		Creates a Sprite for every object matching the given tile indexes in the layer. You can
		optionally specify if each tile will be replaced with a new tile after the Sprite has been
		created. This is useful if you want to lay down special tiles in a level that are converted to
		Sprites, but want to replace the tile itself with a floor tile or similar once converted.
	**/
	static function CreateFromTiles(indexes:ts.AnyOf2<Float, Array<Float>>, replacements:ts.AnyOf2<Float, Array<Float>>, spriteConfig:global.phaser.types.gameobjects.sprite.SpriteConfig, scene:global.phaser.Scene, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Array<global.phaser.gameobjects.Sprite>;
	/**
		Returns the bounds in the given orthogonal layer that are within the cameras viewport.
		This is used internally by the cull tiles function.
	**/
	static function CullBounds(layer:LayerData, camera:global.phaser.cameras.scene2d.Camera):global.phaser.geom.Rectangle;
	/**
		Returns the tiles in the given layer that are within the cameras viewport. This is used internally.
	**/
	static function CullTiles(layer:LayerData, camera:global.phaser.cameras.scene2d.Camera, ?outputArray:Array<Dynamic>, ?renderOrder:Float):Array<Tile>;
	/**
		Sets the tiles in the given rectangular area (in tile coordinates) of the layer with the
		specified index. Tiles will be set to collide if the given index is a colliding index.
		Collision information in the region will be recalculated.
	**/
	static function Fill(index:Float, tileX:Float, tileY:Float, width:Float, height:Float, recalculateFaces:Bool, layer:LayerData):Void;
	/**
		For each tile in the given rectangular area (in tile coordinates) of the layer, run the given
		filter callback function. Any tiles that pass the filter test (i.e. where the callback returns
		true) will returned as a new array. Similar to Array.prototype.Filter in vanilla JS.
	**/
	static function FilterTiles(callback:haxe.Constraints.Function, context:Dynamic, tileX:Float, tileY:Float, width:Float, height:Float, filteringOptions:global.phaser.types.tilemaps.FilteringOptions, layer:LayerData):Array<Tile>;
	/**
		Searches the entire map layer for the first tile matching the given index, then returns that Tile
		object. If no match is found, it returns null. The search starts from the top-left tile and
		continues horizontally until it hits the end of the row, then it drops down to the next column.
		If the reverse boolean is true, it scans starting from the bottom-right corner traveling up to
		the top-left.
	**/
	static function FindByIndex(index:Float, skip:Float, reverse:Bool, layer:LayerData):Tile;
	/**
		Find the first tile in the given rectangular area (in tile coordinates) of the layer that
		satisfies the provided testing function. I.e. finds the first tile for which `callback` returns
		true. Similar to Array.prototype.find in vanilla JS.
	**/
	static function FindTile(callback:global.FindTileCallback, context:Dynamic, tileX:Float, tileY:Float, width:Float, height:Float, filteringOptions:global.phaser.types.tilemaps.FilteringOptions, layer:LayerData):Tile;
	/**
		For each tile in the given rectangular area (in tile coordinates) of the layer, run the given
		callback. Similar to Array.prototype.forEach in vanilla JS.
	**/
	static function ForEachTile(callback:global.EachTileCallback, context:Dynamic, tileX:Float, tileY:Float, width:Float, height:Float, filteringOptions:global.phaser.types.tilemaps.FilteringOptions, layer:LayerData):Void;
	/**
		Gets the correct function to use to cull tiles, based on the map orientation.
	**/
	static function GetCullTilesFunction(orientation:Float):haxe.Constraints.Function;
	/**
		Gets a tile at the given tile coordinates from the given layer.
	**/
	static function GetTileAt(tileX:Float, tileY:Float, nonNull:Bool, layer:LayerData):Tile;
	/**
		Gets a tile at the given world coordinates from the given layer.
	**/
	static function GetTileAtWorldXY(worldX:Float, worldY:Float, nonNull:Bool, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Tile;
	/**
		Gets the correct function to use to translate tiles, based on the map orientation.
	**/
	static function GetTileToWorldXFunction(orientation:Float):haxe.Constraints.Function;
	/**
		Gets the correct function to use to translate tiles, based on the map orientation.
	**/
	static function GetTileToWorldXYFunction(orientation:Float):haxe.Constraints.Function;
	/**
		Gets the correct function to use to translate tiles, based on the map orientation.
	**/
	static function GetTileToWorldYFunction(orientation:Float):haxe.Constraints.Function;
	/**
		Gets the tiles in the given rectangular area (in tile coordinates) of the layer.
	**/
	static function GetTilesWithin(tileX:Float, tileY:Float, width:Float, height:Float, filteringOptions:global.phaser.types.tilemaps.FilteringOptions, layer:LayerData):Array<Tile>;
	/**
		Gets the tiles that overlap with the given shape in the given layer. The shape must be a Circle,
		Line, Rectangle or Triangle. The shape should be in world coordinates.
	**/
	static function GetTilesWithinShape(shape:ts.AnyOf4<global.phaser.geom.Triangle, global.phaser.geom.Circle, global.phaser.geom.Line, global.phaser.geom.Rectangle>, filteringOptions:global.phaser.types.tilemaps.FilteringOptions, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Array<Tile>;
	/**
		Gets the tiles in the given rectangular area (in world coordinates) of the layer.
	**/
	static function GetTilesWithinWorldXY(worldX:Float, worldY:Float, width:Float, height:Float, filteringOptions:global.phaser.types.tilemaps.FilteringOptions, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Array<Tile>;
	/**
		Gets the correct function to use to translate tiles, based on the map orientation.
	**/
	static function GetWorldToTileXFunction(orientation:Float):haxe.Constraints.Function;
	/**
		Gets the correct function to use to translate tiles, based on the map orientation.
	**/
	static function GetWorldToTileXYFunction(orientation:Float):haxe.Constraints.Function;
	/**
		Gets the correct function to use to translate tiles, based on the map orientation.
	**/
	static function GetWorldToTileYFunction(orientation:Float):haxe.Constraints.Function;
	/**
		Checks if there is a tile at the given location (in tile coordinates) in the given layer. Returns
		false if there is no tile or if the tile at that location has an index of -1.
	**/
	static function HasTileAt(tileX:Float, tileY:Float, layer:LayerData):Bool;
	/**
		Checks if there is a tile at the given location (in world coordinates) in the given layer. Returns
		false if there is no tile or if the tile at that location has an index of -1.
	**/
	static function HasTileAtWorldXY(worldX:Float, worldY:Float, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Bool;
	/**
		Returns the bounds in the given layer that are within the camera's viewport.
		This is used internally by the cull tiles function.
	**/
	static function HexagonalCullBounds(layer:LayerData, camera:global.phaser.cameras.scene2d.Camera):Dynamic;
	/**
		Returns the tiles in the given layer that are within the cameras viewport. This is used internally.
	**/
	static function HexagonalCullTiles(layer:LayerData, camera:global.phaser.cameras.scene2d.Camera, ?outputArray:Array<Dynamic>, ?renderOrder:Float):Array<Tile>;
	/**
		Converts from hexagonal tile XY coordinates (tile units) to world XY coordinates (pixels), factoring in the
		layer's position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	static function HexagonalTileToWorldXY(tileX:Float, tileY:Float, point:global.phaser.math.Vector2, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):global.phaser.math.Vector2;
	/**
		Converts from hexagonal tile Y coordinates (tile units) to world Y coordinates (pixels), factoring in the
		layer's position, scale and scroll.
	**/
	static function HexagonalTileToWorldY(tileY:Float, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Float;
	/**
		Converts from world XY coordinates (pixels) to hexagonal tile XY coordinates (tile units), factoring in the
		layer's position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	static function HexagonalWorldToTileXY(worldX:Float, worldY:Float, snapToFloor:Bool, point:global.phaser.math.Vector2, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):global.phaser.math.Vector2;
	/**
		Converts from world Y coordinates (pixels) to hexagonal tile Y coordinates (tile units), factoring in the
		layers position, scale and scroll.
	**/
	static function HexagonalWorldToTileY(worldY:Float, snapToFloor:Bool, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Float;
	/**
		Checks if the given tile coordinates are within the bounds of the layer.
	**/
	static function IsInLayerBounds(tileX:Float, tileY:Float, layer:LayerData):Bool;
	/**
		Returns the tiles in the given layer that are within the cameras viewport. This is used internally.
	**/
	static function IsometricCullTiles(layer:LayerData, camera:global.phaser.cameras.scene2d.Camera, ?outputArray:Array<Dynamic>, ?renderOrder:Float):Array<Tile>;
	/**
		Converts from isometric tile XY coordinates (tile units) to world XY coordinates (pixels), factoring in the
		layer's position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	static function IsometricTileToWorldXY(tileX:Float, tileY:Float, point:global.phaser.math.Vector2, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):global.phaser.math.Vector2;
	/**
		Converts from world XY coordinates (pixels) to isometric tile XY coordinates (tile units), factoring in the
		layer's position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	static function IsometricWorldToTileXY(worldX:Float, worldY:Float, snapToFloor:Bool, point:global.phaser.math.Vector2, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):global.phaser.math.Vector2;
	/**
		Puts a tile at the given tile coordinates in the specified layer. You can pass in either an index
		or a Tile object. If you pass in a Tile, all attributes will be copied over to the specified
		location. If you pass in an index, only the index at the specified location will be changed.
		Collision information will be recalculated at the specified location.
	**/
	static function PutTileAt(tile:ts.AnyOf2<Float, Tile>, tileX:Float, tileY:Float, recalculateFaces:Bool, layer:LayerData):Tile;
	/**
		Puts a tile at the given world coordinates (pixels) in the specified layer. You can pass in either
		an index or a Tile object. If you pass in a Tile, all attributes will be copied over to the
		specified location. If you pass in an index, only the index at the specified location will be
		changed. Collision information will be recalculated at the specified location.
	**/
	static function PutTileAtWorldXY(tile:ts.AnyOf2<Float, Tile>, worldX:Float, worldY:Float, recalculateFaces:Bool, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Tile;
	/**
		Puts an array of tiles or a 2D array of tiles at the given tile coordinates in the specified
		layer. The array can be composed of either tile indexes or Tile objects. If you pass in a Tile,
		all attributes will be copied over to the specified location. If you pass in an index, only the
		index at the specified location will be changed. Collision information will be recalculated
		within the region tiles were changed.
	**/
	static function PutTilesAt(tile:ts.AnyOf4<Array<Float>, Array<Array<Float>>, Array<Tile>, Array<Array<Tile>>>, tileX:Float, tileY:Float, recalculateFaces:Bool, layer:LayerData):Void;
	/**
		Randomizes the indexes of a rectangular region of tiles (in tile coordinates) within the
		specified layer. Each tile will receive a new index. If an array of indexes is passed in, then
		those will be used for randomly assigning new tile indexes. If an array is not provided, the
		indexes found within the region (excluding -1) will be used for randomly assigning new tile
		indexes. This method only modifies tile indexes and does not change collision information.
	**/
	static function Randomize(tileX:Float, tileY:Float, width:Float, height:Float, indexes:Array<Float>, layer:LayerData):Void;
	/**
		Removes the tile at the given tile coordinates in the specified layer and updates the layer's
		collision information.
	**/
	static function RemoveTileAt(tileX:Float, tileY:Float, replaceWithNull:Bool, recalculateFaces:Bool, layer:LayerData):Tile;
	/**
		Removes the tile at the given world coordinates in the specified layer and updates the layer's
		collision information.
	**/
	static function RemoveTileAtWorldXY(worldX:Float, worldY:Float, replaceWithNull:Bool, recalculateFaces:Bool, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Tile;
	/**
		Draws a debug representation of the layer to the given Graphics. This is helpful when you want to
		get a quick idea of which of your tiles are colliding and which have interesting faces. The tiles
		are drawn starting at (0, 0) in the Graphics, allowing you to place the debug representation
		wherever you want on the screen.
	**/
	static function RenderDebug(graphics:global.phaser.gameobjects.Graphics, styleConfig:global.phaser.types.tilemaps.DebugStyleOptions, layer:LayerData):Void;
	/**
		Scans the given rectangular area (given in tile coordinates) for tiles with an index matching
		`findIndex` and updates their index to match `newIndex`. This only modifies the index and does
		not change collision information.
	**/
	static function ReplaceByIndex(findIndex:Float, newIndex:Float, tileX:Float, tileY:Float, width:Float, height:Float, layer:LayerData):Void;
	/**
		Returns the tiles in the given layer that are within the cameras viewport. This is used internally.
	**/
	static function RunCull(layer:LayerData, bounds:Dynamic, renderOrder:Float, outputArray:Array<Dynamic>):Array<Tile>;
	/**
		Sets collision on the given tile or tiles within a layer by index. You can pass in either a
		single numeric index or an array of indexes: [2, 3, 15, 20]. The `collides` parameter controls if
		collision will be enabled (true) or disabled (false).
	**/
	static function SetCollision(indexes:ts.AnyOf2<Float, Array<Dynamic>>, collides:Bool, recalculateFaces:Bool, layer:LayerData, ?updateLayer:Bool):Void;
	/**
		Sets collision on a range of tiles in a layer whose index is between the specified `start` and
		`stop` (inclusive). Calling this with a start value of 10 and a stop value of 14 would set
		collision for tiles 10, 11, 12, 13 and 14. The `collides` parameter controls if collision will be
		enabled (true) or disabled (false).
	**/
	static function SetCollisionBetween(start:Float, stop:Float, collides:Bool, recalculateFaces:Bool, layer:LayerData, ?updateLayer:Bool):Void;
	/**
		Sets collision on all tiles in the given layer, except for tiles that have an index specified in
		the given array. The `collides` parameter controls if collision will be enabled (true) or
		disabled (false). Tile indexes not currently in the layer are not affected.
	**/
	static function SetCollisionByExclusion(indexes:Array<Float>, collides:Bool, recalculateFaces:Bool, layer:LayerData):Void;
	/**
		Sets collision on the tiles within a layer by checking tile properties. If a tile has a property
		that matches the given properties object, its collision flag will be set. The `collides`
		parameter controls if collision will be enabled (true) or disabled (false). Passing in
		`{ collides: true }` would update the collision flag on any tiles with a "collides" property that
		has a value of true. Any tile that doesn't have "collides" set to true will be ignored. You can
		also use an array of values, e.g. `{ types: ["stone", "lava", "sand" ] }`. If a tile has a
		"types" property that matches any of those values, its collision flag will be updated.
	**/
	static function SetCollisionByProperty(properties:Dynamic, collides:Bool, recalculateFaces:Bool, layer:LayerData):Void;
	/**
		Sets collision on the tiles within a layer by checking each tile's collision group data
		(typically defined in Tiled within the tileset collision editor). If any objects are found within
		a tile's collision group, the tile's colliding information will be set. The `collides` parameter
		controls if collision will be enabled (true) or disabled (false).
	**/
	static function SetCollisionFromCollisionGroup(collides:Bool, recalculateFaces:Bool, layer:LayerData):Void;
	/**
		Internally used method to keep track of the tile indexes that collide within a layer. This
		updates LayerData.collideIndexes to either contain or not contain the given `tileIndex`.
	**/
	static function SetLayerCollisionIndex(tileIndex:Float, collides:Bool, layer:LayerData):Void;
	/**
		Internally used method to set the colliding state of a tile. This does not recalculate
		interesting faces.
	**/
	static function SetTileCollision(tile:Tile, ?collides:Bool):Void;
	/**
		Sets a global collision callback for the given tile index within the layer. This will affect all
		tiles on this layer that have the same index. If a callback is already set for the tile index it
		will be replaced. Set the callback to null to remove it. If you want to set a callback for a tile
		at a specific location on the map then see setTileLocationCallback.
	**/
	static function SetTileIndexCallback(indexes:ts.AnyOf2<Float, Array<Dynamic>>, callback:haxe.Constraints.Function, callbackContext:Dynamic, layer:LayerData):Void;
	/**
		Sets a collision callback for the given rectangular area (in tile coordinates) within the layer.
		If a callback is already set for the tile index it will be replaced. Set the callback to null to
		remove it.
	**/
	static function SetTileLocationCallback(tileX:Float, tileY:Float, width:Float, height:Float, callback:haxe.Constraints.Function, callbackContext:Dynamic, layer:LayerData):Void;
	/**
		Shuffles the tiles in a rectangular region (specified in tile coordinates) within the given
		layer. It will only randomize the tiles in that area, so if they're all the same nothing will
		appear to have changed! This method only modifies tile indexes and does not change collision
		information.
	**/
	static function Shuffle(tileX:Float, tileY:Float, width:Float, height:Float, layer:LayerData):Void;
	/**
		Returns the bounds in the given layer that are within the camera's viewport.
		This is used internally by the cull tiles function.
	**/
	static function StaggeredCullBounds(layer:LayerData, camera:global.phaser.cameras.scene2d.Camera):Dynamic;
	/**
		Returns the tiles in the given layer that are within the cameras viewport. This is used internally.
	**/
	static function StaggeredCullTiles(layer:LayerData, camera:global.phaser.cameras.scene2d.Camera, ?outputArray:Array<Dynamic>, ?renderOrder:Float):Array<Tile>;
	/**
		Converts from staggered tile XY coordinates (tile units) to world XY coordinates (pixels), factoring in the
		layer's position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	static function StaggeredTileToWorldXY(tileX:Float, tileY:Float, point:global.phaser.math.Vector2, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):global.phaser.math.Vector2;
	/**
		Converts from staggered tile Y coordinates (tile units) to world Y coordinates (pixels), factoring in the
		layers position, scale and scroll.
	**/
	static function StaggeredTileToWorldY(tileY:Float, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Float;
	/**
		Converts from world XY coordinates (pixels) to staggered tile XY coordinates (tile units), factoring in the
		layer's position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	static function StaggeredWorldToTileXY(worldX:Float, worldY:Float, snapToFloor:Bool, point:global.phaser.math.Vector2, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):global.phaser.math.Vector2;
	/**
		Converts from world Y coordinates (pixels) to staggered tile Y coordinates (tile units), factoring in the
		layers position, scale and scroll.
	**/
	static function StaggeredWorldToTileY(worldY:Float, snapToFloor:Bool, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Float;
	/**
		Scans the given rectangular area (given in tile coordinates) for tiles with an index matching
		`indexA` and swaps then with `indexB`. This only modifies the index and does not change collision
		information.
	**/
	static function SwapByIndex(tileA:Float, tileB:Float, tileX:Float, tileY:Float, width:Float, height:Float, layer:LayerData):Void;
	/**
		Converts from tile X coordinates (tile units) to world X coordinates (pixels), factoring in the
		layer's position, scale and scroll.
	**/
	static function TileToWorldX(tileX:Float, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Float;
	/**
		Converts from tile XY coordinates (tile units) to world XY coordinates (pixels), factoring in the
		layer's position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	static function TileToWorldXY(tileX:Float, tileY:Float, point:global.phaser.math.Vector2, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):global.phaser.math.Vector2;
	/**
		Converts from tile Y coordinates (tile units) to world Y coordinates (pixels), factoring in the
		layer's position, scale and scroll.
	**/
	static function TileToWorldY(tileY:Float, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Float;
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
	**/
	static function WeightedRandomize(tileX:Float, tileY:Float, width:Float, height:Float, weightedIndexes:Array<Dynamic>, layer:LayerData):Void;
	/**
		Converts from world X coordinates (pixels) to tile X coordinates (tile units), factoring in the
		layer's position, scale and scroll.
	**/
	static function WorldToTileX(worldX:Float, snapToFloor:Bool, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Float;
	/**
		Converts from world XY coordinates (pixels) to tile XY coordinates (tile units), factoring in the
		layer's position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	static function WorldToTileXY(worldX:Float, worldY:Float, snapToFloor:Bool, point:global.phaser.math.Vector2, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):global.phaser.math.Vector2;
	/**
		Converts from world Y coordinates (pixels) to tile Y coordinates (tile units), factoring in the
		layer's position, scale and scroll.
	**/
	static function WorldToTileY(worldY:Float, snapToFloor:Bool, camera:global.phaser.cameras.scene2d.Camera, layer:LayerData):Float;
}