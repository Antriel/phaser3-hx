package global.phaser;

@:native("Phaser.Tweens") @valueModuleOnly extern class Tweens {
	/**
		Returns a TweenDataConfig object that describes the tween data for a unique property of a unique target.
		A single Tween consists of multiple TweenDatas, depending on how many properties are being changed by the Tween.
		
		This is an internal function used by the TweenBuilder and should not be accessed directly, instead,
		Tweens should be created using the GameObjectFactory or GameObjectCreator.
	**/
	static function TweenData(target:Dynamic, index:Float, key:String, getEnd:haxe.Constraints.Function, getStart:haxe.Constraints.Function, getActive:haxe.Constraints.Function, ease:haxe.Constraints.Function, delay:Float, duration:Float, yoyo:Bool, hold:Float, repeat:Float, repeatDelay:Float, flipX:Bool, flipY:Bool):global.phaser.types.tweens.TweenDataConfig;
	/**
		TweenData state.
	**/
	static var CREATED : Float;
	/**
		TweenData state.
	**/
	static var INIT : Float;
	/**
		TweenData state.
	**/
	static var DELAY : Float;
	/**
		TweenData state.
	**/
	static var OFFSET_DELAY : Float;
	/**
		TweenData state.
	**/
	static var PENDING_RENDER : Float;
	/**
		TweenData state.
	**/
	static var PLAYING_FORWARD : Float;
	/**
		TweenData state.
	**/
	static var PLAYING_BACKWARD : Float;
	/**
		TweenData state.
	**/
	static var HOLD_DELAY : Float;
	/**
		TweenData state.
	**/
	static var REPEAT_DELAY : Float;
	/**
		TweenData state.
	**/
	static var COMPLETE : Float;
	/**
		Tween state.
	**/
	static var PENDING_ADD : Float;
	/**
		Tween state.
	**/
	static var PAUSED : Float;
	/**
		Tween state.
	**/
	static var LOOP_DELAY : Float;
	/**
		Tween state.
	**/
	static var ACTIVE : Float;
	/**
		Tween state.
	**/
	static var COMPLETE_DELAY : Float;
	/**
		Tween state.
	**/
	static var PENDING_REMOVE : Float;
	/**
		Tween state.
	**/
	static var REMOVED : Float;
}