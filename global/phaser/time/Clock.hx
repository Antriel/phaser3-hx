package global.phaser.time;

/**
	The Clock is a Scene plugin which creates and updates Timer Events for its Scene.
**/
@:native("Phaser.Time.Clock") extern class Clock {
	function new(scene:global.phaser.Scene);
	/**
		The Scene which owns this Clock.
	**/
	var scene : global.phaser.Scene;
	/**
		The Scene Systems object of the Scene which owns this Clock.
	**/
	var systems : global.phaser.scenes.Systems;
	/**
		The current time of the Clock, in milliseconds.
		
		If accessed externally, this is equivalent to the `time` parameter normally passed to a Scene's `update` method.
	**/
	var now : Float;
	/**
		The scale of the Clock's time delta.
		
		The time delta is the time elapsed between two consecutive frames and influences the speed of time for this Clock and anything which uses it, such as its Timer Events. Values higher than 1 increase the speed of time, while values smaller than 1 decrease it. A value of 0 freezes time and is effectively equivalent to pausing the Clock.
	**/
	var timeScale : Float;
	/**
		Whether the Clock is paused (`true`) or active (`false`).
		
		When paused, the Clock will not update any of its Timer Events, thus freezing time.
	**/
	var paused : Bool;
	/**
		Creates a Timer Event and adds it to the Clock at the start of the frame.
		
		You can also pass in an existing Timer Event, which will be reset and added to this Clock.
		
		Note that if the Timer Event is being used by _another_ Clock (in another Scene) it will still
		be updated by that Clock as well, so be careful when using this feature.
	**/
	function addEvent(config:ts.AnyOf2<global.phaser.types.time.TimerEventConfig, TimerEvent>):TimerEvent;
	/**
		Creates a Timer Event and adds it to the Clock at the start of the frame.
		
		This is a shortcut for {@link #addEvent} which can be shorter and is compatible with the syntax of the GreenSock Animation Platform (GSAP).
	**/
	function delayedCall(delay:Float, callback:haxe.Constraints.Function, ?args:Array<Dynamic>, ?callbackScope:Dynamic):TimerEvent;
	/**
		Clears and recreates the array of pending Timer Events.
	**/
	function clearPendingEvents():Clock;
	/**
		Removes the given Timer Event, or an array of Timer Events, from this Clock.
		
		The events are removed from all internal lists (active, pending and removal),
		freeing the event up to be re-used.
	**/
	function removeEvent(events:ts.AnyOf2<TimerEvent, Array<TimerEvent>>):Clock;
	/**
		Schedules all active Timer Events for removal at the start of the frame.
	**/
	function removeAllEvents():Clock;
	/**
		Updates the arrays of active and pending Timer Events. Called at the start of the frame.
	**/
	function preUpdate(time:Float, delta:Float):Void;
	/**
		Updates the Clock's internal time and all of its Timer Events.
	**/
	function update(time:Float, delta:Float):Void;
	static var prototype : Clock;
}