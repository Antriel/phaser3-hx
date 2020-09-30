package global.phaser.gameobjects;

/**
	A Group is a way for you to create, manipulate, or recycle similar Game Objects.
	
	Group membership is non-exclusive. A Game Object can belong to several groups, one group, or none.
	
	Groups themselves aren't displayable, and can't be positioned, rotated, scaled, or hidden.
**/
@:native("Phaser.GameObjects.Group") extern class Group {
	function new(scene:global.phaser.Scene, ?children:ts.AnyOf3<Array<GameObject>, global.phaser.types.gameobjects.group.GroupConfig, global.phaser.types.gameobjects.group.GroupCreateConfig>, ?config:ts.AnyOf2<global.phaser.types.gameobjects.group.GroupConfig, global.phaser.types.gameobjects.group.GroupCreateConfig>);
	/**
		This scene this group belongs to.
	**/
	var scene : global.phaser.Scene;
	/**
		Members of this group.
	**/
	var children : global.phaser.structs.Set<GameObject>;
	/**
		A flag identifying this object as a group.
	**/
	var isParent : Bool;
	/**
		A textual representation of this Game Object.
		Used internally by Phaser but is available for your own custom classes to populate.
	**/
	var type : String;
	/**
		The class to create new group members from.
	**/
	var classType : haxe.Constraints.Function;
	/**
		The name of this group.
		Empty by default and never populated by Phaser, this is left for developers to use.
	**/
	var name : String;
	/**
		Whether this group runs its {@link Phaser.GameObjects.Group#preUpdate} method (which may update any members).
	**/
	var active : Bool;
	/**
		The maximum size of this group, if used as a pool. -1 is no limit.
	**/
	var maxSize : Float;
	/**
		A default texture key to use when creating new group members.
		
		This is used in {@link Phaser.GameObjects.Group#create}
		but not in {@link Phaser.GameObjects.Group#createMultiple}.
	**/
	var defaultKey : String;
	/**
		A default texture frame to use when creating new group members.
	**/
	var defaultFrame : ts.AnyOf2<String, Float>;
	/**
		Whether to call the update method of any members.
	**/
	var runChildUpdate : Bool;
	/**
		A function to be called when adding or creating group members.
	**/
	dynamic function createCallback(item:GameObject):Void;
	/**
		A function to be called when removing group members.
	**/
	dynamic function removeCallback(item:GameObject):Void;
	/**
		A function to be called when creating several group members at once.
	**/
	dynamic function createMultipleCallback(items:Array<GameObject>):Void;
	/**
		Creates a new Game Object and adds it to this group, unless the group {@link Phaser.GameObjects.Group#isFull is full}.
		
		Calls {@link Phaser.GameObjects.Group#createCallback}.
	**/
	function create(?x:Float, ?y:Float, ?key:String, ?frame:ts.AnyOf2<String, Float>, ?visible:Bool, ?active:Bool):Dynamic;
	/**
		Creates several Game Objects and adds them to this group.
		
		If the group becomes {@link Phaser.GameObjects.Group#isFull}, no further Game Objects are created.
		
		Calls {@link Phaser.GameObjects.Group#createMultipleCallback} and {@link Phaser.GameObjects.Group#createCallback}.
	**/
	function createMultiple(config:ts.AnyOf2<global.phaser.types.gameobjects.group.GroupCreateConfig, Array<global.phaser.types.gameobjects.group.GroupCreateConfig>>):Array<Dynamic>;
	/**
		A helper for {@link Phaser.GameObjects.Group#createMultiple}.
	**/
	function createFromConfig(options:global.phaser.types.gameobjects.group.GroupCreateConfig):Array<Dynamic>;
	/**
		Updates any group members, if {@link Phaser.GameObjects.Group#runChildUpdate} is enabled.
	**/
	function preUpdate(time:Float, delta:Float):Void;
	/**
		Adds a Game Object to this group.
		
		Calls {@link Phaser.GameObjects.Group#createCallback}.
	**/
	function add(child:GameObject, ?addToScene:Bool):Group;
	/**
		Adds several Game Objects to this group.
		
		Calls {@link Phaser.GameObjects.Group#createCallback}.
	**/
	function addMultiple(children:Array<GameObject>, ?addToScene:Bool):Group;
	/**
		Removes a member of this Group and optionally removes it from the Scene and / or destroys it.
		
		Calls {@link Phaser.GameObjects.Group#removeCallback}.
	**/
	function remove(child:GameObject, ?removeFromScene:Bool, ?destroyChild:Bool):Group;
	/**
		Removes all members of this Group and optionally removes them from the Scene and / or destroys them.
		
		Does not call {@link Phaser.GameObjects.Group#removeCallback}.
	**/
	function clear(?removeFromScene:Bool, ?destroyChild:Bool):Group;
	/**
		Tests if a Game Object is a member of this group.
	**/
	function contains(child:GameObject):Bool;
	/**
		All members of the group.
	**/
	function getChildren():Array<GameObject>;
	/**
		The number of members of the group.
	**/
	function getLength():Float;
	/**
		Scans the Group, from top to bottom, for the first member that has an {@link Phaser.GameObjects.GameObject#active} state matching the argument,
		assigns `x` and `y`, and returns the member.
		
		If no matching member is found and `createIfNull` is true and the group isn't full then it will create a new Game Object using `x`, `y`, `key`, `frame`, and `visible`.
		Unless a new member is created, `key`, `frame`, and `visible` are ignored.
	**/
	function getFirst(?state:Bool, ?createIfNull:Bool, ?x:Float, ?y:Float, ?key:String, ?frame:ts.AnyOf2<String, Float>, ?visible:Bool):Dynamic;
	/**
		Scans the Group, from top to bottom, for the nth member that has an {@link Phaser.GameObjects.GameObject#active} state matching the argument,
		assigns `x` and `y`, and returns the member.
		
		If no matching member is found and `createIfNull` is true and the group isn't full then it will create a new Game Object using `x`, `y`, `key`, `frame`, and `visible`.
		Unless a new member is created, `key`, `frame`, and `visible` are ignored.
	**/
	function getFirstNth(nth:Float, ?state:Bool, ?createIfNull:Bool, ?x:Float, ?y:Float, ?key:String, ?frame:ts.AnyOf2<String, Float>, ?visible:Bool):Dynamic;
	/**
		Scans the Group for the last member that has an {@link Phaser.GameObjects.GameObject#active} state matching the argument,
		assigns `x` and `y`, and returns the member.
		
		If no matching member is found and `createIfNull` is true and the group isn't full then it will create a new Game Object using `x`, `y`, `key`, `frame`, and `visible`.
		Unless a new member is created, `key`, `frame`, and `visible` are ignored.
	**/
	function getLast(?state:Bool, ?createIfNull:Bool, ?x:Float, ?y:Float, ?key:String, ?frame:ts.AnyOf2<String, Float>, ?visible:Bool):Dynamic;
	/**
		Scans the Group for the last nth member that has an {@link Phaser.GameObjects.GameObject#active} state matching the argument,
		assigns `x` and `y`, and returns the member.
		
		If no matching member is found and `createIfNull` is true and the group isn't full then it will create a new Game Object using `x`, `y`, `key`, `frame`, and `visible`.
		Unless a new member is created, `key`, `frame`, and `visible` are ignored.
	**/
	function getLastNth(nth:Float, ?state:Bool, ?createIfNull:Bool, ?x:Float, ?y:Float, ?key:String, ?frame:ts.AnyOf2<String, Float>, ?visible:Bool):Dynamic;
	/**
		Scans the group for the first member that has an {@link Phaser.GameObjects.GameObject#active} state set to `false`,
		assigns `x` and `y`, and returns the member.
		
		If no inactive member is found and the group isn't full then it will create a new Game Object using `x`, `y`, `key`, `frame`, and `visible`.
		The new Game Object will have its active state set to `true`.
		Unless a new member is created, `key`, `frame`, and `visible` are ignored.
	**/
	function get(?x:Float, ?y:Float, ?key:String, ?frame:ts.AnyOf2<String, Float>, ?visible:Bool):Dynamic;
	/**
		Scans the group for the first member that has an {@link Phaser.GameObjects.GameObject#active} state set to `true`,
		assigns `x` and `y`, and returns the member.
		
		If no active member is found and `createIfNull` is `true` and the group isn't full then it will create a new one using `x`, `y`, `key`, `frame`, and `visible`.
		Unless a new member is created, `key`, `frame`, and `visible` are ignored.
	**/
	function getFirstAlive(?createIfNull:Bool, ?x:Float, ?y:Float, ?key:String, ?frame:ts.AnyOf2<String, Float>, ?visible:Bool):Dynamic;
	/**
		Scans the group for the first member that has an {@link Phaser.GameObjects.GameObject#active} state set to `false`,
		assigns `x` and `y`, and returns the member.
		
		If no inactive member is found and `createIfNull` is `true` and the group isn't full then it will create a new one using `x`, `y`, `key`, `frame`, and `visible`.
		The new Game Object will have an active state set to `true`.
		Unless a new member is created, `key`, `frame`, and `visible` are ignored.
	**/
	function getFirstDead(?createIfNull:Bool, ?x:Float, ?y:Float, ?key:String, ?frame:ts.AnyOf2<String, Float>, ?visible:Bool):Dynamic;
	/**
		{@link Phaser.GameObjects.Components.Animation#play Plays} an animation for all members of this group.
	**/
	function playAnimation(key:String, ?startFrame:String):Group;
	/**
		Whether this group's size at its {@link Phaser.GameObjects.Group#maxSize maximum}.
	**/
	function isFull():Bool;
	/**
		Counts the number of active (or inactive) group members.
	**/
	function countActive(?value:Bool):Float;
	/**
		Counts the number of in-use (active) group members.
	**/
	function getTotalUsed():Float;
	/**
		The difference of {@link Phaser.GameObjects.Group#maxSize} and the number of active group members.
		
		This represents the number of group members that could be created or reactivated before reaching the size limit.
	**/
	function getTotalFree():Float;
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
		Deactivates a member of this group.
	**/
	function kill(gameObject:GameObject):Void;
	/**
		Deactivates and hides a member of this group.
	**/
	function killAndHide(gameObject:GameObject):Void;
	/**
		Sets the visible of each group member.
	**/
	function setVisible(value:Bool, ?index:Float, ?direction:Float):Group;
	/**
		Toggles (flips) the visible state of each member of this group.
	**/
	function toggleVisible():Group;
	/**
		Empties this group and removes it from the Scene.
		
		Does not call {@link Phaser.GameObjects.Group#removeCallback}.
	**/
	function destroy(?destroyChildren:Bool):Void;
	static var prototype : Group;
}