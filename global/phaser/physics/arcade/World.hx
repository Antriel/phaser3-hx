package global.phaser.physics.arcade;

/**
	The Arcade Physics World.
	
	The World is responsible for creating, managing, colliding and updating all of the bodies within it.
	
	An instance of the World belongs to a Phaser.Scene and is accessed via the property `physics.world`.
**/
@:native("Phaser.Physics.Arcade.World") extern class World extends global.phaser.events.EventEmitter {
	function new(scene:global.phaser.Scene, config:global.phaser.types.physics.arcade.ArcadeWorldConfig);
	/**
		The Scene this simulation belongs to.
	**/
	var scene : global.phaser.Scene;
	/**
		Dynamic Bodies in this simulation.
	**/
	var bodies : global.phaser.structs.Set<Body>;
	/**
		Static Bodies in this simulation.
	**/
	var staticBodies : global.phaser.structs.Set<StaticBody>;
	/**
		Static Bodies marked for deletion.
	**/
	var pendingDestroy : global.phaser.structs.Set<ts.AnyOf2<Body, StaticBody>>;
	/**
		This simulation's collision processors.
	**/
	var colliders : global.phaser.structs.ProcessQueue<Collider>;
	/**
		Acceleration of Bodies due to gravity, in pixels per second.
	**/
	var gravity : global.phaser.math.Vector2;
	/**
		A boundary constraining Bodies.
	**/
	var bounds : global.phaser.geom.Rectangle;
	/**
		The boundary edges that Bodies can collide with.
	**/
	var checkCollision : global.phaser.types.physics.arcade.CheckCollisionObject;
	/**
		The number of physics steps to be taken per second.
		
		This property is read-only. Use the `setFPS` method to modify it at run-time.
	**/
	final fps : Float;
	/**
		Should Physics use a fixed update time-step (true) or sync to the render fps (false)?.
		False value of this property disables fps and timeScale properties.
	**/
	var fixedStep : Bool;
	/**
		The number of steps that took place in the last frame.
	**/
	final stepsLastFrame : Float;
	/**
		Scaling factor applied to the frame rate.
		
		- 1.0 = normal speed
		- 2.0 = half speed
		- 0.5 = double speed
	**/
	var timeScale : Float;
	/**
		The maximum absolute difference of a Body's per-step velocity and its overlap with another Body that will result in separation on *each axis*.
		Larger values favor separation.
		Smaller values favor no separation.
	**/
	var OVERLAP_BIAS : Float;
	/**
		The maximum absolute value of a Body's overlap with a tile that will result in separation on *each axis*.
		Larger values favor separation.
		Smaller values favor no separation.
		The optimum value may be similar to the tile size.
	**/
	var TILE_BIAS : Float;
	/**
		Always separate overlapping Bodies horizontally before vertically.
		False (the default) means Bodies are first separated on the axis of greater gravity, or the vertical axis if neither is greater.
	**/
	var forceX : Bool;
	/**
		Whether the simulation advances with the game loop.
	**/
	var isPaused : Bool;
	/**
		Enables the debug display.
	**/
	var drawDebug : Bool;
	/**
		The graphics object drawing the debug display.
	**/
	var debugGraphic : global.phaser.gameobjects.Graphics;
	/**
		Default debug display settings for new Bodies.
	**/
	var defaults : global.phaser.types.physics.arcade.ArcadeWorldDefaults;
	/**
		The maximum number of items per node on the RTree.
		
		This is ignored if `useTree` is `false`. If you have a large number of bodies in
		your world then you may find search performance improves by increasing this value,
		to allow more items per node and less node division.
	**/
	var maxEntries : Float;
	/**
		Should this Arcade Physics World use an RTree for Dynamic bodies?
		
		An RTree is a fast way of spatially sorting of all the bodies in the world.
		However, at certain limits, the cost of clearing and inserting the bodies into the
		tree every frame becomes more expensive than the search speed gains it provides.
		
		If you have a large number of dynamic bodies in your world then it may be best to
		disable the use of the RTree by setting this property to `false` in the physics config.
		
		The number it can cope with depends on browser and device, but a conservative estimate
		of around 5,000 bodies should be considered the max before disabling it.
		
		This only applies to dynamic bodies. Static bodies are always kept in an RTree,
		because they don't have to be cleared every frame, so you benefit from the
		massive search speeds all the time.
	**/
	var useTree : Bool;
	/**
		The spatial index of Dynamic Bodies.
	**/
	var tree : global.phaser.structs.RTree;
	/**
		The spatial index of Static Bodies.
	**/
	var staticTree : global.phaser.structs.RTree;
	/**
		Recycled input for tree searches.
	**/
	var treeMinMax : global.phaser.types.physics.arcade.ArcadeWorldTreeMinMax;
	/**
		Adds an Arcade Physics Body to a Game Object, an array of Game Objects, or the children of a Group.
		
		The difference between this and the `enableBody` method is that you can pass arrays or Groups
		to this method.
		
		You can specify if the bodies are to be Dynamic or Static. A dynamic body can move via velocity and
		acceleration. A static body remains fixed in place and as such is able to use an optimized search
		tree, making it ideal for static elements such as level objects. You can still collide and overlap
		with static bodies.
		
		Normally, rather than calling this method directly, you'd use the helper methods available in the
		Arcade Physics Factory, such as:
		
		```javascript
		this.physics.add.image(x, y, textureKey);
		this.physics.add.sprite(x, y, textureKey);
		```
		
		Calling factory methods encapsulates the creation of a Game Object and the creation of its
		body at the same time. If you are creating custom classes then you can pass them to this
		method to have their bodies created.
	**/
	function enable(object:ts.AnyOf4<global.phaser.gameobjects.GameObject, Array<global.phaser.gameobjects.GameObject>, global.phaser.gameobjects.Group, Array<global.phaser.gameobjects.Group>>, ?bodyType:Float):Void;
	/**
		Creates an Arcade Physics Body on a single Game Object.
		
		If the Game Object already has a body, this method will simply add it back into the simulation.
		
		You can specify if the body is Dynamic or Static. A dynamic body can move via velocity and
		acceleration. A static body remains fixed in place and as such is able to use an optimized search
		tree, making it ideal for static elements such as level objects. You can still collide and overlap
		with static bodies.
		
		Normally, rather than calling this method directly, you'd use the helper methods available in the
		Arcade Physics Factory, such as:
		
		```javascript
		this.physics.add.image(x, y, textureKey);
		this.physics.add.sprite(x, y, textureKey);
		```
		
		Calling factory methods encapsulates the creation of a Game Object and the creation of its
		body at the same time. If you are creating custom classes then you can pass them to this
		method to have their bodies created.
	**/
	function enableBody(object:global.phaser.gameobjects.GameObject, ?bodyType:Float):global.phaser.gameobjects.GameObject;
	/**
		Adds an existing Arcade Physics Body or StaticBody to the simulation.
		
		The body is enabled and added to the local search trees.
	**/
	function add(body:ts.AnyOf2<Body, StaticBody>):ts.AnyOf2<Body, StaticBody>;
	/**
		Disables the Arcade Physics Body of a Game Object, an array of Game Objects, or the children of a Group.
		
		The difference between this and the `disableBody` method is that you can pass arrays or Groups
		to this method.
		
		The body itself is not deleted, it just has its `enable` property set to false, which
		means you can re-enable it again at any point by passing it to enable `World.enable` or `World.add`.
	**/
	function disable(object:ts.AnyOf4<global.phaser.gameobjects.GameObject, Array<global.phaser.gameobjects.GameObject>, global.phaser.gameobjects.Group, Array<global.phaser.gameobjects.Group>>):Void;
	/**
		Disables an existing Arcade Physics Body or StaticBody and removes it from the simulation.
		
		The body is disabled and removed from the local search trees.
		
		The body itself is not deleted, it just has its `enable` property set to false, which
		means you can re-enable it again at any point by passing it to enable `World.enable` or `World.add`.
	**/
	function disableBody(body:ts.AnyOf2<Body, StaticBody>):Void;
	/**
		Removes an existing Arcade Physics Body or StaticBody from the simulation.
		
		The body is disabled and removed from the local search trees.
		
		The body itself is not deleted, it just has its `enabled` property set to false, which
		means you can re-enable it again at any point by passing it to enable `enable` or `add`.
	**/
	function remove(body:ts.AnyOf2<Body, StaticBody>):Void;
	/**
		Creates a Graphics Game Object that the world will use to render the debug display to.
		
		This is called automatically when the World is instantiated if the `debug` config property
		was set to `true`. However, you can call it at any point should you need to display the
		debug Graphic from a fixed point.
		
		You can control which objects are drawn to the Graphics object, and the colors they use,
		by setting the debug properties in the physics config.
		
		You should not typically use this in a production game. Use it to aid during debugging.
	**/
	function createDebugGraphic():global.phaser.gameobjects.Graphics;
	/**
		Sets the position, size and properties of the World boundary.
		
		The World boundary is an invisible rectangle that defines the edges of the World.
		If a Body is set to collide with the world bounds then it will automatically stop
		when it reaches any of the edges. You can optionally set which edges of the boundary
		should be checked against.
	**/
	function setBounds(x:Float, y:Float, width:Float, height:Float, ?checkLeft:Bool, ?checkRight:Bool, ?checkUp:Bool, ?checkDown:Bool):World;
	/**
		Enables or disables collisions on each edge of the World boundary.
	**/
	function setBoundsCollision(?left:Bool, ?right:Bool, ?up:Bool, ?down:Bool):World;
	/**
		Pauses the simulation.
		
		A paused simulation does not update any existing bodies, or run any Colliders.
		
		However, you can still enable and disable bodies within it, or manually run collide or overlap
		checks.
	**/
	function pause():World;
	/**
		Resumes the simulation, if paused.
	**/
	function resume():World;
	/**
		Creates a new Collider object and adds it to the simulation.
		
		A Collider is a way to automatically perform collision checks between two objects,
		calling the collide and process callbacks if they occur.
		
		Colliders are run as part of the World update, after all of the Bodies have updated.
		
		By creating a Collider you don't need then call `World.collide` in your `update` loop,
		as it will be handled for you automatically.
	**/
	function addCollider(object1:global.phaser.types.physics.arcade.ArcadeColliderType, object2:global.phaser.types.physics.arcade.ArcadeColliderType, ?collideCallback:global.ArcadePhysicsCallback, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic):Collider;
	/**
		Creates a new Overlap Collider object and adds it to the simulation.
		
		A Collider is a way to automatically perform overlap checks between two objects,
		calling the collide and process callbacks if they occur.
		
		Colliders are run as part of the World update, after all of the Bodies have updated.
		
		By creating a Collider you don't need then call `World.overlap` in your `update` loop,
		as it will be handled for you automatically.
	**/
	function addOverlap(object1:global.phaser.types.physics.arcade.ArcadeColliderType, object2:global.phaser.types.physics.arcade.ArcadeColliderType, ?collideCallback:global.ArcadePhysicsCallback, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic):Collider;
	/**
		Removes a Collider from the simulation so it is no longer processed.
		
		This method does not destroy the Collider. If you wish to add it back at a later stage you can call
		`World.colliders.add(Collider)`.
		
		If you no longer need the Collider you can call the `Collider.destroy` method instead, which will
		automatically clear all of its references and then remove it from the World. If you call destroy on
		a Collider you _don't_ need to pass it to this method too.
	**/
	function removeCollider(collider:Collider):World;
	/**
		Sets the frame rate to run the simulation at.
		
		The frame rate value is used to simulate a fixed update time step. This fixed
		time step allows for a straightforward implementation of a deterministic game state.
		
		This frame rate is independent of the frequency at which the game is rendering. The
		higher you set the fps, the more physics simulation steps will occur per game step.
		Conversely, the lower you set it, the less will take place.
		
		You can optionally advance the simulation directly yourself by calling the `step` method.
	**/
	function setFPS(framerate:Float):World;
	/**
		Advances the simulation based on the elapsed time and fps rate.
		
		This is called automatically by your Scene and does not need to be invoked directly.
	**/
	private function update(time:Float, delta:Float):Void;
	/**
		Advances the simulation by a time increment.
	**/
	function step(delta:Float):Void;
	/**
		Updates bodies, draws the debug display, and handles pending queue operations.
	**/
	function postUpdate():Void;
	/**
		Calculates a Body's velocity and updates its position.
	**/
	function updateMotion(body:Body, delta:Float):Void;
	/**
		Calculates a Body's angular velocity.
	**/
	function computeAngularVelocity(body:Body, delta:Float):Void;
	/**
		Calculates a Body's per-axis velocity.
	**/
	function computeVelocity(body:Body, delta:Float):Void;
	/**
		Separates two Bodies.
	**/
	function separate(body1:Body, body2:Body, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic, ?overlapOnly:Bool, ?intersects:Bool):Bool;
	/**
		Separates two Bodies, when both are circular.
	**/
	function separateCircle(body1:Body, body2:Body, ?overlapOnly:Bool, ?bias:Float):Bool;
	/**
		Checks to see if two Bodies intersect at all.
	**/
	function intersects(body1:Body, body2:Body):Bool;
	/**
		Tests if a circular Body intersects with another Body.
	**/
	function circleBodyIntersects(circle:Body, body:Body):Bool;
	/**
		Tests if Game Objects overlap.
		
		See details in {@link Phaser.Physics.Arcade.World#collide}.
	**/
	function overlap(object1:global.phaser.types.physics.arcade.ArcadeColliderType, ?object2:global.phaser.types.physics.arcade.ArcadeColliderType, ?overlapCallback:global.ArcadePhysicsCallback, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic):Bool;
	/**
		Performs a collision check and separation between the two physics enabled objects given, which can be single
		Game Objects, arrays of Game Objects, Physics Groups, arrays of Physics Groups or normal Groups.
		
		If you don't require separation then use {@link Phaser.Physics.Arcade.World#overlap} instead.
		
		If two Groups or arrays are passed, each member of one will be tested against each member of the other.
		
		If **only** one Group is passed (as `object1`), each member of the Group will be collided against the other members.
		
		If **only** one Array is passed, the array is iterated and every element in it is tested against the others.
		
		Two callbacks can be provided; they receive the colliding game objects as arguments.
		If an overlap is detected, the `processCallback` is called first. It can cancel the collision by returning false.
		Next the objects are separated and `collideCallback` is invoked.
		
		Arcade Physics uses the Projection Method of collision resolution and separation. While it's fast and suitable
		for 'arcade' style games it lacks stability when multiple objects are in close proximity or resting upon each other.
		The separation that stops two objects penetrating may create a new penetration against a different object. If you
		require a high level of stability please consider using an alternative physics system, such as Matter.js.
	**/
	function collide(object1:global.phaser.types.physics.arcade.ArcadeColliderType, ?object2:global.phaser.types.physics.arcade.ArcadeColliderType, ?collideCallback:global.ArcadePhysicsCallback, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic):Bool;
	/**
		This advanced method is specifically for testing for collision between a single Sprite and an array of Tile objects.
		
		You should generally use the `collide` method instead, with a Sprite vs. a Tilemap Layer, as that will perform
		tile filtering and culling for you, as well as handle the interesting face collision automatically.
		
		This method is offered for those who would like to check for collision with specific Tiles in a layer, without
		having to set any collision attributes on the tiles in question. This allows you to perform quick dynamic collisions
		on small sets of Tiles. As such, no culling or checks are made to the array of Tiles given to this method,
		you should filter them before passing them to this method.
		
		Important: Use of this method skips the `interesting faces` system that Tilemap Layers use. This means if you have
		say a row or column of tiles, and you jump into, or walk over them, it's possible to get stuck on the edges of the
		tiles as the interesting face calculations are skipped. However, for quick-fire small collision set tests on
		dynamic maps, this method can prove very useful.
	**/
	function collideTiles(sprite:global.phaser.gameobjects.GameObject, tiles:Array<global.phaser.tilemaps.Tile>, ?collideCallback:global.ArcadePhysicsCallback, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic):Bool;
	/**
		This advanced method is specifically for testing for overlaps between a single Sprite and an array of Tile objects.
		
		You should generally use the `overlap` method instead, with a Sprite vs. a Tilemap Layer, as that will perform
		tile filtering and culling for you, as well as handle the interesting face collision automatically.
		
		This method is offered for those who would like to check for overlaps with specific Tiles in a layer, without
		having to set any collision attributes on the tiles in question. This allows you to perform quick dynamic overlap
		tests on small sets of Tiles. As such, no culling or checks are made to the array of Tiles given to this method,
		you should filter them before passing them to this method.
	**/
	function overlapTiles(sprite:global.phaser.gameobjects.GameObject, tiles:Array<global.phaser.tilemaps.Tile>, ?collideCallback:global.ArcadePhysicsCallback, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic):Bool;
	/**
		Internal handler for Sprite vs. Tilemap collisions.
		Please use Phaser.Physics.Arcade.World#collide instead.
	**/
	function collideSpriteVsTilemapLayer(sprite:global.phaser.gameobjects.GameObject, tilemapLayer:ts.AnyOf2<global.phaser.tilemaps.DynamicTilemapLayer, global.phaser.tilemaps.StaticTilemapLayer>, ?collideCallback:global.ArcadePhysicsCallback, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic, ?overlapOnly:Bool):Bool;
	/**
		Wrap an object's coordinates (or several objects' coordinates) within {@link Phaser.Physics.Arcade.World#bounds}.
		
		If the object is outside any boundary edge (left, top, right, bottom), it will be moved to the same offset from the opposite edge (the interior).
	**/
	function wrap(object:Dynamic, ?padding:Float):Void;
	/**
		Wrap each object's coordinates within {@link Phaser.Physics.Arcade.World#bounds}.
	**/
	function wrapArray(objects:Array<Dynamic>, ?padding:Float):Void;
	/**
		Wrap an object's coordinates within {@link Phaser.Physics.Arcade.World#bounds}.
	**/
	function wrapObject(object:Dynamic, ?padding:Float):Void;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):World;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):World;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):World;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):World;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):World;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):World;
	static var prototype : World;
}