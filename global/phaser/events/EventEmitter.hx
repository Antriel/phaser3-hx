package global.phaser.events;

/**
	EventEmitter is a Scene Systems plugin compatible version of eventemitter3.
**/
@:native("Phaser.Events.EventEmitter") extern class EventEmitter {
	function new();
	/**
		Removes all listeners.
	**/
	function shutdown():Void;
	/**
		Removes all listeners.
	**/
	function destroy():Void;
	/**
		Return an array listing the events for which the emitter has registered listeners.
	**/
	function eventNames():Array<ts.AnyOf2<String, js.lib.Symbol>>;
	/**
		Return the listeners registered for a given event.
	**/
	function listeners(event:ts.AnyOf2<String, js.lib.Symbol>):Array<haxe.Constraints.Function>;
	/**
		Return the number of listeners listening to a given event.
	**/
	function listenerCount(event:ts.AnyOf2<String, js.lib.Symbol>):Float;
	/**
		Calls each of the listeners registered for a given event.
	**/
	function emit(event:ts.AnyOf2<String, js.lib.Symbol>, args:haxe.extern.Rest<Dynamic>):Bool;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):EventEmitter;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):EventEmitter;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):EventEmitter;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):EventEmitter;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):EventEmitter;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):EventEmitter;
	static var prototype : EventEmitter;
}