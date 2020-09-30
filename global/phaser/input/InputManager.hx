package global.phaser.input;

/**
	The Input Manager is responsible for handling the pointer related systems in a single Phaser Game instance.
	
	Based on the Game Config it will create handlers for mouse and touch support.
	
	Keyboard and Gamepad are plugins, handled directly by the InputPlugin class.
	
	It then manages the events, pointer creation and general hit test related operations.
	
	You rarely need to interact with the Input Manager directly, and as such, all of its properties and methods
	should be considered private. Instead, you should use the Input Plugin, which is a Scene level system, responsible
	for dealing with all input events for a Scene.
**/
@:native("Phaser.Input.InputManager") extern class InputManager {
	function new(game:global.phaser.Game, config:Dynamic);
	/**
		The Game instance that owns the Input Manager.
		A Game only maintains on instance of the Input Manager at any time.
	**/
	final game : global.phaser.Game;
	/**
		A reference to the global Game Scale Manager.
		Used for all bounds checks and pointer scaling.
	**/
	var scaleManager : global.phaser.scale.ScaleManager;
	/**
		The Canvas that is used for all DOM event input listeners.
	**/
	var canvas : js.html.CanvasElement;
	/**
		The Game Configuration object, as set during the game boot.
	**/
	var config : global.phaser.core.Config;
	/**
		If set, the Input Manager will run its update loop every frame.
	**/
	var enabled : Bool;
	/**
		The Event Emitter instance that the Input Manager uses to emit events from.
	**/
	var events : global.phaser.events.EventEmitter;
	/**
		Are any mouse or touch pointers currently over the game canvas?
		This is updated automatically by the canvas over and out handlers.
	**/
	final isOver : Bool;
	/**
		The default CSS cursor to be used when interacting with your game.
		
		See the `setDefaultCursor` method for more details.
	**/
	var defaultCursor : String;
	/**
		A reference to the Keyboard Manager class, if enabled via the `input.keyboard` Game Config property.
	**/
	var keyboard : global.phaser.input.keyboard.KeyboardManager;
	/**
		A reference to the Mouse Manager class, if enabled via the `input.mouse` Game Config property.
	**/
	var mouse : global.phaser.input.mouse.MouseManager;
	/**
		A reference to the Touch Manager class, if enabled via the `input.touch` Game Config property.
	**/
	var touch : global.phaser.input.touch.TouchManager;
	/**
		An array of Pointers that have been added to the game.
		The first entry is reserved for the Mouse Pointer, the rest are Touch Pointers.
		
		By default there is 1 touch pointer enabled. If you need more use the `addPointer` method to start them,
		or set the `input.activePointers` property in the Game Config.
	**/
	var pointers : Array<Pointer>;
	/**
		The number of touch objects activated and being processed each update.
		
		You can change this by either calling `addPointer` at run-time, or by
		setting the `input.activePointers` property in the Game Config.
	**/
	final pointersTotal : Float;
	/**
		The mouse has its own unique Pointer object, which you can reference directly if making a _desktop specific game_.
		If you are supporting both desktop and touch devices then do not use this property, instead use `activePointer`
		which will always map to the most recently interacted pointer.
	**/
	var mousePointer : Pointer;
	/**
		The most recently active Pointer object.
		
		If you've only 1 Pointer in your game then this will accurately be either the first finger touched, or the mouse.
		
		If your game doesn't need to support multi-touch then you can safely use this property in all of your game
		code and it will adapt to be either the mouse or the touch, based on device.
	**/
	var activePointer : Pointer;
	/**
		If the top-most Scene in the Scene List receives an input it will stop input from
		propagating any lower down the scene list, i.e. if you have a UI Scene at the top
		and click something on it, that click will not then be passed down to any other
		Scene below. Disable this to have input events passed through all Scenes, all the time.
	**/
	var globalTopOnly : Bool;
	/**
		The time this Input Manager was last updated.
		This value is populated by the Game Step each frame.
	**/
	final time : Float;
	/**
		The Boot handler is called by Phaser.Game when it first starts up.
		The renderer is available by now.
	**/
	private function boot():Void;
	/**
		Tells the Input system to set a custom cursor.
		
		This cursor will be the default cursor used when interacting with the game canvas.
		
		If an Interactive Object also sets a custom cursor, this is the cursor that is reset after its use.
		
		Any valid CSS cursor value is allowed, including paths to image files, i.e.:
		
		```javascript
		this.input.setDefaultCursor('url(assets/cursors/sword.cur), pointer');
		```
		
		Please read about the differences between browsers when it comes to the file formats and sizes they support:
		
		https://developer.mozilla.org/en-US/docs/Web/CSS/cursor
		https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_User_Interface/Using_URL_values_for_the_cursor_property
		
		It's up to you to pick a suitable cursor format that works across the range of browsers you need to support.
	**/
	function setDefaultCursor(cursor:String):Void;
	/**
		Adds new Pointer objects to the Input Manager.
		
		By default Phaser creates 2 pointer objects: `mousePointer` and `pointer1`.
		
		You can create more either by calling this method, or by setting the `input.activePointers` property
		in the Game Config, up to a maximum of 10 pointers.
		
		The first 10 pointers are available via the `InputPlugin.pointerX` properties, once they have been added
		via this method.
	**/
	function addPointer(?quantity:Float):Array<Pointer>;
	/**
		Internal method that gets a list of all the active Input Plugins in the game
		and updates each of them in turn, in reverse order (top to bottom), to allow
		for DOM top-level event handling simulation.
	**/
	function updateInputPlugins(type:Float, pointers:Array<Pointer>):Void;
	/**
		Performs a hit test using the given Pointer and camera, against an array of interactive Game Objects.
		
		The Game Objects are culled against the camera, and then the coordinates are translated into the local camera space
		and used to determine if they fall within the remaining Game Objects hit areas or not.
		
		If nothing is matched an empty array is returned.
		
		This method is called automatically by InputPlugin.hitTestPointer and doesn't usually need to be invoked directly.
	**/
	function hitTest(pointer:Pointer, gameObjects:Array<Dynamic>, camera:global.phaser.cameras.scene2d.Camera, ?output:Array<Dynamic>):Array<Dynamic>;
	/**
		Checks if the given x and y coordinate are within the hit area of the Game Object.
		
		This method assumes that the coordinate values have already been translated into the space of the Game Object.
		
		If the coordinates are within the hit area they are set into the Game Objects Input `localX` and `localY` properties.
	**/
	function pointWithinHitArea(gameObject:global.phaser.gameobjects.GameObject, x:Float, y:Float):Bool;
	/**
		Checks if the given x and y coordinate are within the hit area of the Interactive Object.
		
		This method assumes that the coordinate values have already been translated into the space of the Interactive Object.
		
		If the coordinates are within the hit area they are set into the Interactive Objects Input `localX` and `localY` properties.
	**/
	function pointWithinInteractiveObject(object:global.phaser.types.input.InteractiveObject, x:Float, y:Float):Bool;
	/**
		Transforms the pageX and pageY values of a Pointer into the scaled coordinate space of the Input Manager.
	**/
	function transformPointer(pointer:Pointer, pageX:Float, pageY:Float, wasMove:Bool):Void;
	/**
		Destroys the Input Manager and all of its systems.
		
		There is no way to recover from doing this.
	**/
	function destroy():Void;
	static var prototype : InputManager;
}