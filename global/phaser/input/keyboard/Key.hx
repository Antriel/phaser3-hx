package global.phaser.input.keyboard;

/**
	A generic Key object which can be passed to the Process functions (and so on)
	keycode must be an integer
**/
@:native("Phaser.Input.Keyboard.Key") extern class Key extends global.phaser.events.EventEmitter {
	function new(plugin:KeyboardPlugin, keyCode:Float);
	/**
		The Keyboard Plugin instance that owns this Key object.
	**/
	var plugin : KeyboardPlugin;
	/**
		The keycode of this key.
	**/
	var keyCode : Float;
	/**
		The original DOM event.
	**/
	var originalEvent : js.html.KeyboardEvent;
	/**
		Can this Key be processed?
	**/
	var enabled : Bool;
	/**
		The "down" state of the key. This will remain `true` for as long as the keyboard thinks this key is held down.
	**/
	var isDown : Bool;
	/**
		The "up" state of the key. This will remain `true` for as long as the keyboard thinks this key is up.
	**/
	var isUp : Bool;
	/**
		The down state of the ALT key, if pressed at the same time as this key.
	**/
	var altKey : Bool;
	/**
		The down state of the CTRL key, if pressed at the same time as this key.
	**/
	var ctrlKey : Bool;
	/**
		The down state of the SHIFT key, if pressed at the same time as this key.
	**/
	var shiftKey : Bool;
	/**
		The down state of the Meta key, if pressed at the same time as this key.
		On a Mac the Meta Key is the Command key. On Windows keyboards, it's the Windows key.
	**/
	var metaKey : Bool;
	/**
		The location of the modifier key. 0 for standard (or unknown), 1 for left, 2 for right, 3 for numpad.
	**/
	var location : Float;
	/**
		The timestamp when the key was last pressed down.
	**/
	var timeDown : Float;
	/**
		The number of milliseconds this key was held down for in the previous down - up sequence.
		This value isn't updated every game step, only when the Key changes state.
		To get the current duration use the `getDuration` method.
	**/
	var duration : Float;
	/**
		The timestamp when the key was last released.
	**/
	var timeUp : Float;
	/**
		When a key is held down should it continuously fire the `down` event each time it repeats?
		
		By default it will emit the `down` event just once, but if you wish to receive the event
		for each repeat as well, enable this property.
	**/
	var emitOnRepeat : Bool;
	/**
		If a key is held down this holds down the number of times the key has 'repeated'.
	**/
	var repeats : Float;
	/**
		Controls if this Key will continuously emit a `down` event while being held down (true),
		or emit the event just once, on first press, and then skip future events (false).
	**/
	function setEmitOnRepeat(value:Bool):Key;
	/**
		Processes the Key Down action for this Key.
		Called automatically by the Keyboard Plugin.
	**/
	function onDown(event:js.html.KeyboardEvent):Void;
	/**
		Processes the Key Up action for this Key.
		Called automatically by the Keyboard Plugin.
	**/
	function onUp(event:js.html.KeyboardEvent):Void;
	/**
		Resets this Key object back to its default un-pressed state.
	**/
	function reset():Key;
	/**
		Returns the duration, in ms, that the Key has been held down for.
		
		If the key is not currently down it will return zero.
		
		The get the duration the Key was held down for in the previous up-down cycle,
		use the `Key.duration` property value instead.
	**/
	function getDuration():Float;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Key;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Key;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Key;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Key;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Key;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Key;
	static var prototype : Key;
}