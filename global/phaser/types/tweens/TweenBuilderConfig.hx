package global.phaser.types.tweens;

typedef TweenBuilderConfig = {
	/**
		The object, or an array of objects, to run the tween on.
	**/
	var targets : Dynamic;
	/**
		The number of milliseconds to delay before the tween will start.
	**/
	@:optional
	var delay : ts.AnyOf2<Float, haxe.Constraints.Function>;
	/**
		The duration of the tween in milliseconds.
	**/
	@:optional
	var duration : Float;
	/**
		The easing equation to use for the tween.
	**/
	@:optional
	var ease : ts.AnyOf2<String, haxe.Constraints.Function>;
	/**
		Optional easing parameters.
	**/
	@:optional
	var easeParams : Array<Dynamic>;
	/**
		The number of milliseconds to hold the tween for before yoyo'ing.
	**/
	@:optional
	var hold : Float;
	/**
		The number of times each property tween repeats.
	**/
	@:optional
	var repeat : Float;
	/**
		The number of milliseconds to pause before a repeat.
	**/
	@:optional
	var repeatDelay : Float;
	/**
		Should the tween complete, then reverse the values incrementally to get back to the starting tween values? The reverse tweening will also take `duration` milliseconds to complete.
	**/
	@:optional
	var yoyo : Bool;
	/**
		Horizontally flip the target of the Tween when it completes (before it yoyos, if set to do so). Only works for targets that support the `flipX` property.
	**/
	@:optional
	var flipX : Bool;
	/**
		Vertically flip the target of the Tween when it completes (before it yoyos, if set to do so). Only works for targets that support the `flipY` property.
	**/
	@:optional
	var flipY : Bool;
	/**
		Used when the Tween is part of a Timeline.
	**/
	@:optional
	var offset : ts.AnyOf5<String, Float, Dynamic, haxe.Constraints.Function, Array<Dynamic>>;
	/**
		The time the tween will wait before the onComplete event is dispatched once it has completed, in ms.
	**/
	@:optional
	var completeDelay : ts.AnyOf5<String, Float, Dynamic, haxe.Constraints.Function, Array<Dynamic>>;
	/**
		The number of times the tween will repeat. (A value of 1 means the tween will play twice, as it repeated once.) The first loop starts after every property tween has completed once.
	**/
	@:optional
	var loop : ts.AnyOf5<String, Float, Dynamic, haxe.Constraints.Function, Array<Dynamic>>;
	/**
		The time the tween will pause before starting either a yoyo or returning to the start for a repeat.
	**/
	@:optional
	var loopDelay : ts.AnyOf5<String, Float, Dynamic, haxe.Constraints.Function, Array<Dynamic>>;
	/**
		Does the tween start in a paused state (true) or playing (false)?
	**/
	@:optional
	var paused : Bool;
	/**
		The properties to tween.
	**/
	@:optional
	var props : { };
	/**
		Use frames or milliseconds?
	**/
	@:optional
	var useFrames : Bool;
	/**
		Scope (this) for the callbacks. The default scope is the tween.
	**/
	@:optional
	var callbackScope : Dynamic;
	/**
		A function to call when the tween completes.
	**/
	@:optional
	dynamic function onComplete(tween:global.phaser.tweens.Tween, targets:Array<Dynamic>, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onComplete`.
	**/
	@:optional
	var onCompleteParams : Array<Dynamic>;
	/**
		Scope (this) for `onComplete`.
	**/
	@:optional
	var onCompleteScope : Dynamic;
	/**
		A function to call each time the tween loops.
	**/
	@:optional
	dynamic function onLoop(tween:global.phaser.tweens.Tween, targets:Array<Dynamic>, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onLoop`.
	**/
	@:optional
	var onLoopParams : Array<Dynamic>;
	/**
		Scope (this) for `onLoop`.
	**/
	@:optional
	var onLoopScope : Dynamic;
	/**
		A function to call each time the tween repeats. Called once per property per target.
	**/
	@:optional
	dynamic function onRepeat(tween:global.phaser.tweens.Tween, target:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onRepeat`.
	**/
	@:optional
	var onRepeatParams : Array<Dynamic>;
	/**
		Scope (this) for `onRepeat`.
	**/
	@:optional
	var onRepeatScope : Dynamic;
	/**
		A function to call when the tween starts playback, after any delays have expired.
	**/
	@:optional
	dynamic function onStart(tween:global.phaser.tweens.Tween, targets:Array<Dynamic>, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onStart`.
	**/
	@:optional
	var onStartParams : Array<Dynamic>;
	/**
		Scope (this) for `onStart`.
	**/
	@:optional
	var onStartScope : Dynamic;
	/**
		A function to call when the tween is stopped.
	**/
	@:optional
	dynamic function onStop(tween:global.phaser.tweens.Tween, targets:Array<Dynamic>, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onStop`.
	**/
	@:optional
	var onStopParams : Array<Dynamic>;
	/**
		Scope (this) for `onStop`.
	**/
	@:optional
	var onStopScope : Dynamic;
	/**
		A function to call each time the tween steps. Called once per property per target.
	**/
	@:optional
	dynamic function onUpdate(tween:global.phaser.tweens.Tween, target:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onUpdate`.
	**/
	@:optional
	var onUpdateParams : Array<Dynamic>;
	/**
		Scope (this) for `onUpdate`.
	**/
	@:optional
	var onUpdateScope : Dynamic;
	/**
		A function to call each time the tween yoyos. Called once per property per target.
	**/
	@:optional
	dynamic function onYoyo(tween:global.phaser.tweens.Tween, target:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onYoyo`.
	**/
	@:optional
	var onYoyoParams : Array<Dynamic>;
	/**
		Scope (this) for `onYoyo`.
	**/
	@:optional
	var onYoyoScope : Dynamic;
	/**
		A function to call when the tween becomes active within the Tween Manager.
	**/
	@:optional
	dynamic function onActive(tween:global.phaser.tweens.Tween, target:Dynamic, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		Additional parameters to pass to `onActive`.
	**/
	@:optional
	var onActiveParams : Array<Dynamic>;
	/**
		Scope (this) for `onActive`.
	**/
	@:optional
	var onActiveScope : Dynamic;
};