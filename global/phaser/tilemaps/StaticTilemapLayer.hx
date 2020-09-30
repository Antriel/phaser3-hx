package global.phaser.tilemaps;

/**
	A Static Tilemap Layer is a Game Object that renders LayerData from a Tilemap when used in combination
	with one, or more, Tilesets.
	
	A Static Tilemap Layer is optimized for rendering speed over flexibility. You cannot apply per-tile
	effects like tint or alpha, or change the tiles or tilesets the layer uses.
	
	Use a Static Tilemap Layer instead of a Dynamic Tilemap Layer when you don't need tile manipulation features.
**/
@:native("Phaser.Tilemaps.StaticTilemapLayer") extern class StaticTilemapLayer extends global.phaser.gameobjects.GameObject {
	function new(scene:global.phaser.Scene, tilemap:Tilemap, layerIndex:Float, tileset:ts.AnyOf4<String, Array<String>, Tileset, Array<Tileset>>, ?x:Float, ?y:Float);
	/**
		Used internally by physics system to perform fast type checks.
	**/
	final isTilemap : Bool;
	/**
		The Tilemap that this layer is a part of.
	**/
	var tilemap : Tilemap;
	/**
		The index of the LayerData associated with this layer.
	**/
	var layerIndex : Float;
	/**
		The LayerData associated with this layer. LayerData can only be associated with one
		tilemap layer.
	**/
	var layer : LayerData;
	/**
		The Tileset/s associated with this layer.
		
		As of Phaser 3.14 this property is now an array of Tileset objects, previously it was a single reference.
	**/
	var tileset : Array<Tileset>;
	/**
		Used internally by the Canvas renderer.
		This holds the tiles that are visible within the camera in the last frame.
	**/
	var culledTiles : Array<Dynamic>;
	/**
		Canvas only.
		
		You can control if the Cameras should cull tiles before rendering them or not.
		By default the camera will try to cull the tiles in this layer, to avoid over-drawing to the renderer.
		
		However, there are some instances when you may wish to disable this, and toggling this flag allows
		you to do so. Also see `setSkipCull` for a chainable method that does the same thing.
	**/
	var skipCull : Bool;
	/**
		Canvas only.
		
		The total number of tiles drawn by the renderer in the last frame.
		
		This only works when rending with Canvas.
	**/
	final tilesDrawn : Float;
	/**
		Canvas only.
		
		The total number of tiles in this layer. Updated every frame.
	**/
	final tilesTotal : Float;
	/**
		Canvas only.
		
		The amount of extra tiles to add into the cull rectangle when calculating its horizontal size.
		
		See the method `setCullPadding` for more details.
	**/
	var cullPaddingX : Float;
	/**
		Canvas only.
		
		The amount of extra tiles to add into the cull rectangle when calculating its vertical size.
		
		See the method `setCullPadding` for more details.
	**/
	var cullPaddingY : Float;
	/**
		Canvas only.
		
		The callback that is invoked when the tiles are culled.
		
		By default it will call `TilemapComponents.CullTiles` but you can override this to call any function you like.
		
		It will be sent 3 arguments:
		
		1. The Phaser.Tilemaps.LayerData object for this Layer
		2. The Camera that is culling the layer. You can check its `dirty` property to see if it has changed since the last cull.
		3. A reference to the `culledTiles` array, which should be used to store the tiles you want rendered.
		
		See the `TilemapComponents.CullTiles` source code for details on implementing your own culling system.
	**/
	var cullCallback : haxe.Constraints.Function;
	/**
		An array holding the mapping between the tile indexes and the tileset they belong to.
	**/
	var gidMap : Array<Tileset>;
	/**
		Upload the tile data to a VBO.
	**/
	function upload(camera:global.phaser.cameras.scene2d.Camera, tilesetIndex:Float):StaticTilemapLayer;
	/**
		Sets the rendering (draw) order of the tiles in this layer.
		
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
	**/
	function setRenderOrder(renderOrder:ts.AnyOf2<String, Float>):StaticTilemapLayer;
	/**
		Calculates interesting faces at the given tile coordinates of the specified layer. Interesting
		faces are used internally for optimizing collisions against tiles. This method is mostly used
		internally to optimize recalculating faces when only one tile has been changed.
	**/
	function calculateFacesAt(tileX:Float, tileY:Float):StaticTilemapLayer;
	/**
		Calculates interesting faces within the rectangular area specified (in tile coordinates) of the
		layer. Interesting faces are used internally for optimizing collisions against tiles. This method
		is mostly used internally.
	**/
	function calculateFacesWithin(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float):StaticTilemapLayer;
	/**
		Creates a Sprite for every object matching the given tile indexes in the layer. You can
		optionally specify if each tile will be replaced with a new tile after the Sprite has been
		created. This is useful if you want to lay down special tiles in a level that are converted to
		Sprites, but want to replace the tile itself with a floor tile or similar once converted.
	**/
	function createFromTiles(indexes:ts.AnyOf2<Float, Array<Dynamic>>, replacements:ts.AnyOf2<Float, Array<Dynamic>>, spriteConfig:global.phaser.types.gameobjects.sprite.SpriteConfig, ?scene:global.phaser.Scene, ?camera:global.phaser.cameras.scene2d.Camera):Array<global.phaser.gameobjects.Sprite>;
	/**
		Returns the tiles in the given layer that are within the cameras viewport.
		This is used internally.
	**/
	function cull(?camera:global.phaser.cameras.scene2d.Camera):Array<Tile>;
	/**
		Canvas only.
		
		You can control if the Cameras should cull tiles before rendering them or not.
		By default the camera will try to cull the tiles in this layer, to avoid over-drawing to the renderer.
		
		However, there are some instances when you may wish to disable this.
	**/
	function setSkipCull(?value:Bool):StaticTilemapLayer;
	/**
		Canvas only.
		
		When a Camera culls the tiles in this layer it does so using its view into the world, building up a
		rectangle inside which the tiles must exist or they will be culled. Sometimes you may need to expand the size
		of this 'cull rectangle', especially if you plan on rotating the Camera viewing the layer. Do so
		by providing the padding values. The values given are in tiles, not pixels. So if the tile width was 32px
		and you set `paddingX` to be 4, it would add 32px x 4 to the cull rectangle (adjusted for scale)
	**/
	function setCullPadding(?paddingX:Float, ?paddingY:Float):StaticTilemapLayer;
	/**
		Searches the entire map layer for the first tile matching the given index, then returns that Tile
		object. If no match is found, it returns null. The search starts from the top-left tile and
		continues horizontally until it hits the end of the row, then it drops down to the next column.
		If the reverse boolean is true, it scans starting from the bottom-right corner traveling up to
		the top-left.
	**/
	function findByIndex(index:Float, ?skip:Float, ?reverse:Bool):Tile;
	/**
		Find the first tile in the given rectangular area (in tile coordinates) of the layer that
		satisfies the provided testing function. I.e. finds the first tile for which `callback` returns
		true. Similar to Array.prototype.find in vanilla JS.
	**/
	function findTile(callback:haxe.Constraints.Function, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions):Tile;
	/**
		For each tile in the given rectangular area (in tile coordinates) of the layer, run the given
		filter callback function. Any tiles that pass the filter test (i.e. where the callback returns
		true) will returned as a new array. Similar to Array.prototype.Filter in vanilla JS.
	**/
	function filterTiles(callback:haxe.Constraints.Function, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions):Array<Tile>;
	/**
		For each tile in the given rectangular area (in tile coordinates) of the layer, run the given
		callback. Similar to Array.prototype.forEach in vanilla JS.
	**/
	function forEachTile(callback:haxe.Constraints.Function, ?context:Dynamic, ?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions):StaticTilemapLayer;
	/**
		Gets a tile at the given tile coordinates from the given layer.
	**/
	function getTileAt(tileX:Float, tileY:Float, ?nonNull:Bool):Tile;
	/**
		Gets a tile at the given world coordinates from the given layer.
	**/
	function getTileAtWorldXY(worldX:Float, worldY:Float, ?nonNull:Bool, ?camera:global.phaser.cameras.scene2d.Camera):Tile;
	/**
		Gets the tiles in the given rectangular area (in tile coordinates) of the layer.
	**/
	function getTilesWithin(?tileX:Float, ?tileY:Float, ?width:Float, ?height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions):Array<Tile>;
	/**
		Gets the tiles in the given rectangular area (in world coordinates) of the layer.
	**/
	function getTilesWithinWorldXY(worldX:Float, worldY:Float, width:Float, height:Float, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?camera:global.phaser.cameras.scene2d.Camera):Array<Tile>;
	/**
		Gets the tiles that overlap with the given shape in the given layer. The shape must be a Circle,
		Line, Rectangle or Triangle. The shape should be in world coordinates.
	**/
	function getTilesWithinShape(shape:ts.AnyOf4<global.phaser.geom.Triangle, global.phaser.geom.Circle, global.phaser.geom.Line, global.phaser.geom.Rectangle>, ?filteringOptions:global.phaser.types.tilemaps.FilteringOptions, ?camera:global.phaser.cameras.scene2d.Camera):Array<Tile>;
	/**
		Checks if there is a tile at the given location (in tile coordinates) in the given layer. Returns
		false if there is no tile or if the tile at that location has an index of -1.
	**/
	function hasTileAt(tileX:Float, tileY:Float):Bool;
	/**
		Checks if there is a tile at the given location (in world coordinates) in the given layer. Returns
		false if there is no tile or if the tile at that location has an index of -1.
	**/
	function hasTileAtWorldXY(worldX:Float, worldY:Float, ?camera:global.phaser.cameras.scene2d.Camera):Bool;
	/**
		Draws a debug representation of the layer to the given Graphics. This is helpful when you want to
		get a quick idea of which of your tiles are colliding and which have interesting faces. The tiles
		are drawn starting at (0, 0) in the Graphics, allowing you to place the debug representation
		wherever you want on the screen.
	**/
	function renderDebug(graphics:global.phaser.gameobjects.Graphics, styleConfig:global.phaser.types.tilemaps.StyleConfig):StaticTilemapLayer;
	/**
		Sets collision on the given tile or tiles within a layer by index. You can pass in either a
		single numeric index or an array of indexes: [2, 3, 15, 20]. The `collides` parameter controls if
		collision will be enabled (true) or disabled (false).
	**/
	function setCollision(indexes:ts.AnyOf2<Float, Array<Dynamic>>, ?collides:Bool, ?recalculateFaces:Bool, ?updateLayer:Bool):StaticTilemapLayer;
	/**
		Sets collision on a range of tiles in a layer whose index is between the specified `start` and
		`stop` (inclusive). Calling this with a start value of 10 and a stop value of 14 would set
		collision for tiles 10, 11, 12, 13 and 14. The `collides` parameter controls if collision will be
		enabled (true) or disabled (false).
	**/
	function setCollisionBetween(start:Float, stop:Float, ?collides:Bool, ?recalculateFaces:Bool):StaticTilemapLayer;
	/**
		Sets collision on the tiles within a layer by checking tile properties. If a tile has a property
		that matches the given properties object, its collision flag will be set. The `collides`
		parameter controls if collision will be enabled (true) or disabled (false). Passing in
		`{ collides: true }` would update the collision flag on any tiles with a "collides" property that
		has a value of true. Any tile that doesn't have "collides" set to true will be ignored. You can
		also use an array of values, e.g. `{ types: ["stone", "lava", "sand" ] }`. If a tile has a
		"types" property that matches any of those values, its collision flag will be updated.
	**/
	function setCollisionByProperty(properties:Dynamic, ?collides:Bool, ?recalculateFaces:Bool):StaticTilemapLayer;
	/**
		Sets collision on all tiles in the given layer, except for tiles that have an index specified in
		the given array. The `collides` parameter controls if collision will be enabled (true) or
		disabled (false). Tile indexes not currently in the layer are not affected.
	**/
	function setCollisionByExclusion(indexes:Array<Float>, ?collides:Bool, ?recalculateFaces:Bool):StaticTilemapLayer;
	/**
		Sets a global collision callback for the given tile index within the layer. This will affect all
		tiles on this layer that have the same index. If a callback is already set for the tile index it
		will be replaced. Set the callback to null to remove it. If you want to set a callback for a tile
		at a specific location on the map then see setTileLocationCallback.
	**/
	function setTileIndexCallback(indexes:ts.AnyOf2<Float, Array<Dynamic>>, callback:haxe.Constraints.Function, callbackContext:Dynamic):StaticTilemapLayer;
	/**
		Sets collision on the tiles within a layer by checking each tiles collision group data
		(typically defined in Tiled within the tileset collision editor). If any objects are found within
		a tiles collision group, the tile's colliding information will be set. The `collides` parameter
		controls if collision will be enabled (true) or disabled (false).
	**/
	function setCollisionFromCollisionGroup(?collides:Bool, ?recalculateFaces:Bool):StaticTilemapLayer;
	/**
		Sets a collision callback for the given rectangular area (in tile coordinates) within the layer.
		If a callback is already set for the tile index it will be replaced. Set the callback to null to
		remove it.
	**/
	function setTileLocationCallback(tileX:Float, tileY:Float, width:Float, height:Float, callback:haxe.Constraints.Function, ?callbackContext:Dynamic):StaticTilemapLayer;
	/**
		Converts from tile X coordinates (tile units) to world X coordinates (pixels), factoring in the
		layers position, scale and scroll.
	**/
	function tileToWorldX(tileX:Float, ?camera:global.phaser.cameras.scene2d.Camera):Float;
	/**
		Converts from tile Y coordinates (tile units) to world Y coordinates (pixels), factoring in the
		layers position, scale and scroll.
	**/
	function tileToWorldY(tileY:Float, ?camera:global.phaser.cameras.scene2d.Camera):Float;
	/**
		Converts from tile XY coordinates (tile units) to world XY coordinates (pixels), factoring in the
		layers position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	function tileToWorldXY(tileX:Float, tileY:Float, ?point:global.phaser.math.Vector2, ?camera:global.phaser.cameras.scene2d.Camera):global.phaser.math.Vector2;
	/**
		Converts from world X coordinates (pixels) to tile X coordinates (tile units), factoring in the
		layers position, scale and scroll.
	**/
	function worldToTileX(worldX:Float, ?snapToFloor:Bool, ?camera:global.phaser.cameras.scene2d.Camera):Float;
	/**
		Converts from world Y coordinates (pixels) to tile Y coordinates (tile units), factoring in the
		layers position, scale and scroll.
	**/
	function worldToTileY(worldY:Float, ?snapToFloor:Bool, ?camera:global.phaser.cameras.scene2d.Camera):Float;
	/**
		Converts from world XY coordinates (pixels) to tile XY coordinates (tile units), factoring in the
		layers position, scale and scroll. This will return a new Vector2 object or update the given
		`point` object.
	**/
	function worldToTileXY(worldX:Float, worldY:Float, ?snapToFloor:Bool, ?point:global.phaser.math.Vector2, ?camera:global.phaser.cameras.scene2d.Camera):global.phaser.math.Vector2;
	/**
		Destroys this StaticTilemapLayer and removes its link to the associated LayerData.
	**/
	function destroy(?removeFromTilemap:Bool):Void;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():StaticTilemapLayer;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
		
		If your game is running under WebGL you can optionally specify four different alpha values, each of which
		correspond to the four corners of the Game Object. Under Canvas only the `topLeft` value given is used.
	**/
	function setAlpha(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):StaticTilemapLayer;
	/**
		The alpha value of the Game Object.
		
		This is a global value, impacting the entire Game Object, not just a region of it.
	**/
	var alpha : Float;
	/**
		The alpha value starting from the top-left of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaTopLeft : Float;
	/**
		The alpha value starting from the top-right of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaTopRight : Float;
	/**
		The alpha value starting from the bottom-left of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaBottomLeft : Float;
	/**
		The alpha value starting from the bottom-right of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaBottomRight : Float;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency of which blend modes
		are used.
	**/
	var blendMode : ts.AnyOf2<String, global.phaser.BlendModes>;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE (only works when rendering to a framebuffer, like a Render Texture)
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency in which blend modes
		are used.
	**/
	function setBlendMode(value:ts.AnyOf2<String, global.phaser.BlendModes>):StaticTilemapLayer;
	/**
		The native (un-scaled) width of this Game Object.
		
		Changing this value will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or use
		the `displayWidth` property.
	**/
	var width : Float;
	/**
		The native (un-scaled) height of this Game Object.
		
		Changing this value will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or use
		the `displayHeight` property.
	**/
	var height : Float;
	/**
		The displayed width of this Game Object.
		
		This value takes into account the scale factor.
		
		Setting this value will adjust the Game Object's scale property.
	**/
	var displayWidth : Float;
	/**
		The displayed height of this Game Object.
		
		This value takes into account the scale factor.
		
		Setting this value will adjust the Game Object's scale property.
	**/
	var displayHeight : Float;
	/**
		Sets the internal size of this Game Object, as used for frame or physics body creation.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSize(width:Float, height:Float):StaticTilemapLayer;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):StaticTilemapLayer;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	var depth : Float;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	function setDepth(value:Float):StaticTilemapLayer;
	/**
		The horizontally flipped state of the Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	var flipX : Bool;
	/**
		The vertically flipped state of the Game Object.
		
		A Game Object that is flipped vertically will render inversed on the vertical axis (i.e. upside down)
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	var flipY : Bool;
	/**
		Toggles the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function toggleFlipX():StaticTilemapLayer;
	/**
		Toggles the vertical flipped state of this Game Object.
	**/
	function toggleFlipY():StaticTilemapLayer;
	/**
		Sets the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlipX(value:Bool):StaticTilemapLayer;
	/**
		Sets the vertical flipped state of this Game Object.
	**/
	function setFlipY(value:Bool):StaticTilemapLayer;
	/**
		Sets the horizontal and vertical flipped state of this Game Object.
		
		A Game Object that is flipped will render inversed on the flipped axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlip(x:Bool, y:Bool):StaticTilemapLayer;
	/**
		Resets the horizontal and vertical flipped state of this Game Object back to their default un-flipped state.
	**/
	function resetFlip():StaticTilemapLayer;
	/**
		Gets the center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getCenter<O>(?output:O):O;
	/**
		Gets the top-left corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-right corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the left-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getLeftCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the right-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getRightCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-left corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-right corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bounds of this Game Object, regardless of origin.
		The values are stored and returned in a Rectangle, or Rectangle-like, object.
	**/
	function getBounds<O>(?output:O):O;
	/**
		The horizontal origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the left of the Game Object.
	**/
	var originX : Float;
	/**
		The vertical origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the top of the Game Object.
	**/
	var originY : Float;
	/**
		The horizontal display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginX : Float;
	/**
		The vertical display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginY : Float;
	/**
		Sets the origin of this Game Object.
		
		The values are given in the range 0 to 1.
	**/
	function setOrigin(?x:Float, ?y:Float):StaticTilemapLayer;
	/**
		Sets the origin of this Game Object based on the Pivot values in its Frame.
	**/
	function setOriginFromFrame():StaticTilemapLayer;
	/**
		Sets the display origin of this Game Object.
		The difference between this and setting the origin is that you can use pixel values for setting the display origin.
	**/
	function setDisplayOrigin(?x:Float, ?y:Float):StaticTilemapLayer;
	/**
		Updates the Display Origin cached values internally stored on this Game Object.
		You don't usually call this directly, but it is exposed for edge-cases where you may.
	**/
	function updateDisplayOrigin():StaticTilemapLayer;
	/**
		The initial WebGL pipeline of this Game Object.
	**/
	var defaultPipeline : global.phaser.renderer.webgl.WebGLPipeline;
	/**
		The current WebGL pipeline of this Game Object.
	**/
	var pipeline : global.phaser.renderer.webgl.WebGLPipeline;
	/**
		Sets the initial WebGL Pipeline of this Game Object.
		This should only be called during the instantiation of the Game Object.
	**/
	function initPipeline(?pipelineName:String):Bool;
	/**
		Sets the active WebGL Pipeline of this Game Object.
	**/
	function setPipeline(pipelineName:String):StaticTilemapLayer;
	/**
		Resets the WebGL Pipeline of this Game Object back to the default it was created with.
	**/
	function resetPipeline():Bool;
	/**
		Gets the name of the WebGL Pipeline this Game Object is currently using.
	**/
	function getPipelineName():String;
	/**
		The x position of this Game Object.
	**/
	var x : Float;
	/**
		The y position of this Game Object.
	**/
	var y : Float;
	/**
		The z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#depth} instead.
	**/
	var z : Float;
	/**
		The w position of this Game Object.
	**/
	var w : Float;
	/**
		This is a special setter that allows you to set both the horizontal and vertical scale of this Game Object
		to the same value, at the same time. When reading this value the result returned is `(scaleX + scaleY) / 2`.
		
		Use of this property implies you wish the horizontal and vertical scales to be equal to each other. If this
		isn't the case, use the `scaleX` or `scaleY` properties instead.
	**/
	var scale : Float;
	/**
		The horizontal scale of this Game Object.
	**/
	var scaleX : Float;
	/**
		The vertical scale of this Game Object.
	**/
	var scaleY : Float;
	/**
		The angle of this Game Object as expressed in degrees.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, 90 is down, 180/-180 is left
		and -90 is up.
		
		If you prefer to work in radians, see the `rotation` property instead.
	**/
	var angle : Float;
	/**
		The angle of this Game Object in radians.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, PI/2 is down, +-PI is left
		and -PI/2 is up.
		
		If you prefer to work in degrees, see the `angle` property instead.
	**/
	var rotation : Float;
	/**
		Sets the position of this Game Object.
	**/
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):StaticTilemapLayer;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):StaticTilemapLayer;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):StaticTilemapLayer;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):StaticTilemapLayer;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(x:Float, ?y:Float):StaticTilemapLayer;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):StaticTilemapLayer;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):StaticTilemapLayer;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):StaticTilemapLayer;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):StaticTilemapLayer;
	/**
		Gets the local transform matrix for this Game Object.
	**/
	function getLocalTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
	/**
		Gets the world transform matrix for this Game Object, factoring in any parent Containers.
	**/
	function getWorldTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix, ?parentMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
	/**
		Gets the sum total rotation of all of this Game Objects parent Containers.
		
		The returned value is in radians and will be zero if this Game Object has no parent container.
	**/
	function getParentRotation():Float;
	/**
		The visible state of the Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	var visible : Bool;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):StaticTilemapLayer;
	/**
		The horizontal scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorX : Float;
	/**
		The vertical scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorY : Float;
	/**
		Sets the scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	function setScrollFactor(x:Float, ?y:Float):StaticTilemapLayer;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):StaticTilemapLayer;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):StaticTilemapLayer;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):StaticTilemapLayer;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():StaticTilemapLayer;
	/**
		Allows you to store a key value pair within this Game Objects Data Manager.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		```javascript
		sprite.setData('name', 'Red Gem Stone');
		```
		
		You can also pass in an object of key value pairs as the first argument:
		
		```javascript
		sprite.setData({ name: 'Red Gem Stone', level: 2, owner: 'Link', gold: 50 });
		```
		
		To get a value back again you can call `getData`:
		
		```javascript
		sprite.getData('gold');
		```
		
		Or you can access the value directly via the `values` property, where it works like any other variable:
		
		```javascript
		sprite.data.values.gold += 50;
		```
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
		
		If the key already exists, a `changedata` event is emitted instead, along an event named after the key.
		For example, if you updated an existing key called `PlayerLives` then it would emit the event `changedata-PlayerLives`.
		These events will be emitted regardless if you use this method to set the value, or the direct `values` setter.
		
		Please note that the data keys are case-sensitive and must be valid JavaScript Object property strings.
		This means the keys `gold` and `Gold` are treated as two unique values within the Data Manager.
	**/
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):StaticTilemapLayer;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):StaticTilemapLayer;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):StaticTilemapLayer;
	/**
		Pass this Game Object to the Input Manager to enable it for Input.
		
		Input works by using hit areas, these are nearly always geometric shapes, such as rectangles or circles, that act as the hit area
		for the Game Object. However, you can provide your own hit area shape and callback, should you wish to handle some more advanced
		input detection.
		
		If no arguments are provided it will try and create a rectangle hit area based on the texture frame the Game Object is using. If
		this isn't a texture-bound object, such as a Graphics or BitmapText object, this will fail, and you'll need to provide a specific
		shape for it to use.
		
		You can also provide an Input Configuration Object as the only argument to this method.
	**/
	function setInteractive(?shape:Dynamic, ?callback:global.phaser.types.input.HitAreaCallback, ?dropZone:Bool):StaticTilemapLayer;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():StaticTilemapLayer;
	/**
		If this Game Object has previously been enabled for input, this will queue it
		for removal, causing it to no longer be interactive. The removal happens on
		the next game step, it is not immediate.
		
		The Interactive Object that was assigned to this Game Object will be destroyed,
		removed from the Input Manager and cleared from this Game Object.
		
		If you wish to re-enable this Game Object at a later date you will need to
		re-create its InteractiveObject by calling `setInteractive` again.
		
		If you wish to only temporarily stop an object from receiving input then use
		`disableInteractive` instead, as that toggles the interactive state, where-as
		this erases it completely.
		
		If you wish to resize a hit area, don't remove and then set it as being
		interactive. Instead, access the hitarea object directly and resize the shape
		being used. I.e.: `sprite.input.hitArea.setSize(width, height)` (assuming the
		shape is a Rectangle, which it is by default.)
	**/
	function removeInteractive():StaticTilemapLayer;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):StaticTilemapLayer;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):StaticTilemapLayer;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):StaticTilemapLayer;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):StaticTilemapLayer;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):StaticTilemapLayer;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):StaticTilemapLayer;
	static var prototype : StaticTilemapLayer;
}