package global.phaser.types.tweens;

typedef TweenDataConfig = {
	/**
		The target to tween.
	**/
	var target : Dynamic;
	/**
		The target index within the Tween targets array.
	**/
	var index : Float;
	/**
		The property of the target being tweened.
	**/
	var key : String;
	/**
		If not null, is invoked _immediately_ as soon as the TweenData is running, and is set on the target property.
	**/
	dynamic function getActiveValue(target:Dynamic, key:String, value:Float, targetIndex:Float, totalTargets:Float, tween:global.phaser.tweens.Tween):Void;
	/**
		The returned value sets what the property will be at the END of the Tween.
	**/
	dynamic function getEndValue(target:Dynamic, key:String, value:Float, targetIndex:Float, totalTargets:Float, tween:global.phaser.tweens.Tween):Void;
	/**
		The returned value sets what the property will be at the START of the Tween.
	**/
	dynamic function getStartValue(target:Dynamic, key:String, value:Float, targetIndex:Float, totalTargets:Float, tween:global.phaser.tweens.Tween):Void;
	/**
		The ease function this tween uses.
	**/
	var ease : haxe.Constraints.Function;
	/**
		Duration of the tween in ms/frames, excludes time for yoyo or repeats.
	**/
	@:optional
	var duration : Float;
	/**
		The total calculated duration of this TweenData (based on duration, repeat, delay and yoyo)
	**/
	@:optional
	var totalDuration : Float;
	/**
		Time in ms/frames before tween will start.
	**/
	@:optional
	var delay : Float;
	/**
		Cause the tween to return back to its start value after hold has expired.
	**/
	@:optional
	var yoyo : Bool;
	/**
		Time in ms/frames the tween will pause before running the yoyo or starting a repeat.
	**/
	@:optional
	var hold : Float;
	/**
		Number of times to repeat the tween. The tween will always run once regardless, so a repeat value of '1' will play the tween twice.
	**/
	@:optional
	var repeat : Float;
	/**
		Time in ms/frames before the repeat will start.
	**/
	@:optional
	var repeatDelay : Float;
	/**
		Automatically call toggleFlipX when the TweenData yoyos or repeats
	**/
	@:optional
	var flipX : Bool;
	/**
		Automatically call toggleFlipY when the TweenData yoyos or repeats
	**/
	@:optional
	var flipY : Bool;
	/**
		Between 0 and 1 showing completion of this TweenData.
	**/
	@:optional
	var progress : Float;
	/**
		Delta counter
	**/
	@:optional
	var elapsed : Float;
	/**
		How many repeats are left to run?
	**/
	@:optional
	var repeatCounter : Float;
	/**
		The property value at the start of the ease.
	**/
	@:optional
	var start : Float;
	/**
		The current propety value.
	**/
	@:optional
	var current : Float;
	/**
		The previous property value.
	**/
	@:optional
	var previous : Float;
	/**
		The property value at the end of the ease.
	**/
	@:optional
	var end : Float;
	/**
		Time duration 1.
	**/
	@:optional
	var t1 : Float;
	/**
		Time duration 2.
	**/
	@:optional
	var t2 : Float;
	/**
		LoadValue generation functions.
	**/
	@:optional
	var gen : TweenDataGenConfig;
	/**
		TWEEN_CONST.CREATED
	**/
	@:optional
	var state : Float;
};