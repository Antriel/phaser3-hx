package global.phaser.input.gamepad;

/**
	A single Gamepad.
	
	These are created, updated and managed by the Gamepad Plugin.
**/
@:native("Phaser.Input.Gamepad.Gamepad") extern class Gamepad extends global.phaser.events.EventEmitter {
	function new(manager:GamepadPlugin, pad:global.phaser.types.input.gamepad.Pad);
	/**
		A reference to the Gamepad Plugin.
	**/
	var manager : GamepadPlugin;
	/**
		A reference to the native Gamepad object that is connected to the browser.
	**/
	var pad : Dynamic;
	/**
		A string containing some information about the controller.
		
		This is not strictly specified, but in Firefox it will contain three pieces of information
		separated by dashes (-): two 4-digit hexadecimal strings containing the USB vendor and
		product id of the controller, and the name of the controller as provided by the driver.
		In Chrome it will contain the name of the controller as provided by the driver,
		followed by vendor and product 4-digit hexadecimal strings.
	**/
	var id : String;
	/**
		An integer that is unique for each Gamepad currently connected to the system.
		This can be used to distinguish multiple controllers.
		Note that disconnecting a device and then connecting a new device may reuse the previous index.
	**/
	var index : Float;
	/**
		An array of Gamepad Button objects, corresponding to the different buttons available on the Gamepad.
	**/
	var buttons : Array<Button>;
	/**
		An array of Gamepad Axis objects, corresponding to the different axes available on the Gamepad, if any.
	**/
	var axes : Array<Axis>;
	/**
		The Gamepad's Haptic Actuator (Vibration / Rumble support).
		This is highly experimental and only set if both present on the device,
		and exposed by both the hardware and browser.
	**/
	var vibration : js.html.GamepadHapticActuator;
	/**
		A Vector2 containing the most recent values from the Gamepad's left axis stick.
		This is updated automatically as part of the Gamepad.update cycle.
		The H Axis is mapped to the `Vector2.x` property, and the V Axis to the `Vector2.y` property.
		The values are based on the Axis thresholds.
		If the Gamepad does not have a left axis stick, the values will always be zero.
	**/
	var leftStick : global.phaser.math.Vector2;
	/**
		A Vector2 containing the most recent values from the Gamepad's right axis stick.
		This is updated automatically as part of the Gamepad.update cycle.
		The H Axis is mapped to the `Vector2.x` property, and the V Axis to the `Vector2.y` property.
		The values are based on the Axis thresholds.
		If the Gamepad does not have a right axis stick, the values will always be zero.
	**/
	var rightStick : global.phaser.math.Vector2;
	/**
		Gets the total number of axis this Gamepad claims to support.
	**/
	function getAxisTotal():Float;
	/**
		Gets the value of an axis based on the given index.
		The index must be valid within the range of axes supported by this Gamepad.
		The return value will be a float between 0 and 1.
	**/
	function getAxisValue(index:Float):Float;
	/**
		Sets the threshold value of all axis on this Gamepad.
		The value is a float between 0 and 1 and is the amount below which the axis is considered as not having been moved.
	**/
	function setAxisThreshold(value:Float):Void;
	/**
		Gets the total number of buttons this Gamepad claims to have.
	**/
	function getButtonTotal():Float;
	/**
		Gets the value of a button based on the given index.
		The index must be valid within the range of buttons supported by this Gamepad.
		
		The return value will be either 0 or 1 for an analogue button, or a float between 0 and 1
		for a pressure-sensitive digital button, such as the shoulder buttons on a Dual Shock.
	**/
	function getButtonValue(index:Float):Float;
	/**
		Returns if the button is pressed down or not.
		The index must be valid within the range of buttons supported by this Gamepad.
	**/
	function isButtonDown(index:Float):Bool;
	/**
		Is this Gamepad currently connected or not?
	**/
	var connected : Bool;
	/**
		A timestamp containing the most recent time this Gamepad was updated.
	**/
	var timestamp : Float;
	/**
		Is the Gamepad's Left button being pressed?
		If the Gamepad doesn't have this button it will always return false.
		This is the d-pad left button under standard Gamepad mapping.
	**/
	var left : Bool;
	/**
		Is the Gamepad's Right button being pressed?
		If the Gamepad doesn't have this button it will always return false.
		This is the d-pad right button under standard Gamepad mapping.
	**/
	var right : Bool;
	/**
		Is the Gamepad's Up button being pressed?
		If the Gamepad doesn't have this button it will always return false.
		This is the d-pad up button under standard Gamepad mapping.
	**/
	var up : Bool;
	/**
		Is the Gamepad's Down button being pressed?
		If the Gamepad doesn't have this button it will always return false.
		This is the d-pad down button under standard Gamepad mapping.
	**/
	var down : Bool;
	/**
		Is the Gamepad's bottom button in the right button cluster being pressed?
		If the Gamepad doesn't have this button it will always return false.
		On a Dual Shock controller it's the X button.
		On an XBox controller it's the A button.
	**/
	var A : Bool;
	/**
		Is the Gamepad's top button in the right button cluster being pressed?
		If the Gamepad doesn't have this button it will always return false.
		On a Dual Shock controller it's the Triangle button.
		On an XBox controller it's the Y button.
	**/
	var Y : Bool;
	/**
		Is the Gamepad's left button in the right button cluster being pressed?
		If the Gamepad doesn't have this button it will always return false.
		On a Dual Shock controller it's the Square button.
		On an XBox controller it's the X button.
	**/
	var X : Bool;
	/**
		Is the Gamepad's right button in the right button cluster being pressed?
		If the Gamepad doesn't have this button it will always return false.
		On a Dual Shock controller it's the Circle button.
		On an XBox controller it's the B button.
	**/
	var B : Bool;
	/**
		Returns the value of the Gamepad's top left shoulder button.
		If the Gamepad doesn't have this button it will always return zero.
		The value is a float between 0 and 1, corresponding to how depressed the button is.
		On a Dual Shock controller it's the L1 button.
		On an XBox controller it's the LB button.
	**/
	var L1 : Float;
	/**
		Returns the value of the Gamepad's bottom left shoulder button.
		If the Gamepad doesn't have this button it will always return zero.
		The value is a float between 0 and 1, corresponding to how depressed the button is.
		On a Dual Shock controller it's the L2 button.
		On an XBox controller it's the LT button.
	**/
	var L2 : Float;
	/**
		Returns the value of the Gamepad's top right shoulder button.
		If the Gamepad doesn't have this button it will always return zero.
		The value is a float between 0 and 1, corresponding to how depressed the button is.
		On a Dual Shock controller it's the R1 button.
		On an XBox controller it's the RB button.
	**/
	var R1 : Float;
	/**
		Returns the value of the Gamepad's bottom right shoulder button.
		If the Gamepad doesn't have this button it will always return zero.
		The value is a float between 0 and 1, corresponding to how depressed the button is.
		On a Dual Shock controller it's the R2 button.
		On an XBox controller it's the RT button.
	**/
	var R2 : Float;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Gamepad;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Gamepad;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Gamepad;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Gamepad;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Gamepad;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Gamepad;
	static var prototype : Gamepad;
}