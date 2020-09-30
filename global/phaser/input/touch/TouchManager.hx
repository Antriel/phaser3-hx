package global.phaser.input.touch;

/**
	The Touch Manager is a helper class that belongs to the Input Manager.
	
	Its role is to listen for native DOM Touch Events and then pass them onto the Input Manager for further processing.
	
	You do not need to create this class directly, the Input Manager will create an instance of it automatically.
**/
@:native("Phaser.Input.Touch.TouchManager") extern class TouchManager {
	function new(inputManager:global.phaser.input.InputManager);
	/**
		A reference to the Input Manager.
	**/
	var manager : global.phaser.input.InputManager;
	/**
		If true the DOM events will have event.preventDefault applied to them, if false they will propagate fully.
	**/
	var capture : Bool;
	/**
		A boolean that controls if the Touch Manager is enabled or not.
		Can be toggled on the fly.
	**/
	var enabled : Bool;
	/**
		The Touch Event target, as defined in the Game Config.
		Typically the canvas to which the game is rendering, but can be any interactive DOM element.
	**/
	var target : Dynamic;
	/**
		The Touch Start event handler function.
		Initially empty and bound in the `startListeners` method.
	**/
	var onTouchStart : haxe.Constraints.Function;
	/**
		The Touch Start event handler function specifically for events on the Window.
		Initially empty and bound in the `startListeners` method.
	**/
	var onTouchStartWindow : haxe.Constraints.Function;
	/**
		The Touch Move event handler function.
		Initially empty and bound in the `startListeners` method.
	**/
	var onTouchMove : haxe.Constraints.Function;
	/**
		The Touch End event handler function.
		Initially empty and bound in the `startListeners` method.
	**/
	var onTouchEnd : haxe.Constraints.Function;
	/**
		The Touch End event handler function specifically for events on the Window.
		Initially empty and bound in the `startListeners` method.
	**/
	var onTouchEndWindow : haxe.Constraints.Function;
	/**
		The Touch Cancel event handler function.
		Initially empty and bound in the `startListeners` method.
	**/
	var onTouchCancel : haxe.Constraints.Function;
	/**
		The Touch Cancel event handler function specifically for events on the Window.
		Initially empty and bound in the `startListeners` method.
	**/
	var onTouchCancelWindow : haxe.Constraints.Function;
	/**
		The Touch Over event handler function.
		Initially empty and bound in the `startListeners` method.
	**/
	var onTouchOver : haxe.Constraints.Function;
	/**
		The Touch Out event handler function.
		Initially empty and bound in the `startListeners` method.
	**/
	var onTouchOut : haxe.Constraints.Function;
	/**
		Attempts to disable the context menu from appearing if you touch-hold on the browser.
		
		Works by listening for the `contextmenu` event and prevent defaulting it.
		
		Use this if you need to disable the OS context menu on mobile.
	**/
	function disableContextMenu():TouchManager;
	/**
		Starts the Touch Event listeners running as long as an input target is set.
		
		This method is called automatically if Touch Input is enabled in the game config,
		which it is by default. However, you can call it manually should you need to
		delay input capturing until later in the game.
	**/
	function startListeners():Void;
	/**
		Stops the Touch Event listeners.
		This is called automatically and does not need to be manually invoked.
	**/
	function stopListeners():Void;
	/**
		Destroys this Touch Manager instance.
	**/
	function destroy():Void;
	static var prototype : TouchManager;
}