package global.phaser.physics.arcade;

/**
	The Arcade Physics Factory allows you to easily create Arcade Physics enabled Game Objects.
	Objects that are created by this Factory are automatically added to the physics world.
**/
@:native("Phaser.Physics.Arcade.Factory") extern class Factory {
	function new(world:World);
	/**
		A reference to the Arcade Physics World.
	**/
	var world : World;
	/**
		A reference to the Scene this Arcade Physics instance belongs to.
	**/
	var scene : global.phaser.Scene;
	/**
		A reference to the Scene.Systems this Arcade Physics instance belongs to.
	**/
	var sys : global.phaser.scenes.Systems;
	/**
		Creates a new Arcade Physics Collider object.
	**/
	function collider(object1:ts.AnyOf4<global.phaser.gameobjects.GameObject, Array<global.phaser.gameobjects.GameObject>, global.phaser.gameobjects.Group, Array<global.phaser.gameobjects.Group>>, object2:ts.AnyOf4<global.phaser.gameobjects.GameObject, Array<global.phaser.gameobjects.GameObject>, global.phaser.gameobjects.Group, Array<global.phaser.gameobjects.Group>>, ?collideCallback:global.ArcadePhysicsCallback, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic):Collider;
	/**
		Creates a new Arcade Physics Collider Overlap object.
	**/
	function overlap(object1:ts.AnyOf4<global.phaser.gameobjects.GameObject, Array<global.phaser.gameobjects.GameObject>, global.phaser.gameobjects.Group, Array<global.phaser.gameobjects.Group>>, object2:ts.AnyOf4<global.phaser.gameobjects.GameObject, Array<global.phaser.gameobjects.GameObject>, global.phaser.gameobjects.Group, Array<global.phaser.gameobjects.Group>>, ?collideCallback:global.ArcadePhysicsCallback, ?processCallback:global.ArcadePhysicsCallback, ?callbackContext:Dynamic):Collider;
	/**
		Adds an Arcade Physics Body to the given Game Object.
	**/
	function existing<G>(gameObject:G, ?isStatic:Bool):G;
	/**
		Creates a new Arcade Image object with a Static body.
	**/
	function staticImage(x:Float, y:Float, texture:ts.AnyOf2<String, global.phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>):global.phaser.types.physics.arcade.ImageWithStaticBody;
	/**
		Creates a new Arcade Image object with a Dynamic body.
	**/
	function image(x:Float, y:Float, texture:ts.AnyOf2<String, global.phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>):global.phaser.types.physics.arcade.ImageWithDynamicBody;
	/**
		Creates a new Arcade Sprite object with a Static body.
	**/
	function staticSprite(x:Float, y:Float, texture:ts.AnyOf2<String, global.phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>):global.phaser.types.physics.arcade.SpriteWithStaticBody;
	/**
		Creates a new Arcade Sprite object with a Dynamic body.
	**/
	function sprite(x:Float, y:Float, key:String, ?frame:ts.AnyOf2<String, Float>):global.phaser.types.physics.arcade.SpriteWithDynamicBody;
	/**
		Creates a Static Physics Group object.
		All Game Objects created by this Group will automatically be static Arcade Physics objects.
	**/
	function staticGroup(?children:ts.AnyOf3<Array<global.phaser.gameobjects.GameObject>, global.phaser.types.gameobjects.group.GroupConfig, global.phaser.types.gameobjects.group.GroupCreateConfig>, ?config:ts.AnyOf2<global.phaser.types.gameobjects.group.GroupConfig, global.phaser.types.gameobjects.group.GroupCreateConfig>):StaticGroup;
	/**
		Creates a Physics Group object.
		All Game Objects created by this Group will automatically be dynamic Arcade Physics objects.
	**/
	function group(?children:ts.AnyOf3<Array<global.phaser.gameobjects.GameObject>, global.phaser.types.gameobjects.group.GroupCreateConfig, global.phaser.types.physics.arcade.PhysicsGroupConfig>, ?config:ts.AnyOf2<global.phaser.types.gameobjects.group.GroupCreateConfig, global.phaser.types.physics.arcade.PhysicsGroupConfig>):Group;
	/**
		Destroys this Factory.
	**/
	function destroy():Void;
	static var prototype : Factory;
}