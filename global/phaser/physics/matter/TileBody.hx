package global.phaser.physics.matter;

/**
	A wrapper around a Tile that provides access to a corresponding Matter body. A tile can only
	have one Matter body associated with it. You can either pass in an existing Matter body for
	the tile or allow the constructor to create the corresponding body for you. If the Tile has a
	collision group (defined in Tiled), those shapes will be used to create the body. If not, the
	tile's rectangle bounding box will be used.
	
	The corresponding body will be accessible on the Tile itself via Tile.physics.matterBody.
	
	Note: not all Tiled collision shapes are supported. See
	Phaser.Physics.Matter.TileBody#setFromTileCollision for more information.
**/
@:native("Phaser.Physics.Matter.TileBody") extern class TileBody extends global.phaser.events.EventEmitter {
	function new(world:World, tile:global.phaser.tilemaps.Tile, ?options:global.phaser.types.physics.matter.MatterTileOptions);
	/**
		The tile object the body is associated with.
	**/
	var tile : global.phaser.tilemaps.Tile;
	/**
		The Matter world the body exists within.
	**/
	var world : World;
	/**
		Sets the current body to a rectangle that matches the bounds of the tile.
	**/
	function setFromTileRectangle(?options:global.phaser.types.physics.matter.MatterBodyTileOptions):TileBody;
	/**
		Sets the current body from the collision group associated with the Tile. This is typically
		set up in Tiled's collision editor.
		
		Note: Matter doesn't support all shapes from Tiled. Rectangles and polygons are directly
		supported. Ellipses are converted into circle bodies. Polylines are treated as if they are
		closed polygons. If a tile has multiple shapes, a multi-part body will be created. Concave
		shapes are supported if poly-decomp library is included. Decomposition is not guaranteed to
		work for complex shapes (e.g. holes), so it's often best to manually decompose a concave
		polygon into multiple convex polygons yourself.
	**/
	function setFromTileCollision(?options:global.phaser.types.physics.matter.MatterBodyTileOptions):TileBody;
	/**
		Sets the current body to the given body. This will remove the previous body, if one already
		exists.
	**/
	function setBody(body:global.matterjs.BodyType, ?addToWorld:Bool):TileBody;
	/**
		Removes the current body from the TileBody and from the Matter world
	**/
	function removeBody():TileBody;
	/**
		Removes the current body from the tile and the world.
	**/
	function destroy():TileBody;
	/**
		Sets the restitution on the physics object.
	**/
	function setBounce(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets the collision category of this Game Object's Matter Body. This number must be a power of two between 2^0 (= 1) and 2^31.
		Two bodies with different collision groups (see {@link #setCollisionGroup}) will only collide if their collision
		categories are included in their collision masks (see {@link #setCollidesWith}).
	**/
	function setCollisionCategory(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets the collision group of this Game Object's Matter Body. If this is zero or two Matter Bodies have different values,
		they will collide according to the usual rules (see {@link #setCollisionCategory} and {@link #setCollisionGroup}).
		If two Matter Bodies have the same positive value, they will always collide; if they have the same negative value,
		they will never collide.
	**/
	function setCollisionGroup(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets the collision mask for this Game Object's Matter Body. Two Matter Bodies with different collision groups will only
		collide if each one includes the other's category in its mask based on a bitwise AND, i.e. `(categoryA & maskB) !== 0`
		and `(categoryB & maskA) !== 0` are both true.
	**/
	function setCollidesWith(categories:ts.AnyOf2<Float, Array<Float>>):global.phaser.gameobjects.GameObject;
	/**
		The callback is sent a `Phaser.Types.Physics.Matter.MatterCollisionData` object.
		
		This does not change the bodies collision category, group or filter. Those must be set in addition
		to the callback.
	**/
	function setOnCollide(callback:haxe.Constraints.Function):global.phaser.gameobjects.GameObject;
	/**
		The callback is sent a `Phaser.Types.Physics.Matter.MatterCollisionData` object.
		
		This does not change the bodies collision category, group or filter. Those must be set in addition
		to the callback.
	**/
	function setOnCollideEnd(callback:haxe.Constraints.Function):global.phaser.gameobjects.GameObject;
	/**
		The callback is sent a `Phaser.Types.Physics.Matter.MatterCollisionData` object.
		
		This does not change the bodies collision category, group or filter. Those must be set in addition
		to the callback.
	**/
	function setOnCollideActive(callback:haxe.Constraints.Function):global.phaser.gameobjects.GameObject;
	/**
		The callback is sent a reference to the other body, along with a `Phaser.Types.Physics.Matter.MatterCollisionData` object.
		
		This does not change the bodies collision category, group or filter. Those must be set in addition
		to the callback.
	**/
	function setOnCollideWith(body:ts.AnyOf2<global.matterjs.Body, Array<global.matterjs.Body>>, callback:haxe.Constraints.Function):global.phaser.gameobjects.GameObject;
	/**
		Sets new friction values for this Game Object's Matter Body.
	**/
	function setFriction(value:Float, ?air:Float, ?fstatic:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets a new air resistance for this Game Object's Matter Body.
		A value of 0 means the Body will never slow as it moves through space.
		The higher the value, the faster a Body slows when moving through space.
	**/
	function setFrictionAir(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets a new static friction for this Game Object's Matter Body.
		A value of 0 means the Body will never "stick" when it is nearly stationary.
		The higher the value (e.g. 10), the more force it will take to initially get the Body moving when it is nearly stationary.
	**/
	function setFrictionStatic(value:Float):global.phaser.gameobjects.GameObject;
	/**
		A togglable function for ignoring world gravity in real-time on the current body.
	**/
	function setIgnoreGravity(value:Bool):global.phaser.gameobjects.GameObject;
	/**
		Sets the mass of the Game Object's Matter Body.
	**/
	function setMass(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets density of the body.
	**/
	function setDensity(value:Float):global.phaser.gameobjects.GameObject;
	/**
		The body's center of mass.
		
		Calling this creates a new `Vector2 each time to avoid mutation.
		
		If you only need to read the value and won't change it, you can get it from `GameObject.body.centerOfMass`.
	**/
	final centerOfMass : global.phaser.math.Vector2;
	/**
		Set the body belonging to this Game Object to be a sensor.
		Sensors trigger collision events, but don't react with colliding body physically.
	**/
	function setSensor(value:Bool):global.phaser.gameobjects.GameObject;
	/**
		Is the body belonging to this Game Object a sensor or not?
	**/
	function isSensor():Bool;
	/**
		Sets this Body to sleep.
	**/
	function setToSleep():TileBody;
	/**
		Wakes this Body if asleep.
	**/
	function setAwake():TileBody;
	/**
		Sets the number of updates in which this body must have near-zero velocity before it is set as sleeping (if sleeping is enabled by the engine).
	**/
	function setSleepThreshold(?value:Float):TileBody;
	/**
		Enable sleep and wake events for this body.
		
		By default when a body goes to sleep, or wakes up, it will not emit any events.
		
		The events are emitted by the Matter World instance and can be listened to via
		the `SLEEP_START` and `SLEEP_END` events.
	**/
	function setSleepEvents(start:Bool, end:Bool):TileBody;
	/**
		Enables or disables the Sleep Start event for this body.
	**/
	function setSleepStartEvent(value:Bool):TileBody;
	/**
		Enables or disables the Sleep End event for this body.
	**/
	function setSleepEndEvent(value:Bool):TileBody;
	/**
		Changes the physics body to be either static `true` or dynamic `false`.
	**/
	function setStatic(value:Bool):global.phaser.gameobjects.GameObject;
	/**
		Returns `true` if the body is static, otherwise `false` for a dynamic body.
	**/
	function isStatic():Bool;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TileBody;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TileBody;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TileBody;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):TileBody;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):TileBody;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):TileBody;
	static var prototype : TileBody;
}