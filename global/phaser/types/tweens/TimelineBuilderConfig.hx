package global.phaser.types.tweens;

typedef TimelineBuilderConfig = {
	/**
		An array of tween configuration objects to create and add into the new Timeline. If this doesn't exist or is empty, the Timeline will start off paused and none of the other configuration settings will be read. If it's a function, it will be called and its return value will be used as the array.
	**/
	@:optional
	var tweens : ts.AnyOf3<haxe.Constraints.Function, Array<Dynamic>, Array<TweenBuilderConfig>>;
	/**
		An array (or function which returns one) of default targets to which to apply the Timeline. Each individual Tween configuration can override this value.
	**/
	@:optional
	var targets : Dynamic;
	/**
		If specified, each Tween in the Timeline will get an equal portion of this duration, usually in milliseconds, by default. Each individual Tween configuration can override the Tween's duration.
	**/
	@:optional
	var totalDuration : Float;
	/**
		If `totalDuration` is not specified, the default duration, usually in milliseconds, of each Tween which will be created. Each individual Tween configuration can override the Tween's duration.
	**/
	@:optional
	var duration : Float;
	/**
		The number of milliseconds to delay before the tween will start. Each individual Tween configuration can override this value.
	**/
	@:optional
	var delay : Float;
	/**
		Optional easing parameters. Each individual Tween configuration can override this value.
	**/
	@:optional
	var easeParams : Array<Dynamic>;
	/**
		The easing equation to use for each tween. Each individual Tween configuration can override this value.
	**/
	@:optional
	var ease : ts.AnyOf2<String, haxe.Constraints.Function>;
	/**
		The number of milliseconds to hold each tween before yoyo'ing. Each individual Tween configuration can override this value.
	**/
	@:optional
	var hold : Float;
	/**
		The number of times to repeat each tween. Each individual Tween configuration can override this value.
	**/
	@:optional
	var repeat : Float;
	/**
		The number of milliseconds to pause before each tween will repeat. Each individual Tween configuration can override this value.
	**/
	@:optional
	var repeatDelay : Float;
	/**
		Should each tween complete, then reverse the values incrementally to get back to the starting tween values? The reverse tweening will also take `duration` milliseconds to complete. Each individual Tween configuration can override this value.
	**/
	@:optional
	var yoyo : Bool;
	/**
		Horizontally flip the target of the Tween when it completes (before it yoyos, if set to do so). Only works for targets that support the `flipX` property. Each individual Tween configuration can override this value.
	**/
	@:optional
	var flipX : Bool;
	/**
		Vertically flip the target of the Tween when it completes (before it yoyos, if set to do so). Only works for targets that support the `flipY` property. Each individual Tween configuration can override this value.
	**/
	@:optional
	var flipY : Bool;
	/**
		If specified, the time to wait, usually in milliseconds, before the Timeline completes.
	**/
	@:optional
	var completeDelay : ts.AnyOf4<Float, Dynamic, haxe.Constraints.Function, Array<Dynamic>>;
	/**
		How many times the Timeline should loop, or -1 to loop indefinitely.
	**/
	@:optional
	var loop : ts.AnyOf4<Float, Dynamic, haxe.Constraints.Function, Array<Dynamic>>;
	/**
		The time, usually in milliseconds, between each loop.
	**/
	@:optional
	var loopDelay : ts.AnyOf4<Float, Dynamic, haxe.Constraints.Function, Array<Dynamic>>;
	/**
		If `true`, the Timeline will start paused.
	**/
	@:optional
	var paused : Bool;
	/**
		If `true`, all duration in the Timeline will be in frames instead of milliseconds.
	**/
	@:optional
	var useFrames : Bool;
	/**
		The default scope (`this` value) to use for each callback registered by the Timeline Builder. If not specified, the Timeline itself will be used.
	**/
	@:optional
	var callbackScope : Dynamic;
	/**
		If specified, the `onStart` callback for the Timeline, called every time it starts playing.
	**/
	@:optional
	dynamic function onStart(timeline:global.phaser.tweens.Timeline, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		The scope (`this` value) to use for the `onStart` callback. If not specified, the `callbackScope` will be used.
	**/
	@:optional
	var onStartScope : Dynamic;
	/**
		Additional arguments to pass to the `onStart` callback. The Timeline will always be the first argument.
	**/
	@:optional
	var onStartParams : Array<Dynamic>;
	/**
		If specified, the `onUpdate` callback for the Timeline, called every frame it's active, regardless of its Tweens.
	**/
	@:optional
	dynamic function onUpdate(timeline:global.phaser.tweens.Timeline, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		The scope (`this` value) to use for the `onUpdate` callback. If not specified, the `callbackScope` will be used.
	**/
	@:optional
	var onUpdateScope : Dynamic;
	/**
		Additional arguments to pass to the `onUpdate` callback. The Timeline will always be the first argument.
	**/
	@:optional
	var onUpdateParams : Array<Dynamic>;
	/**
		If specified, the `onLoop` callback for the Timeline, called every time it loops.
	**/
	@:optional
	dynamic function onLoop(timeline:global.phaser.tweens.Timeline, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		The scope (`this` value) to use for the `onLoop` callback. If not specified, the `callbackScope` will be used.
	**/
	@:optional
	var onLoopScope : Dynamic;
	/**
		Additional arguments to pass to the `onLoop` callback. The Timeline will always be the first argument.
	**/
	@:optional
	var onLoopParams : Array<Dynamic>;
	/**
		If specified, the `onYoyo` callback for the Timeline, called every time it yoyos.
	**/
	@:optional
	dynamic function onYoyo(timeline:global.phaser.tweens.Timeline, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		The scope (`this` value) to use for the `onYoyo` callback. If not specified, the `callbackScope` will be used.
	**/
	@:optional
	var onYoyoScope : Dynamic;
	/**
		Additional arguments to pass to the `onYoyo` callback. The first argument will always be `null`, while the Timeline will always be the second argument.
	**/
	@:optional
	var onYoyoParams : Array<Dynamic>;
	/**
		If specified, the `onComplete` callback for the Timeline, called after it completes.
	**/
	@:optional
	dynamic function onComplete(timeline:global.phaser.tweens.Timeline, param:haxe.extern.Rest<Dynamic>):Void;
	/**
		The scope (`this` value) to use for the `onComplete` callback. If not specified, the `callbackScope` will be used.
	**/
	@:optional
	var onCompleteScope : Dynamic;
	/**
		Additional arguments to pass to the `onComplete` callback. The Timeline will always be the first argument.
	**/
	@:optional
	var onCompleteParams : Array<Dynamic>;
};