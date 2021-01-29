package global.phaser.input.gamepad;

/**
	The Gamepad Plugin is an input plugin that belongs to the Scene-owned Input system.
	
	Its role is to listen for native DOM Gamepad Events and then process them.
	
	You do not need to create this class directly, the Input system will create an instance of it automatically.
	
	You can access it from within a Scene using `this.input.gamepad`.
	
	To listen for a gamepad being connected:
	
	```javascript
	this.input.gamepad.once('connected', function (pad) {
	     //   'pad' is a reference to the gamepad that was just connected
	});
	```
	
	Note that the browser may require you to press a button on a gamepad before it will allow you to access it,
	this is for security reasons. However, it may also trust the page already, in which case you won't get the
	'connected' event and instead should check `GamepadPlugin.total` to see if it thinks there are any gamepads
	already connected.
	
	Once you have received the connected event, or polled the gamepads and found them enabled, you can access
	them via the built-in properties `GamepadPlugin.pad1` to `pad4`, for up to 4 game pads. With a reference
	to the gamepads you can poll its buttons and axis sticks. See the properties and methods available on
	the `Gamepad` class for more details.
	
	As of September 2020 Chrome, and likely other browsers, will soon start to require that games requesting
	access to the Gamepad API are running under SSL. They will actively block API access if they are not.
	
	For more information about Gamepad support in browsers see the following resources:
	
	https://developer.mozilla.org/en-US/docs/Web/API/Gamepad_API
	https://developer.mozilla.org/en-US/docs/Web/API/Gamepad_API/Using_the_Gamepad_API
	https://www.smashingmagazine.com/2015/11/gamepad-api-in-web-games/
	http://html5gamepad.com/
**/
@:native("Phaser.Input.Gamepad.GamepadPlugin") extern class GamepadPlugin extends global.phaser.events.EventEmitter {
	function new(sceneInputPlugin:global.phaser.input.InputPlugin);
	/**
		A reference to the Scene that this Input Plugin is responsible for.
	**/
	var scene : global.phaser.Scene;
	/**
		A reference to the Scene Systems Settings.
	**/
	var settings : global.phaser.types.scenes.SettingsObject;
	/**
		A reference to the Scene Input Plugin that created this Keyboard Plugin.
	**/
	var sceneInputPlugin : global.phaser.input.InputPlugin;
	/**
		A boolean that controls if the Gamepad Manager is enabled or not.
		Can be toggled on the fly.
	**/
	var enabled : Bool;
	/**
		The Gamepad Event target, as defined in the Game Config.
		Typically the browser window, but can be any interactive DOM element.
	**/
	var target : Dynamic;
	/**
		An array of the connected Gamepads.
	**/
	var gamepads : Array<Gamepad>;
	/**
		Checks to see if both this plugin and the Scene to which it belongs is active.
	**/
	function isActive():Bool;
	/**
		Disconnects all current Gamepads.
	**/
	function disconnectAll():Void;
	/**
		Returns an array of all currently connected Gamepads.
	**/
	function getAll():Array<Gamepad>;
	/**
		Looks-up a single Gamepad based on the given index value.
	**/
	function getPad(index:Float):Gamepad;
	/**
		The total number of connected game pads.
	**/
	var total : Float;
	/**
		A reference to the first connected Gamepad.
		
		This will be undefined if either no pads are connected, or the browser
		has not yet issued a gamepadconnect, which can happen even if a Gamepad
		is plugged in, but hasn't yet had any buttons pressed on it.
	**/
	var pad1 : Gamepad;
	/**
		A reference to the second connected Gamepad.
		
		This will be undefined if either no pads are connected, or the browser
		has not yet issued a gamepadconnect, which can happen even if a Gamepad
		is plugged in, but hasn't yet had any buttons pressed on it.
	**/
	var pad2 : Gamepad;
	/**
		A reference to the third connected Gamepad.
		
		This will be undefined if either no pads are connected, or the browser
		has not yet issued a gamepadconnect, which can happen even if a Gamepad
		is plugged in, but hasn't yet had any buttons pressed on it.
	**/
	var pad3 : Gamepad;
	/**
		A reference to the fourth connected Gamepad.
		
		This will be undefined if either no pads are connected, or the browser
		has not yet issued a gamepadconnect, which can happen even if a Gamepad
		is plugged in, but hasn't yet had any buttons pressed on it.
	**/
	var pad4 : Gamepad;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):GamepadPlugin;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):GamepadPlugin;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):GamepadPlugin;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):GamepadPlugin;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):GamepadPlugin;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):GamepadPlugin;
	static var prototype : GamepadPlugin;
}