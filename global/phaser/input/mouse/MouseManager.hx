package global.phaser.input.mouse;

/**
	The Mouse Manager is a helper class that belongs to the Input Manager.
	
	Its role is to listen for native DOM Mouse Events and then pass them onto the Input Manager for further processing.
	
	You do not need to create this class directly, the Input Manager will create an instance of it automatically.
**/
@:native("Phaser.Input.Mouse.MouseManager") extern class MouseManager {
	function new(inputManager:global.phaser.input.InputManager);
	/**
		A reference to the Input Manager.
	**/
	var manager : global.phaser.input.InputManager;
	/**
		If `true` the DOM `mousedown` event will have `preventDefault` set.
	**/
	var preventDefaultDown : Bool;
	/**
		If `true` the DOM `mouseup` event will have `preventDefault` set.
	**/
	var preventDefaultUp : Bool;
	/**
		If `true` the DOM `mousemove` event will have `preventDefault` set.
	**/
	var preventDefaultMove : Bool;
	/**
		If `true` the DOM `wheel` event will have `preventDefault` set.
	**/
	var preventDefaultWheel : Bool;
	/**
		A boolean that controls if the Mouse Manager is enabled or not.
		Can be toggled on the fly.
	**/
	var enabled : Bool;
	/**
		The Mouse target, as defined in the Game Config.
		Typically the canvas to which the game is rendering, but can be any interactive DOM element.
	**/
	var target : Dynamic;
	/**
		If the mouse has been pointer locked successfully this will be set to true.
	**/
	var locked : Bool;
	/**
		The Mouse Move Event handler.
		This function is sent the native DOM MouseEvent.
		Initially empty and bound in the `startListeners` method.
	**/
	var onMouseMove : haxe.Constraints.Function;
	/**
		The Mouse Down Event handler.
		This function is sent the native DOM MouseEvent.
		Initially empty and bound in the `startListeners` method.
	**/
	var onMouseDown : haxe.Constraints.Function;
	/**
		The Mouse Up Event handler.
		This function is sent the native DOM MouseEvent.
		Initially empty and bound in the `startListeners` method.
	**/
	var onMouseUp : haxe.Constraints.Function;
	/**
		The Mouse Down Event handler specifically for events on the Window.
		This function is sent the native DOM MouseEvent.
		Initially empty and bound in the `startListeners` method.
	**/
	var onMouseDownWindow : haxe.Constraints.Function;
	/**
		The Mouse Up Event handler specifically for events on the Window.
		This function is sent the native DOM MouseEvent.
		Initially empty and bound in the `startListeners` method.
	**/
	var onMouseUpWindow : haxe.Constraints.Function;
	/**
		The Mouse Over Event handler.
		This function is sent the native DOM MouseEvent.
		Initially empty and bound in the `startListeners` method.
	**/
	var onMouseOver : haxe.Constraints.Function;
	/**
		The Mouse Out Event handler.
		This function is sent the native DOM MouseEvent.
		Initially empty and bound in the `startListeners` method.
	**/
	var onMouseOut : haxe.Constraints.Function;
	/**
		The Mouse Wheel Event handler.
		This function is sent the native DOM MouseEvent.
		Initially empty and bound in the `startListeners` method.
	**/
	var onMouseWheel : haxe.Constraints.Function;
	/**
		Internal pointerLockChange handler.
		This function is sent the native DOM MouseEvent.
		Initially empty and bound in the `startListeners` method.
	**/
	var pointerLockChange : haxe.Constraints.Function;
	/**
		Are the event listeners hooked into `window.top` or `window`?
		
		This is set during the `boot` sequence. If the browser does not have access to `window.top`,
		such as in cross-origin iframe environments, this property gets set to `false` and the events
		are hooked into `window` instead.
	**/
	final isTop : Bool;
	/**
		Attempts to disable the context menu from appearing if you right-click on the browser.
		
		Works by listening for the `contextmenu` event and prevent defaulting it.
		
		Use this if you need to enable right-button mouse support in your game, and the browser
		menu keeps getting in the way.
	**/
	function disableContextMenu():MouseManager;
	/**
		If the browser supports it, you can request that the pointer be locked to the browser window.
		
		This is classically known as 'FPS controls', where the pointer can't leave the browser until
		the user presses an exit key.
		
		If the browser successfully enters a locked state, a `POINTER_LOCK_CHANGE_EVENT` will be dispatched,
		from the games Input Manager, with an `isPointerLocked` property.
		
		It is important to note that pointer lock can only be enabled after an 'engagement gesture',
		see: https://w3c.github.io/pointerlock/#dfn-engagement-gesture.
		
		Note for Firefox: There is a bug in certain Firefox releases that cause native DOM events like
		`mousemove` to fire continuously when in pointer lock mode. You can get around this by setting
		`this.preventDefaultMove` to `false` in this class. You may also need to do the same for
		`preventDefaultDown` and/or `preventDefaultUp`. Please test combinations of these if you encounter
		the error.
	**/
	function requestPointerLock():Void;
	/**
		If the browser supports pointer lock, this will request that the pointer lock is released. If
		the browser successfully enters a locked state, a 'POINTER_LOCK_CHANGE_EVENT' will be
		dispatched - from the game's input manager - with an `isPointerLocked` property.
	**/
	function releasePointerLock():Void;
	/**
		Starts the Mouse Event listeners running.
		This is called automatically and does not need to be manually invoked.
	**/
	function startListeners():Void;
	/**
		Stops the Mouse Event listeners.
		This is called automatically and does not need to be manually invoked.
	**/
	function stopListeners():Void;
	/**
		Destroys this Mouse Manager instance.
	**/
	function destroy():Void;
	static var prototype : MouseManager;
}