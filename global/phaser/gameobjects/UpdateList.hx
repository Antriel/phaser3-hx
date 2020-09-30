package global.phaser.gameobjects;

/**
	The Update List plugin.
	
	Update Lists belong to a Scene and maintain the list Game Objects to be updated every frame.
	
	Some or all of these Game Objects may also be part of the Scene's [Display List]{@link Phaser.GameObjects.DisplayList}, for Rendering.
**/
@:native("Phaser.GameObjects.UpdateList") extern class UpdateList extends global.phaser.structs.ProcessQueue<GameObject> {
	function new(scene:global.phaser.Scene);
	/**
		The Scene that the Update List belongs to.
	**/
	var scene : global.phaser.Scene;
	/**
		The Scene's Systems.
	**/
	var systems : global.phaser.scenes.Systems;
	/**
		The update step.
		
		Pre-updates every active Game Object in the list.
	**/
	function sceneUpdate(time:Float, delta:Float):Void;
	/**
		Removes all active items from this Process Queue.
		
		All the items are marked as 'pending destroy' and fully removed in the next update.
	**/
	function removeAll():UpdateList;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):UpdateList;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):UpdateList;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):UpdateList;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):UpdateList;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):UpdateList;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):UpdateList;
	static var prototype : UpdateList;
}