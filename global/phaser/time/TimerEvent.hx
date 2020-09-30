package global.phaser.time;

/**
	A Timer Event represents a delayed function call. It's managed by a Scene's {@link Clock} and will call its function after a set amount of time has passed. The Timer Event can optionally repeat - i.e. call its function multiple times before finishing, or loop indefinitely.
	
	Because it's managed by a Clock, a Timer Event is based on game time, will be affected by its Clock's time scale, and will pause if its Clock pauses.
**/
@:native("Phaser.Time.TimerEvent") extern class TimerEvent {
	function new(config:global.phaser.types.time.TimerEventConfig);
	/**
		The delay in ms at which this TimerEvent fires.
	**/
	final delay : Float;
	/**
		The total number of times this TimerEvent will repeat before finishing.
	**/
	final repeat : Float;
	/**
		If repeating this contains the current repeat count.
	**/
	var repeatCount : Float;
	/**
		True if this TimerEvent loops, otherwise false.
	**/
	final loop : Bool;
	/**
		The callback that will be called when the TimerEvent occurs.
	**/
	var callback : haxe.Constraints.Function;
	/**
		The scope in which the callback will be called.
	**/
	var callbackScope : Dynamic;
	/**
		Additional arguments to be passed to the callback.
	**/
	var args : Array<Dynamic>;
	/**
		Scale the time causing this TimerEvent to update.
	**/
	var timeScale : Float;
	/**
		Start this many MS into the elapsed (useful if you want a long duration with repeat, but for the first loop to fire quickly)
	**/
	var startAt : Float;
	/**
		The time in milliseconds which has elapsed since the Timer Event's creation.
		
		This value is local for the Timer Event and is relative to its Clock. As such, it's influenced by the Clock's time scale and paused state, the Timer Event's initial {@link #startAt} property, and the Timer Event's {@link #timeScale} and {@link #paused} state.
	**/
	var elapsed : Float;
	/**
		Whether or not this timer is paused.
	**/
	var paused : Bool;
	/**
		Whether the Timer Event's function has been called.
		
		When the Timer Event fires, this property will be set to `true` before the callback function is invoked and will be reset immediately afterward if the Timer Event should repeat. The value of this property does not directly influence whether the Timer Event will be removed from its Clock, but can prevent it from firing.
	**/
	var hasDispatched : Bool;
	/**
		Completely reinitializes the Timer Event, regardless of its current state, according to a configuration object.
	**/
	function reset(config:global.phaser.types.time.TimerEventConfig):TimerEvent;
	/**
		Gets the progress of the current iteration, not factoring in repeats.
	**/
	function getProgress():Float;
	/**
		Gets the progress of the timer overall, factoring in repeats.
	**/
	function getOverallProgress():Float;
	/**
		Returns the number of times this Timer Event will repeat before finishing.
		
		This should not be confused with the number of times the Timer Event will fire before finishing. A return value of 0 doesn't indicate that the Timer Event has finished running - it indicates that it will not repeat after the next time it fires.
	**/
	function getRepeatCount():Float;
	/**
		Returns the local elapsed time for the current iteration of the Timer Event.
	**/
	function getElapsed():Float;
	/**
		Returns the local elapsed time for the current iteration of the Timer Event in seconds.
	**/
	function getElapsedSeconds():Float;
	/**
		Forces the Timer Event to immediately expire, thus scheduling its removal in the next frame.
	**/
	function remove(?dispatchCallback:Bool):Void;
	/**
		Destroys all object references in the Timer Event, i.e. its callback, scope, and arguments.
		
		Normally, this method is only called by the Clock when it shuts down. As such, it doesn't stop the Timer Event. If called manually, the Timer Event will still be updated by the Clock, but it won't do anything when it fires.
	**/
	function destroy():Void;
	static var prototype : TimerEvent;
}