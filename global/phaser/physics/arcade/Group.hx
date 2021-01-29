package global.phaser.physics.arcade;

/**
	An Arcade Physics Group object.
	
	The primary use of a Physics Group is a way to collect together physics enable objects
	that share the same intrinsic structure into a single pool. They can they be easily
	compared against other Groups, or Game Objects.
	
	All Game Objects created by, or added to this Group will automatically be given **dynamic**
	Arcade Physics bodies (if they have no body already) and the bodies will receive the
	Groups {@link Phaser.Physics.Arcade.Group#defaults default values}.
	
	You should not pass objects into this Group that should not receive a body. For example,
	do not add basic Geometry or Tilemap Layers into a Group, as they will not behave in the
	way you may expect. Groups should all ideally have objects of the same type in them.
	
	If you wish to create a Group filled with Static Bodies, please see {@link Phaser.Physics.Arcade.StaticGroup}.
**/
@:native("Phaser.Physics.Arcade.Group") extern class Group extends global.phaser.gameobjects.Group {
	function new(world:World, scene:global.phaser.Scene, ?children:ts.AnyOf3<Array<global.phaser.gameobjects.GameObject>, global.phaser.types.gameobjects.group.GroupCreateConfig, global.phaser.types.physics.arcade.PhysicsGroupConfig>, ?config:ts.AnyOf2<global.phaser.types.gameobjects.group.GroupCreateConfig, global.phaser.types.physics.arcade.PhysicsGroupConfig>);
	/**
		The physics simulation.
	**/
	var world : World;
	/**
		The physics type of the Group's members.
	**/
	var physicsType : Float;
	/**
		Default physics properties applied to Game Objects added to the Group or created by the Group. Derived from the `config` argument.
		
		You can remove the default values by setting this property to `{}`.
	**/
	var defaults : global.phaser.types.physics.arcade.PhysicsGroupDefaults;
	/**
		Enables a Game Object's Body and assigns `defaults`. Called when a Group member is added or created.
	**/
	function createCallbackHandler(child:global.phaser.gameobjects.GameObject):Void;
	/**
		Disables a Game Object's Body. Called when a Group member is removed.
	**/
	function removeCallbackHandler(child:global.phaser.gameobjects.GameObject):Void;
	/**
		Sets the velocity of each Group member.
	**/
	function setVelocity(x:Float, y:Float, ?step:Float):Group;
	/**
		Sets the horizontal velocity of each Group member.
	**/
	function setVelocityX(value:Float, ?step:Float):Group;
	/**
		Sets the vertical velocity of each Group member.
	**/
	function setVelocityY(value:Float, ?step:Float):Group;
	/**
		Adds a Game Object to this group.
		
		Calls {@link Phaser.GameObjects.Group#createCallback}.
	**/
	function add(child:global.phaser.gameobjects.GameObject, ?addToScene:Bool):Group;
	/**
		Adds several Game Objects to this group.
		
		Calls {@link Phaser.GameObjects.Group#createCallback}.
	**/
	function addMultiple(children:Array<global.phaser.gameobjects.GameObject>, ?addToScene:Bool):Group;
	/**
		Removes a member of this Group and optionally removes it from the Scene and / or destroys it.
		
		Calls {@link Phaser.GameObjects.Group#removeCallback}.
	**/
	function remove(child:global.phaser.gameobjects.GameObject, ?removeFromScene:Bool, ?destroyChild:Bool):Group;
	/**
		Removes all members of this Group and optionally removes them from the Scene and / or destroys them.
		
		Does not call {@link Phaser.GameObjects.Group#removeCallback}.
	**/
	function clear(?removeFromScene:Bool, ?destroyChild:Bool):Group;
	/**
		{@link Phaser.GameObjects.Components.Animation#play Plays} an animation for all members of this group.
	**/
	function playAnimation(key:String, ?startFrame:String):Group;
	/**
		Sets the `active` property of this Group.
		When active, this Group runs its `preUpdate` method.
	**/
	function setActive(value:Bool):Group;
	/**
		Sets the `name` property of this Group.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Group;
	/**
		Sets the property as defined in `key` of each group member to the given value.
	**/
	function propertyValueSet(key:String, value:Float, ?step:Float, ?index:Float, ?direction:Float):Group;
	/**
		Adds the given value to the property as defined in `key` of each group member.
	**/
	function propertyValueInc(key:String, value:Float, ?step:Float, ?index:Float, ?direction:Float):Group;
	/**
		Sets the x of each group member.
	**/
	function setX(value:Float, ?step:Float):Group;
	/**
		Sets the y of each group member.
	**/
	function setY(value:Float, ?step:Float):Group;
	/**
		Sets the x, y of each group member.
	**/
	function setXY(x:Float, ?y:Float, ?stepX:Float, ?stepY:Float):Group;
	/**
		Adds the given value to the x of each group member.
	**/
	function incX(value:Float, ?step:Float):Group;
	/**
		Adds the given value to the y of each group member.
	**/
	function incY(value:Float, ?step:Float):Group;
	/**
		Adds the given value to the x, y of each group member.
	**/
	function incXY(x:Float, ?y:Float, ?stepX:Float, ?stepY:Float):Group;
	/**
		Iterate through the group members changing the position of each element to be that of the element that came before
		it in the array (or after it if direction = 1)
		
		The first group member position is set to x/y.
	**/
	function shiftPosition(x:Float, y:Float, ?direction:Float):Group;
	/**
		Sets the angle of each group member.
	**/
	function angle(value:Float, ?step:Float):Group;
	/**
		Sets the rotation of each group member.
	**/
	function rotate(value:Float, ?step:Float):Group;
	/**
		Rotates each group member around the given point by the given angle.
	**/
	function rotateAround(point:global.phaser.types.math.Vector2Like, angle:Float):Group;
	/**
		Rotates each group member around the given point by the given angle and distance.
	**/
	function rotateAroundDistance(point:global.phaser.types.math.Vector2Like, angle:Float, distance:Float):Group;
	/**
		Sets the alpha of each group member.
	**/
	function setAlpha(value:Float, ?step:Float):Group;
	/**
		Sets the tint of each group member.
	**/
	function setTint(topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):Group;
	/**
		Sets the originX, originY of each group member.
	**/
	function setOrigin(originX:Float, ?originY:Float, ?stepX:Float, ?stepY:Float):Group;
	/**
		Sets the scaleX of each group member.
	**/
	function scaleX(value:Float, ?step:Float):Group;
	/**
		Sets the scaleY of each group member.
	**/
	function scaleY(value:Float, ?step:Float):Group;
	/**
		Sets the scaleX, scaleY of each group member.
	**/
	function scaleXY(scaleX:Float, ?scaleY:Float, ?stepX:Float, ?stepY:Float):Group;
	/**
		Sets the depth of each group member.
	**/
	function setDepth(value:Float, ?step:Float):Group;
	/**
		Sets the blendMode of each group member.
	**/
	function setBlendMode(value:Float):Group;
	/**
		Passes all group members to the Input Manager to enable them for input with identical areas and callbacks.
	**/
	function setHitArea(hitArea:Dynamic, hitAreaCallback:global.phaser.types.input.HitAreaCallback):Group;
	/**
		Shuffles the group members in place.
	**/
	function shuffle():Group;
	/**
		Sets the visible of each group member.
	**/
	function setVisible(value:Bool, ?index:Float, ?direction:Float):Group;
	/**
		Toggles (flips) the visible state of each member of this group.
	**/
	function toggleVisible():Group;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Group;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Group;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Group;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Group;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Group;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Group;
	static var prototype : Group;
}