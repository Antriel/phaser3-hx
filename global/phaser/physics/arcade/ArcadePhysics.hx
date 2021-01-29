package global.phaser.physics.arcade;

/**
	The Arcade Physics Plugin belongs to a Scene and sets up and manages the Scene's physics simulation.
	It also holds some useful methods for moving and rotating Arcade Physics Bodies.
	
	You can access it from within a Scene using `this.physics`.
	
	Arcade Physics uses the Projection Method of collision resolution and separation. While it's fast and suitable
	for 'arcade' style games it lacks stability when multiple objects are in close proximity or resting upon each other.
	The separation that stops two objects penetrating may create a new penetration against a different object. If you
	require a high level of stability please consider using an alternative physics system, such as Matter.js.
**/
@:native("Phaser.Physics.Arcade.ArcadePhysics") extern class ArcadePhysics {
	function new(scene:global.phaser.Scene);
	/**
		The Scene that this Plugin belongs to.
	**/
	var scene : global.phaser.Scene;
	/**
		The Scene's Systems.
	**/
	var systems : global.phaser.scenes.Systems;
	/**
		A configuration object. Union of the `physics.arcade.*` properties of the GameConfig and SceneConfig objects.
	**/
	var config : global.phaser.types.physics.arcade.ArcadeWorldConfig;
	/**
		The physics simulation.
	**/
	var world : World;
	/**
		An object holding the Arcade Physics factory methods.
	**/
	var add : Factory;
	/**
		Causes `World.update` to be automatically called each time the Scene
		emits and `UPDATE` event. This is the default setting, so only needs
		calling if you have specifically disabled it.
	**/
	function enableUpdate():Void;
	/**
		Causes `World.update` to **not** be automatically called each time the Scene
		emits and `UPDATE` event.
		
		If you wish to run the World update at your own rate, or from your own
		component, then you should call this method to disable the built-in link,
		and then call `World.update(delta, time)` accordingly.
		
		Note that `World.postUpdate` is always automatically called when the Scene
		emits a `POST_UPDATE` event, regardless of this setting.
	**/
	function disableUpdate():Void;
	/**
		Creates the physics configuration for the current Scene.
	**/
	function getConfig():global.phaser.types.physics.arcade.ArcadeWorldConfig;
	/**
		Tests if Game Objects overlap. See {@link Phaser.Physics.Arcade.World#overlap}
	**/
	function overlap(object1:global.phaser.types.physics.arcade.ArcadeColliderType, ?object2:global.phaser.types.physics.arcade.ArcadeColliderType, ?collideCallback:global.ArcadePhysicsCallback, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic):Bool;
	/**
		Performs a collision check and separation between the two physics enabled objects given, which can be single
		Game Objects, arrays of Game Objects, Physics Groups, arrays of Physics Groups or normal Groups.
		
		If you don't require separation then use {@link #overlap} instead.
		
		If two Groups or arrays are passed, each member of one will be tested against each member of the other.
		
		If **only** one Group is passed (as `object1`), each member of the Group will be collided against the other members.
		
		If **only** one Array is passed, the array is iterated and every element in it is tested against the others.
		
		Two callbacks can be provided. The `collideCallback` is invoked if a collision occurs and the two colliding
		objects are passed to it.
		
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
		Pauses the simulation.
	**/
	function pause():World;
	/**
		Resumes the simulation (if paused).
	**/
	function resume():World;
	/**
		Sets the acceleration.x/y property on the game object so it will move towards the x/y coordinates at the given rate (in pixels per second squared)
		
		You must give a maximum speed value, beyond which the game object won't go any faster.
		
		Note: The game object does not continuously track the target. If the target changes location during transit the game object will not modify its course.
		Note: The game object doesn't stop moving once it reaches the destination coordinates.
	**/
	function accelerateTo(gameObject:global.phaser.gameobjects.GameObject, x:Float, y:Float, ?speed:Float, ?xSpeedMax:Float, ?ySpeedMax:Float):Float;
	/**
		Sets the acceleration.x/y property on the game object so it will move towards the x/y coordinates at the given rate (in pixels per second squared)
		
		You must give a maximum speed value, beyond which the game object won't go any faster.
		
		Note: The game object does not continuously track the target. If the target changes location during transit the game object will not modify its course.
		Note: The game object doesn't stop moving once it reaches the destination coordinates.
	**/
	function accelerateToObject(gameObject:global.phaser.gameobjects.GameObject, destination:global.phaser.gameobjects.GameObject, ?speed:Float, ?xSpeedMax:Float, ?ySpeedMax:Float):Float;
	/**
		Finds the Body or Game Object closest to a source point or object.
		
		If a `targets` argument is passed, this method finds the closest of those.
		The targets can be Arcade Physics Game Objects, Dynamic Bodies, or Static Bodies.
		
		If no `targets` argument is passed, this method finds the closest Dynamic Body.
		
		If two or more targets are the exact same distance from the source point, only the first target
		is returned.
	**/
	function closest(source:Dynamic, ?targets:ts.AnyOf3<Array<global.phaser.gameobjects.GameObject>, Array<Body>, Array<StaticBody>>):ts.AnyOf3<global.phaser.gameobjects.GameObject, Body, StaticBody>;
	/**
		Finds the Body or Game Object farthest from a source point or object.
		
		If a `targets` argument is passed, this method finds the farthest of those.
		The targets can be Arcade Physics Game Objects, Dynamic Bodies, or Static Bodies.
		
		If no `targets` argument is passed, this method finds the farthest Dynamic Body.
		
		If two or more targets are the exact same distance from the source point, only the first target
		is returned.
	**/
	function furthest(source:Dynamic, ?targets:ts.AnyOf3<Array<global.phaser.gameobjects.GameObject>, Array<Body>, Array<StaticBody>>):ts.AnyOf3<global.phaser.gameobjects.GameObject, Body, StaticBody>;
	/**
		Move the given display object towards the x/y coordinates at a steady velocity.
		If you specify a maxTime then it will adjust the speed (over-writing what you set) so it arrives at the destination in that number of seconds.
		Timings are approximate due to the way browser timers work. Allow for a variance of +- 50ms.
		Note: The display object does not continuously track the target. If the target changes location during transit the display object will not modify its course.
		Note: The display object doesn't stop moving once it reaches the destination coordinates.
		Note: Doesn't take into account acceleration, maxVelocity or drag (if you've set drag or acceleration too high this object may not move at all)
	**/
	function moveTo(gameObject:global.phaser.gameobjects.GameObject, x:Float, y:Float, ?speed:Float, ?maxTime:Float):Float;
	/**
		Move the given display object towards the destination object at a steady velocity.
		If you specify a maxTime then it will adjust the speed (overwriting what you set) so it arrives at the destination in that number of seconds.
		Timings are approximate due to the way browser timers work. Allow for a variance of +- 50ms.
		Note: The display object does not continuously track the target. If the target changes location during transit the display object will not modify its course.
		Note: The display object doesn't stop moving once it reaches the destination coordinates.
		Note: Doesn't take into account acceleration, maxVelocity or drag (if you've set drag or acceleration too high this object may not move at all)
	**/
	function moveToObject(gameObject:global.phaser.gameobjects.GameObject, destination:Dynamic, ?speed:Float, ?maxTime:Float):Float;
	/**
		Given the angle (in degrees) and speed calculate the velocity and return it as a vector, or set it to the given vector object.
		One way to use this is: velocityFromAngle(angle, 200, sprite.body.velocity) which will set the values directly to the sprite's velocity and not create a new vector object.
	**/
	function velocityFromAngle(angle:Float, ?speed:Float, ?vec2:global.phaser.math.Vector2):global.phaser.math.Vector2;
	/**
		Given the rotation (in radians) and speed calculate the velocity and return it as a vector, or set it to the given vector object.
		One way to use this is: velocityFromRotation(rotation, 200, sprite.body.velocity) which will set the values directly to the sprite's velocity and not create a new vector object.
	**/
	function velocityFromRotation(rotation:Float, ?speed:Float, ?vec2:global.phaser.math.Vector2):global.phaser.math.Vector2;
	/**
		This method will search the given rectangular area and return an array of all physics bodies that
		overlap with it. It can return either Dynamic, Static bodies or a mixture of both.
		
		A body only has to intersect with the search area to be considered, it doesn't have to be fully
		contained within it.
		
		If Arcade Physics is set to use the RTree (which it is by default) then the search for is extremely fast,
		otherwise the search is O(N) for Dynamic Bodies.
	**/
	function overlapRect(x:Float, y:Float, width:Float, height:Float, ?includeDynamic:Bool, ?includeStatic:Bool):ts.AnyOf2<Array<Body>, Array<StaticBody>>;
	/**
		This method will search the given circular area and return an array of all physics bodies that
		overlap with it. It can return either Dynamic, Static bodies or a mixture of both.
		
		A body only has to intersect with the search area to be considered, it doesn't have to be fully
		contained within it.
		
		If Arcade Physics is set to use the RTree (which it is by default) then the search is rather fast,
		otherwise the search is O(N) for Dynamic Bodies.
	**/
	function overlapCirc(x:Float, y:Float, radius:Float, ?includeDynamic:Bool, ?includeStatic:Bool):ts.AnyOf2<Array<Body>, Array<StaticBody>>;
	/**
		The Scene that owns this plugin is shutting down.
		We need to kill and reset all internal properties as well as stop listening to Scene events.
	**/
	function shutdown():Void;
	/**
		The Scene that owns this plugin is being destroyed.
		We need to shutdown and then kill off all external references.
	**/
	function destroy():Void;
	static var prototype : ArcadePhysics;
}