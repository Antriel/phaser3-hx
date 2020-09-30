package global.phaser.gameobjects;

/**
	The Display List plugin.
	
	Display Lists belong to a Scene and maintain the list of Game Objects to render every frame.
	
	Some of these Game Objects may also be part of the Scene's [Update List]{@link Phaser.GameObjects.UpdateList}, for updating.
**/
@:native("Phaser.GameObjects.DisplayList") extern class DisplayList extends global.phaser.structs.List_<GameObject> {
	function new(scene:global.phaser.Scene);
	/**
		The flag the determines whether Game Objects should be sorted when `depthSort()` is called.
	**/
	var sortChildrenFlag : Bool;
	/**
		The Scene that this Display List belongs to.
	**/
	var scene : global.phaser.Scene;
	/**
		The Scene's Systems.
	**/
	var systems : global.phaser.scenes.Systems;
	/**
		Force a sort of the display list on the next call to depthSort.
	**/
	function queueDepthSort():Void;
	/**
		Immediately sorts the display list if the flag is set.
	**/
	function depthSort():Void;
	/**
		Compare the depth of two Game Objects.
	**/
	function sortByDepth(childA:GameObject, childB:GameObject):Float;
	/**
		Returns an array which contains all objects currently on the Display List.
		This is a reference to the main list array, not a copy of it, so be careful not to modify it.
	**/
	function getChildren():Array<GameObject>;
	static var prototype : DisplayList;
}