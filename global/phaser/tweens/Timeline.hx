package global.phaser.tweens;

/**
	A Timeline combines multiple Tweens into one. Its overall behavior is otherwise similar to a single Tween.
	
	The Timeline updates all of its Tweens simultaneously. Its methods allow you to easily build a sequence
	of Tweens (each one starting after the previous one) or run multiple Tweens at once during given parts of the Timeline.
**/
@:native("Phaser.Tweens.Timeline") extern class Timeline extends global.phaser.events.EventEmitter {
	function new(manager:TweenManager);
	/**
		The Tween Manager which owns this Timeline.
	**/
	var manager : TweenManager;
	/**
		A constant value which allows this Timeline to be easily identified as one.
	**/
	var isTimeline : Bool;
	/**
		An array of Tween objects, each containing a unique property and target being tweened.
	**/
	var data : Array<Dynamic>;
	/**
		The cached size of the data array.
	**/
	var totalData : Float;
	/**
		If true then duration, delay, etc values are all frame totals, rather than ms.
	**/
	var useFrames : Bool;
	/**
		Scales the time applied to this Timeline. A value of 1 runs in real-time. A value of 0.5 runs 50% slower, and so on.
		Value isn't used when calculating total duration of the Timeline, it's a run-time delta adjustment only.
	**/
	var timeScale : Float;
	/**
		Loop this Timeline? Can be -1 for an infinite loop, or an integer.
		When enabled it will play through ALL Tweens again (use Tween.repeat to loop a single tween)
	**/
	var loop : Float;
	/**
		Time in ms/frames before this Timeline loops.
	**/
	var loopDelay : Float;
	/**
		How many loops are left to run?
	**/
	var loopCounter : Float;
	/**
		Time in ms/frames before the 'onComplete' event fires. This never fires if loop = true (as it never completes)
	**/
	var completeDelay : Float;
	/**
		Countdown timer value, as used by `loopDelay` and `completeDelay`.
	**/
	var countdown : Float;
	/**
		The current state of the Timeline.
	**/
	var state : Float;
	/**
		Does the Timeline start off paused? (if so it needs to be started with Timeline.play)
	**/
	var paused : Bool;
	/**
		Elapsed time in ms/frames of this run through of the Timeline.
	**/
	var elapsed : Float;
	/**
		Total elapsed time in ms/frames of the entire Timeline, including looping.
	**/
	var totalElapsed : Float;
	/**
		Time in ms/frames for the whole Timeline to play through once, excluding loop amounts and loop delays.
	**/
	var duration : Float;
	/**
		Value between 0 and 1. The amount of progress through the Timeline, _excluding loops_.
	**/
	var progress : Float;
	/**
		Time in ms/frames for all Tweens in this Timeline to complete (including looping)
	**/
	var totalDuration : Float;
	/**
		Value between 0 and 1. The amount through the entire Timeline, including looping.
	**/
	var totalProgress : Float;
	/**
		An object containing the different Tween callback functions.
		
		You can either set these in the Tween config, or by calling the `Tween.setCallback` method.
		
		`onComplete` When the Timeline finishes playback fully or `Timeline.stop` is called. Never invoked if timeline is set to repeat infinitely.
		`onLoop` When a Timeline loops.
		`onStart` When the Timeline starts playing.
		`onUpdate` When a Timeline updates a child Tween.
		`onYoyo` When a Timeline starts a yoyo.
	**/
	var callbacks : Dynamic;
	/**
		The context in which all callbacks are invoked.
	**/
	var callbackScope : Dynamic;
	/**
		Internal method that will emit a Timeline based Event and invoke the given callback.
	**/
	function dispatchTimelineEvent(event:String, callback:haxe.Constraints.Function):Void;
	/**
		Sets the value of the time scale applied to this Timeline. A value of 1 runs in real-time.
		A value of 0.5 runs 50% slower, and so on.
		
		The value isn't used when calculating total duration of the tween, it's a run-time delta adjustment only.
	**/
	function setTimeScale(value:Float):Timeline;
	/**
		Gets the value of the time scale applied to this Timeline. A value of 1 runs in real-time.
		A value of 0.5 runs 50% slower, and so on.
	**/
	function getTimeScale():Float;
	/**
		Check whether or not the Timeline is playing.
	**/
	function isPlaying():Bool;
	/**
		Creates a new Tween, based on the given Tween Config, and adds it to this Timeline.
	**/
	function add(config:ts.AnyOf2<Dynamic, global.phaser.types.tweens.TweenBuilderConfig>):Timeline;
	/**
		Adds an existing Tween to this Timeline.
	**/
	function queue(tween:Tween):Timeline;
	/**
		Checks whether a Tween has an offset value.
	**/
	function hasOffset(tween:Tween):Bool;
	/**
		Checks whether the offset value is a number or a directive that is relative to previous tweens.
	**/
	function isOffsetAbsolute(value:Float):Bool;
	/**
		Checks if the offset is a relative value rather than an absolute one.
		If the value is just a number, this returns false.
	**/
	function isOffsetRelative(value:String):Bool;
	/**
		Parses the relative offset value, returning a positive or negative number.
	**/
	function getRelativeOffset(value:String, base:Float):Float;
	/**
		Calculates the total duration of the timeline.
		
		Computes all tween durations and returns the full duration of the timeline.
		
		The resulting number is stored in the timeline, not as a return value.
	**/
	function calcDuration():Void;
	/**
		Initializes the timeline, which means all Tweens get their init() called, and the total duration will be computed.
		Returns a boolean indicating whether the timeline is auto-started or not.
	**/
	function init():Bool;
	/**
		Resets all of the timeline's tweens back to their initial states.
		The boolean parameter indicates whether tweens that are looping should reset as well, or not.
	**/
	function resetTweens(resetFromLoop:Bool):Void;
	/**
		Sets a callback for the Timeline.
	**/
	function setCallback(type:String, callback:haxe.Constraints.Function, ?params:Array<Dynamic>, ?scope:Dynamic):Timeline;
	/**
		Passed a Tween to the Tween Manager and requests it be made active.
	**/
	function makeActive(tween:Tween):TweenManager;
	/**
		Starts playing the Timeline.
	**/
	function play():Void;
	/**
		Updates the Timeline's `state` and fires callbacks and events.
	**/
	function nextState():Void;
	/**
		Returns 'true' if this Timeline has finished and should be removed from the Tween Manager.
		Otherwise, returns false.
	**/
	function update(timestamp:Float, delta:Float):Bool;
	/**
		Stops the Timeline immediately, whatever stage of progress it is at and flags it for removal by the TweenManager.
	**/
	function stop():Void;
	/**
		Pauses the Timeline, retaining its internal state.
		
		Calling this on a Timeline that is already paused has no effect and fires no event.
	**/
	function pause():Timeline;
	/**
		Resumes a paused Timeline from where it was when it was paused.
		
		Calling this on a Timeline that isn't paused has no effect and fires no event.
	**/
	function resume():Timeline;
	/**
		Checks if any of the Tweens in this Timeline as operating on the target object.
		
		Returns `false` if no Tweens operate on the target object.
	**/
	function hasTarget(target:Dynamic):Bool;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Timeline;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Timeline;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Timeline;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Timeline;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Timeline;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Timeline;
	static var prototype : Timeline;
}