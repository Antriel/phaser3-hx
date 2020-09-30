package global.phaser.physics.arcade;

/**
	An Arcade Physics Static Group object.
	
	All Game Objects created by or added to this Group will automatically be given static Arcade Physics bodies, if they have no body.
	
	Its dynamic counterpart is {@link Phaser.Physics.Arcade.Group}.
**/
@:native("Phaser.Physics.Arcade.StaticGroup") extern class StaticGroup extends global.phaser.gameobjects.Group {
	function new(world:World, scene:global.phaser.Scene, ?children:ts.AnyOf3<Array<global.phaser.gameobjects.GameObject>, global.phaser.types.gameobjects.group.GroupConfig, global.phaser.types.gameobjects.group.GroupCreateConfig>, ?config:ts.AnyOf2<global.phaser.types.gameobjects.group.GroupConfig, global.phaser.types.gameobjects.group.GroupCreateConfig>);
	/**
		The physics simulation.
	**/
	var world : World;
	/**
		The scene this group belongs to.
	**/
	var physicsType : Float;
	/**
		Adds a static physics body to the new group member (if it lacks one) and adds it to the simulation.
	**/
	function createCallbackHandler(child:global.phaser.gameobjects.GameObject):Void;
	/**
		Disables the group member's physics body, removing it from the simulation.
	**/
	function removeCallbackHandler(child:global.phaser.gameobjects.GameObject):Void;
	/**
		Refreshes the group.
	**/
	function createMultipleCallbackHandler(entries:Array<global.phaser.gameobjects.GameObject>):Void;
	/**
		Resets each Body to the position of its parent Game Object.
		Body sizes aren't changed (use {@link Phaser.Physics.Arcade.Components.Enable#refreshBody} for that).
	**/
	function refresh():StaticGroup;
	/**
		Adds a Game Object to this group.
		
		Calls {@link Phaser.GameObjects.Group#createCallback}.
	**/
	function add(child:global.phaser.gameobjects.GameObject, ?addToScene:Bool):StaticGroup;
	/**
		Adds several Game Objects to this group.
		
		Calls {@link Phaser.GameObjects.Group#createCallback}.
	**/
	function addMultiple(children:Array<global.phaser.gameobjects.GameObject>, ?addToScene:Bool):StaticGroup;
	/**
		Removes a member of this Group and optionally removes it from the Scene and / or destroys it.
		
		Calls {@link Phaser.GameObjects.Group#removeCallback}.
	**/
	function remove(child:global.phaser.gameobjects.GameObject, ?removeFromScene:Bool, ?destroyChild:Bool):StaticGroup;
	/**
		Removes all members of this Group and optionally removes them from the Scene and / or destroys them.
		
		Does not call {@link Phaser.GameObjects.Group#removeCallback}.
	**/
	function clear(?removeFromScene:Bool, ?destroyChild:Bool):StaticGroup;
	/**
		{@link Phaser.GameObjects.Components.Animation#play Plays} an animation for all members of this group.
	**/
	function playAnimation(key:String, ?startFrame:String):StaticGroup;
	/**
		Sets the `active` property of this Group.
		When active, this Group runs its `preUpdate` method.
	**/
	function setActive(value:Bool):StaticGroup;
	/**
		Sets the `name` property of this Group.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):StaticGroup;
	/**
		Sets the property as defined in `key` of each group member to the given value.
	**/
	function propertyValueSet(key:String, value:Float, ?step:Float, ?index:Float, ?direction:Float):StaticGroup;
	/**
		Adds the given value to the property as defined in `key` of each group member.
	**/
	function propertyValueInc(key:String, value:Float, ?step:Float, ?index:Float, ?direction:Float):StaticGroup;
	/**
		Sets the x of each group member.
	**/
	function setX(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the y of each group member.
	**/
	function setY(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the x, y of each group member.
	**/
	function setXY(x:Float, ?y:Float, ?stepX:Float, ?stepY:Float):StaticGroup;
	/**
		Adds the given value to the x of each group member.
	**/
	function incX(value:Float, ?step:Float):StaticGroup;
	/**
		Adds the given value to the y of each group member.
	**/
	function incY(value:Float, ?step:Float):StaticGroup;
	/**
		Adds the given value to the x, y of each group member.
	**/
	function incXY(x:Float, ?y:Float, ?stepX:Float, ?stepY:Float):StaticGroup;
	/**
		Iterate through the group members changing the position of each element to be that of the element that came before
		it in the array (or after it if direction = 1)
		
		The first group member position is set to x/y.
	**/
	function shiftPosition(x:Float, y:Float, ?direction:Float):StaticGroup;
	/**
		Sets the angle of each group member.
	**/
	function angle(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the rotation of each group member.
	**/
	function rotate(value:Float, ?step:Float):StaticGroup;
	/**
		Rotates each group member around the given point by the given angle.
	**/
	function rotateAround(point:global.phaser.types.math.Vector2Like, angle:Float):StaticGroup;
	/**
		Rotates each group member around the given point by the given angle and distance.
	**/
	function rotateAroundDistance(point:global.phaser.types.math.Vector2Like, angle:Float, distance:Float):StaticGroup;
	/**
		Sets the alpha of each group member.
	**/
	function setAlpha(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the tint of each group member.
	**/
	function setTint(topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):StaticGroup;
	/**
		Sets the originX, originY of each group member.
	**/
	function setOrigin(originX:Float, ?originY:Float, ?stepX:Float, ?stepY:Float):StaticGroup;
	/**
		Sets the scaleX of each group member.
	**/
	function scaleX(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the scaleY of each group member.
	**/
	function scaleY(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the scaleX, scaleY of each group member.
	**/
	function scaleXY(scaleX:Float, ?scaleY:Float, ?stepX:Float, ?stepY:Float):StaticGroup;
	/**
		Sets the depth of each group member.
	**/
	function setDepth(value:Float, ?step:Float):StaticGroup;
	/**
		Sets the blendMode of each group member.
	**/
	function setBlendMode(value:Float):StaticGroup;
	/**
		Passes all group members to the Input Manager to enable them for input with identical areas and callbacks.
	**/
	function setHitArea(hitArea:Dynamic, hitAreaCallback:global.phaser.types.input.HitAreaCallback):StaticGroup;
	/**
		Shuffles the group members in place.
	**/
	function shuffle():StaticGroup;
	/**
		Sets the visible of each group member.
	**/
	function setVisible(value:Bool, ?index:Float, ?direction:Float):StaticGroup;
	/**
		Toggles (flips) the visible state of each member of this group.
	**/
	function toggleVisible():StaticGroup;
	static var prototype : StaticGroup;
}