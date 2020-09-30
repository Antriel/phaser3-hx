package global.matterjs;

@:native("MatterJS.Events") extern class Events {
	function new();
	static var prototype : Events;
	/**
		Fired when a body starts sleeping (where `this` is the body).
		
		Fired when a body ends sleeping (where `this` is the body).
		
		Fired when a call to `Composite.add` is made, before objects have been added.
		
		Fired when a call to `Composite.add` is made, after objects have been added.
		
		Fired when a call to `Composite.remove` is made, before objects have been removed.
		
		Fired when a call to `Composite.remove` is made, after objects have been removed.
		
		Fired after engine update and all collision events
		
		Fired just before an update
		
		Fired after engine update, provides a list of all pairs that are colliding in the current tick (if any)
		
		Fired after engine update, provides a list of all pairs that have ended collision in the current tick (if any)
		
		Fired after engine update, provides a list of all pairs that have started to collide in the current tick (if any)
		
		Fired at the start of a tick, before any updates to the engine or timing
		
		Fired after engine timing updated, but just before update
		
		Fired at the end of a tick, after engine update and after rendering
		
		Fired before rendering
		
		Fired after rendering
	**/
	@:overload(function(obj:BodyType, name:String, callback:(e:IEvent<BodyType>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventComposite<CompositeType>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventComposite<CompositeType>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventComposite<CompositeType>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventComposite<CompositeType>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventTimestamped<Engine>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventTimestamped<Engine>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventCollision<Engine>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventCollision<Engine>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventCollision<Engine>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventTimestamped<Runner>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventTimestamped<Runner>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventTimestamped<Runner>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventTimestamped<Runner>) -> Void):Void { })
	@:overload(function(obj:Engine, name:String, callback:(e:IEventTimestamped<Runner>) -> Void):Void { })
	@:overload(function(obj:Dynamic, name:String, callback:(e:Dynamic) -> Void):Void { })
	static function on(obj:BodyType, name:String, callback:(e:IEvent<BodyType>) -> Void):Void;
	/**
		Removes the given event callback. If no callback, clears all callbacks in eventNames. If no eventNames, clears all events.
	**/
	static function off(obj:Dynamic, eventName:String, callback:(e:Dynamic) -> Void):Void;
	/**
		Fires all the callbacks subscribed to the given object's eventName, in the order they subscribed, if any.
	**/
	static function trigger(object:Dynamic, eventNames:String, ?event:(e:Dynamic) -> Void):Void;
}