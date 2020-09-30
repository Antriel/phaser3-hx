package global.phaser.types.tweens;

typedef TweenPropConfig = {
	/**
		What the property will be at the END of the Tween.
	**/
	@:optional
	var value : ts.AnyOf4<String, Float, GetEndCallback, TweenPropConfig>;
	/**
		What the property will be set to immediately when this tween becomes active.
	**/
	@:optional
	dynamic function getActive(target:Dynamic, key:String, value:Float, targetIndex:Float, totalTargets:Float, tween:global.phaser.tweens.Tween):Void;
	/**
		What the property will be at the END of the Tween.
	**/
	@:optional
	dynamic function getEnd(target:Dynamic, key:String, value:Float, targetIndex:Float, totalTargets:Float, tween:global.phaser.tweens.Tween):Void;
	/**
		What the property will be at the START of the Tween.
	**/
	@:optional
	dynamic function getStart(target:Dynamic, key:String, value:Float, targetIndex:Float, totalTargets:Float, tween:global.phaser.tweens.Tween):Void;
	/**
		The ease function this tween uses.
	**/
	@:optional
	var ease : ts.AnyOf2<String, haxe.Constraints.Function>;
	/**
		Time in ms/frames before tween will start.
	**/
	@:optional
	var delay : Float;
	/**
		Duration of the tween in ms/frames.
	**/
	@:optional
	var duration : Float;
	/**
		Determines whether the tween should return back to its start value after hold has expired.
	**/
	@:optional
	var yoyo : Bool;
	/**
		Time in ms/frames the tween will pause before repeating or returning to its starting value if yoyo is set to true.
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
		Should toggleFlipX be called when yoyo or repeat happens?
	**/
	@:optional
	var flipX : Bool;
	/**
		Should toggleFlipY be called when yoyo or repeat happens?
	**/
	@:optional
	var flipY : Bool;
};