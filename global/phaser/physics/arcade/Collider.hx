package global.phaser.physics.arcade;

/**
	An Arcade Physics Collider will automatically check for collision, or overlaps, between two objects
	every step. If a collision, or overlap, occurs it will invoke the given callbacks.
**/
@:native("Phaser.Physics.Arcade.Collider") extern class Collider {
	function new(world:World, overlapOnly:Bool, object1:global.phaser.types.physics.arcade.ArcadeColliderType, object2:global.phaser.types.physics.arcade.ArcadeColliderType, collideCallback:global.ArcadePhysicsCallback, processCallback:global.ArcadePhysicsCallback, callbackContext:Dynamic);
	/**
		The world in which the bodies will collide.
	**/
	var world : World;
	/**
		The name of the collider (unused by Phaser).
	**/
	var name : String;
	/**
		Whether the collider is active.
	**/
	var active : Bool;
	/**
		Whether to check for collisions or overlaps.
	**/
	var overlapOnly : Bool;
	/**
		The first object to check for collision.
	**/
	var object1 : global.phaser.types.physics.arcade.ArcadeColliderType;
	/**
		The second object to check for collision.
	**/
	var object2 : global.phaser.types.physics.arcade.ArcadeColliderType;
	/**
		The callback to invoke when the two objects collide.
	**/
	dynamic function collideCallback(object1:global.phaser.gameobjects.GameObject, object2:global.phaser.gameobjects.GameObject):Void;
	/**
		If a processCallback exists it must return true or collision checking will be skipped.
	**/
	dynamic function processCallback(object1:global.phaser.gameobjects.GameObject, object2:global.phaser.gameobjects.GameObject):Void;
	/**
		The context the collideCallback and processCallback will run in.
	**/
	var callbackContext : Dynamic;
	/**
		A name for the Collider.
		
		Phaser does not use this value, it's for your own reference.
	**/
	function setName(name:String):Collider;
	/**
		Called by World as part of its step processing, initial operation of collision checking.
	**/
	function update():Void;
	/**
		Removes Collider from World and disposes of its resources.
	**/
	function destroy():Void;
	static var prototype : Collider;
}