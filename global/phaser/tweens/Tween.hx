package global.phaser.tweens;

/**
	A Tween is able to manipulate the properties of one or more objects to any given value, based
	on a duration and type of ease. They are rarely instantiated directly and instead should be
	created via the TweenManager.
**/
@:native("Phaser.Tweens.Tween") extern class Tween extends global.phaser.events.EventEmitter {
	function new(parent:ts.AnyOf2<Timeline, TweenManager>, data:Array<global.phaser.types.tweens.TweenDataConfig>, targets:Array<Dynamic>);
	/**
		A reference to the parent of this Tween.
		Either the Tween Manager or a Tween Timeline instance.
	**/
	var parent : ts.AnyOf2<Timeline, TweenManager>;
	/**
		Is the parent of this Tween a Timeline?
	**/
	var parentIsTimeline : Bool;
	/**
		An array of TweenData objects, each containing a unique property and target being tweened.
	**/
	var data : Array<global.phaser.types.tweens.TweenDataConfig>;
	/**
		The cached length of the data array.
	**/
	var totalData : Float;
	/**
		An array of references to the target/s this Tween is operating on.
	**/
	var targets : Array<Dynamic>;
	/**
		Cached target total (not necessarily the same as the data total)
	**/
	var totalTargets : Float;
	/**
		If `true` then duration, delay, etc values are all frame totals.
	**/
	var useFrames : Bool;
	/**
		Scales the time applied to this Tween. A value of 1 runs in real-time. A value of 0.5 runs 50% slower, and so on.
		Value isn't used when calculating total duration of the tween, it's a run-time delta adjustment only.
	**/
	var timeScale : Float;
	/**
		Loop this tween? Can be -1 for an infinite loop, or an integer.
		When enabled it will play through ALL TweenDatas again. Use TweenData.repeat to loop a single element.
	**/
	var loop : Float;
	/**
		Time in ms/frames before the tween loops.
	**/
	var loopDelay : Float;
	/**
		How many loops are left to run?
	**/
	var loopCounter : Float;
	/**
		Time in ms/frames before the 'onStart' event fires.
		This is the shortest `delay` value across all of the TweenDatas of this Tween.
	**/
	var startDelay : Float;
	/**
		Has this Tween started playback yet?
		This boolean is toggled when the Tween leaves the 'delayed' state and starts running.
	**/
	final hasStarted : Bool;
	/**
		Is this Tween currently seeking?
		This boolean is toggled in the `Tween.seek` method.
		When a tween is seeking it will not dispatch any events or callbacks.
	**/
	final isSeeking : Bool;
	/**
		Time in ms/frames before the 'onComplete' event fires. This never fires if loop = -1 (as it never completes)
	**/
	var completeDelay : Float;
	/**
		Countdown timer (used by timeline offset, loopDelay and completeDelay)
	**/
	var countdown : Float;
	/**
		Set only if this Tween is part of a Timeline.
	**/
	var offset : Float;
	/**
		Set only if this Tween is part of a Timeline. The calculated offset amount.
	**/
	var calculatedOffset : Float;
	/**
		The current state of the tween
	**/
	var state : Float;
	/**
		Does the Tween start off paused? (if so it needs to be started with Tween.play)
	**/
	var paused : Bool;
	/**
		Elapsed time in ms/frames of this run through the Tween.
	**/
	var elapsed : Float;
	/**
		Total elapsed time in ms/frames of the entire Tween, including looping.
	**/
	var totalElapsed : Float;
	/**
		Time in ms/frames for the whole Tween to play through once, excluding loop amounts and loop delays.
	**/
	var duration : Float;
	/**
		Value between 0 and 1. The amount through the Tween, excluding loops.
	**/
	var progress : Float;
	/**
		Time in ms/frames for the Tween to complete (including looping)
	**/
	var totalDuration : Float;
	/**
		Value between 0 and 1. The amount through the entire Tween, including looping.
	**/
	var totalProgress : Float;
	/**
		An object containing the different Tween callback functions.
		
		You can either set these in the Tween config, or by calling the `Tween.setCallback` method.
		
		`onActive` When the Tween is moved from the pending to the active list in the Tween Manager, even if playback paused.
		`onStart` When the Tween starts playing after a delayed state. Will happen at the same time as `onActive` if it has no delay.
		`onYoyo` When a TweenData starts a yoyo. This happens _after_ the `hold` delay expires, if set.
		`onRepeat` When a TweenData repeats playback. This happens _after_ the `repeatDelay` expires, if set.
		`onComplete` When the Tween finishes playback fully. Never invoked if tween is set to repeat infinitely.
		`onUpdate` When a TweenData updates a property on a source target during playback.
		`onLoop` When a Tween loops. This happens _after_ the `loopDelay` expires, if set.
	**/
	var callbacks : Dynamic;
	/**
		The context in which all callbacks are invoked.
	**/
	var callbackScope : Dynamic;
	/**
		Returns the current value of the specified Tween Data.
	**/
	function getValue(?index:Float):Float;
	/**
		Set the scale the time applied to this Tween. A value of 1 runs in real-time. A value of 0.5 runs 50% slower, and so on.
	**/
	function setTimeScale(value:Float):Tween;
	/**
		Returns the scale of the time applied to this Tween.
	**/
	function getTimeScale():Float;
	/**
		Checks if the Tween is currently active.
	**/
	function isPlaying():Bool;
	/**
		Checks if the Tween is currently paused.
	**/
	function isPaused():Bool;
	/**
		See if this Tween is currently acting upon the given target.
	**/
	function hasTarget(target:Dynamic):Bool;
	/**
		Updates the 'end' value of the given property across all matching targets.
		
		Calling this does not adjust the duration of the tween, or the current progress.
		
		You can optionally tell it to set the 'start' value to be the current value (before the change).
	**/
	function updateTo(key:String, value:Dynamic, ?startToCurrent:Bool):Tween;
	/**
		Restarts the tween from the beginning.
	**/
	function restart():Tween;
	/**
		Internal method that calculates the overall duration of the Tween.
	**/
	function calcDuration():Void;
	/**
		Called by TweenManager.preUpdate as part of its loop to check pending and active tweens.
		Should not be called directly.
	**/
	function init():Bool;
	/**
		Internal method that makes this Tween active within the TweenManager
		and emits the onActive event and callback.
	**/
	function makeActive():Void;
	/**
		Internal method that advances to the next state of the Tween during playback.
	**/
	function nextState():Void;
	/**
		Pauses the Tween immediately. Use `resume` to continue playback.
	**/
	function pause():Tween;
	/**
		Starts a Tween playing.
		
		You only need to call this method if you have configured the tween to be paused on creation.
		
		If the Tween is already playing, calling this method again will have no effect. If you wish to
		restart the Tween, use `Tween.restart` instead.
		
		Calling this method after the Tween has completed will start the Tween playing again from the start.
		This is the same as calling `Tween.seek(0)` and then `Tween.play()`.
	**/
	function play(?resetFromTimeline:Bool):Tween;
	/**
		Internal method that resets all of the Tween Data, including the progress and elapsed values.
	**/
	function resetTweenData(resetFromLoop:Bool):Void;
	/**
		Resumes the playback of a previously paused Tween.
	**/
	function resume():Tween;
	/**
		Seeks to a specific point in the Tween.
		
		**Note:** Be careful when seeking a Tween that repeats or loops forever,
		or that has an unusually long total duration, as it's possible to hang the browser.
		
		The given position is a value between 0 and 1 which represents how far through the Tween to seek to.
		A value of 0.5 would seek to half-way through the Tween, where-as a value of zero would seek to the start.
		
		Note that the seek takes the entire duration of the Tween into account, including delays, loops and repeats.
		For example, a Tween that lasts for 2 seconds, but that loops 3 times, would have a total duration of 6 seconds,
		so seeking to 0.5 would seek to 3 seconds into the Tween, as that's half-way through its _entire_ duration.
		
		Seeking works by resetting the Tween to its initial values and then iterating through the Tween at `delta`
		jumps per step. The longer the Tween, the longer this can take.
	**/
	function seek(toPosition:Float, ?delta:Float):Tween;
	/**
		Sets an event based callback to be invoked during playback.
		
		Calling this method will replace a previously set callback for the given type, if any exists.
		
		The types available are:
		
		`onActive` When the Tween is moved from the pending to the active list in the Tween Manager, even if playback paused.
		`onStart` When the Tween starts playing after a delayed state. Will happen at the same time as `onActive` if it has no delay.
		`onYoyo` When a TweenData starts a yoyo. This happens _after_ the `hold` delay expires, if set.
		`onRepeat` When a TweenData repeats playback. This happens _after_ the `repeatDelay` expires, if set.
		`onComplete` When the Tween finishes playback fully or `Tween.stop` is called. Never invoked if tween is set to repeat infinitely.
		`onUpdate` When a TweenData updates a property on a source target during playback.
		`onLoop` When a Tween loops. This happens _after_ the `loopDelay` expires, if set.
	**/
	function setCallback(type:String, callback:haxe.Constraints.Function, ?params:Array<Dynamic>, ?scope:Dynamic):Tween;
	/**
		Flags the Tween as being complete, whatever stage of progress it is at.
		
		If an onComplete callback has been defined it will automatically invoke it, unless a `delay`
		argument is provided, in which case the Tween will delay for that period of time before calling the callback.
		
		If you don't need a delay, or have an onComplete callback, then call `Tween.stop` instead.
	**/
	function complete(?delay:Float):Tween;
	/**
		Immediately removes this Tween from the TweenManager and all of its internal arrays,
		no matter what stage it as it. Then sets the tween state to `REMOVED`.
		
		You should dispose of your reference to this tween after calling this method, to
		free it from memory.
	**/
	function remove():Tween;
	/**
		Stops the Tween immediately, whatever stage of progress it is at and flags it for removal by the TweenManager.
	**/
	function stop(?resetTo:Float):Tween;
	/**
		Internal method that advances the Tween based on the time values.
	**/
	function update(timestamp:Float, delta:Float):Bool;
	/**
		Internal method that will emit a TweenData based Event and invoke the given callback.
	**/
	function dispatchTweenDataEvent(event:String, callback:haxe.Constraints.Function, tweenData:global.phaser.types.tweens.TweenDataConfig):Void;
	/**
		Internal method that will emit a Tween based Event and invoke the given callback.
	**/
	function dispatchTweenEvent(event:String, callback:haxe.Constraints.Function):Void;
	/**
		Internal method used as part of the playback process that sets a tween to play in reverse.
	**/
	function setStateFromEnd(tween:Tween, tweenData:global.phaser.types.tweens.TweenDataConfig, diff:Float):Float;
	/**
		Internal method used as part of the playback process that sets a tween to play from the start.
	**/
	function setStateFromStart(tween:Tween, tweenData:global.phaser.types.tweens.TweenDataConfig, diff:Float):Float;
	/**
		Internal method that advances the TweenData based on the time value given.
	**/
	function updateTweenData(tween:Tween, tweenData:global.phaser.types.tweens.TweenDataConfig, delta:Float):Bool;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Tween;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Tween;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Tween;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Tween;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Tween;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Tween;
	static var prototype : Tween;
}