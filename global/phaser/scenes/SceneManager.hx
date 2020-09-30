package global.phaser.scenes;

/**
	The Scene Manager.
	
	The Scene Manager is a Game level system, responsible for creating, processing and updating all of the
	Scenes in a Game instance.
**/
@:native("Phaser.Scenes.SceneManager") extern class SceneManager {
	function new(game:global.phaser.Game, sceneConfig:Dynamic);
	/**
		The Game that this SceneManager belongs to.
	**/
	var game : global.phaser.Game;
	/**
		An object that maps the keys to the scene so we can quickly get a scene from a key without iteration.
	**/
	var keys : Dynamic;
	/**
		The array in which all of the scenes are kept.
	**/
	var scenes : Array<Dynamic>;
	/**
		Is the Scene Manager actively processing the Scenes list?
	**/
	final isProcessing : Bool;
	/**
		Has the Scene Manager properly started?
	**/
	final isBooted : Bool;
	/**
		Do any of the Cameras in any of the Scenes require a custom viewport?
		If not we can skip scissor tests.
	**/
	var customViewports : Float;
	/**
		Process the Scene operations queue.
	**/
	function processQueue():Void;
	/**
		Adds a new Scene into the SceneManager.
		You must give each Scene a unique key by which you'll identify it.
		
		The `sceneConfig` can be:
		
		* A `Phaser.Scene` object, or an object that extends it.
		* A plain JavaScript object
		* A JavaScript ES6 Class that extends `Phaser.Scene`
		* A JavaScript ES5 prototype based Class
		* A JavaScript function
		
		If a function is given then a new Scene will be created by calling it.
	**/
	function add(key:String, sceneConfig:ts.AnyOf4<haxe.Constraints.Function, global.phaser.Scene, global.phaser.types.scenes.SettingsConfig, global.phaser.types.scenes.CreateSceneFromObjectConfig>, ?autoStart:Bool, ?data:Dynamic):global.phaser.Scene;
	/**
		Removes a Scene from the SceneManager.
		
		The Scene is removed from the local scenes array, it's key is cleared from the keys
		cache and Scene.Systems.destroy is then called on it.
		
		If the SceneManager is processing the Scenes when this method is called it will
		queue the operation for the next update sequence.
	**/
	function remove(key:String):SceneManager;
	/**
		Updates the Scenes.
	**/
	function update(time:Float, delta:Float):Void;
	/**
		Renders the Scenes.
	**/
	function render(renderer:ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>):Void;
	/**
		Returns an array of all the current Scenes being managed by this Scene Manager.
		
		You can filter the output by the active state of the Scene and choose to have
		the array returned in normal or reversed order.
	**/
	function getScenes(?isActive:Bool, ?inReverse:Bool):Array<global.phaser.Scene>;
	/**
		Retrieves a Scene.
	**/
	function getScene(key:ts.AnyOf2<String, global.phaser.Scene>):global.phaser.Scene;
	/**
		Determines whether a Scene is running.
	**/
	function isActive(key:String):Bool;
	/**
		Determines whether a Scene is paused.
	**/
	function isPaused(key:String):Bool;
	/**
		Determines whether a Scene is visible.
	**/
	function isVisible(key:String):Bool;
	/**
		Determines whether a Scene is sleeping.
	**/
	function isSleeping(key:String):Bool;
	/**
		Pauses the given Scene.
	**/
	function pause(key:String, ?data:Dynamic):SceneManager;
	/**
		Resumes the given Scene.
	**/
	function resume(key:String, ?data:Dynamic):SceneManager;
	/**
		Puts the given Scene to sleep.
	**/
	function sleep(key:String, ?data:Dynamic):SceneManager;
	/**
		Awakens the given Scene.
	**/
	function wake(key:String, ?data:Dynamic):SceneManager;
	/**
		Runs the given Scene.
		
		If the given Scene is paused, it will resume it. If sleeping, it will wake it.
		If not running at all, it will be started.
		
		Use this if you wish to open a modal Scene by calling `pause` on the current
		Scene, then `run` on the modal Scene.
	**/
	function run(key:String, ?data:Dynamic):SceneManager;
	/**
		Starts the given Scene.
	**/
	function start(key:String, ?data:Dynamic):SceneManager;
	/**
		Stops the given Scene.
	**/
	function stop(key:String, ?data:Dynamic):SceneManager;
	/**
		Sleeps one one Scene and starts the other.
	**/
	@:native("switch")
	function switch_(from:String, to:String):SceneManager;
	/**
		Retrieves a Scene by numeric index.
	**/
	function getAt(index:Float):Null<global.phaser.Scene>;
	/**
		Retrieves the numeric index of a Scene.
	**/
	function getIndex(key:ts.AnyOf2<String, global.phaser.Scene>):Float;
	/**
		Brings a Scene to the top of the Scenes list.
		
		This means it will render above all other Scenes.
	**/
	function bringToTop(key:ts.AnyOf2<String, global.phaser.Scene>):SceneManager;
	/**
		Sends a Scene to the back of the Scenes list.
		
		This means it will render below all other Scenes.
	**/
	function sendToBack(key:ts.AnyOf2<String, global.phaser.Scene>):SceneManager;
	/**
		Moves a Scene down one position in the Scenes list.
	**/
	function moveDown(key:ts.AnyOf2<String, global.phaser.Scene>):SceneManager;
	/**
		Moves a Scene up one position in the Scenes list.
	**/
	function moveUp(key:ts.AnyOf2<String, global.phaser.Scene>):SceneManager;
	/**
		Moves a Scene so it is immediately above another Scene in the Scenes list.
		
		This means it will render over the top of the other Scene.
	**/
	function moveAbove(keyA:ts.AnyOf2<String, global.phaser.Scene>, keyB:ts.AnyOf2<String, global.phaser.Scene>):SceneManager;
	/**
		Moves a Scene so it is immediately below another Scene in the Scenes list.
		
		This means it will render behind the other Scene.
	**/
	function moveBelow(keyA:ts.AnyOf2<String, global.phaser.Scene>, keyB:ts.AnyOf2<String, global.phaser.Scene>):SceneManager;
	/**
		Swaps the positions of two Scenes in the Scenes list.
	**/
	function swapPosition(keyA:ts.AnyOf2<String, global.phaser.Scene>, keyB:ts.AnyOf2<String, global.phaser.Scene>):SceneManager;
	/**
		Dumps debug information about each Scene to the developer console.
	**/
	function dump():Void;
	/**
		Destroy the SceneManager and all of its Scene's systems.
	**/
	function destroy():Void;
	static var prototype : SceneManager;
}