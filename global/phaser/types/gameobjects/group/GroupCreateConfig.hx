package global.phaser.types.gameobjects.group;

/**
	The total number of objects created will be
	
	     key.length * frame.length * frameQuantity * (yoyo ? 2 : 1) * (1 + repeat)
	
	If `max` is nonzero, then the total created will not exceed `max`.
	
	`key` is required. {@link Phaser.GameObjects.Group#defaultKey} is not used.
**/
typedef GroupCreateConfig = {
	/**
		The class of each new Game Object.
	**/
	@:optional
	var classType : haxe.Constraints.Function;
	/**
		The texture key of each new Game Object.
	**/
	@:optional
	var key : ts.AnyOf2<String, Array<String>>;
	/**
		The texture frame of each new Game Object.
	**/
	@:optional
	var frame : ts.AnyOf4<String, Float, Array<String>, Array<Float>>;
	/**
		The number of Game Objects to create. If set, this overrides the `frameQuantity` value. Use `frameQuantity` for more advanced control.
	**/
	@:optional
	var quantity : Float;
	/**
		The visible state of each new Game Object.
	**/
	@:optional
	var visible : Bool;
	/**
		The active state of each new Game Object.
	**/
	@:optional
	var active : Bool;
	/**
		The number of times each `key` × `frame` combination will be *repeated* (after the first combination).
	**/
	@:optional
	var repeat : Float;
	/**
		Select a `key` at random.
	**/
	@:optional
	var randomKey : Bool;
	/**
		Select a `frame` at random.
	**/
	@:optional
	var randomFrame : Bool;
	/**
		Select keys and frames by moving forward then backward through `key` and `frame`.
	**/
	@:optional
	var yoyo : Bool;
	/**
		The number of times each `frame` should be combined with one `key`.
	**/
	@:optional
	var frameQuantity : Float;
	/**
		The maximum number of new Game Objects to create. 0 is no maximum.
	**/
	@:optional
	var max : Float;
	@:optional
	var setXY : Dynamic;
	/**
		The horizontal position of each new Game Object.
	**/
	@:optional
	@:native("setXY.x")
	var setXY_x : Float;
	/**
		The vertical position of each new Game Object.
	**/
	@:optional
	@:native("setXY.y")
	var setXY_y : Float;
	/**
		Increment each Game Object's horizontal position from the previous by this amount, starting from `setXY.x`.
	**/
	@:optional
	@:native("setXY.stepX")
	var setXY_stepX : Float;
	/**
		Increment each Game Object's vertical position from the previous by this amount, starting from `setXY.y`.
	**/
	@:optional
	@:native("setXY.stepY")
	var setXY_stepY : Float;
	@:optional
	var setRotation : Dynamic;
	/**
		Rotation of each new Game Object.
	**/
	@:optional
	@:native("setRotation.value")
	var setRotation_value : Float;
	/**
		Increment each Game Object's rotation from the previous by this amount, starting at `setRotation.value`.
	**/
	@:optional
	@:native("setRotation.step")
	var setRotation_step : Float;
	@:optional
	var setScale : Dynamic;
	/**
		The horizontal scale of each new Game Object.
	**/
	@:optional
	@:native("setScale.x")
	var setScale_x : Float;
	/**
		The vertical scale of each new Game Object.
	**/
	@:optional
	@:native("setScale.y")
	var setScale_y : Float;
	/**
		Increment each Game Object's horizontal scale from the previous by this amount, starting from `setScale.x`.
	**/
	@:optional
	@:native("setScale.stepX")
	var setScale_stepX : Float;
	/**
		Increment each Game object's vertical scale from the previous by this amount, starting from `setScale.y`.
	**/
	@:optional
	@:native("setScale.stepY")
	var setScale_stepY : Float;
	@:optional
	var setOrigin : Dynamic;
	/**
		The horizontal origin of each new Game Object.
	**/
	@:optional
	@:native("setOrigin.x")
	var setOrigin_x : Float;
	/**
		The vertical origin of each new Game Object.
	**/
	@:optional
	@:native("setOrigin.y")
	var setOrigin_y : Float;
	/**
		Increment each Game Object's horizontal origin from the previous by this amount, starting from `setOrigin.x`.
	**/
	@:optional
	@:native("setOrigin.stepX")
	var setOrigin_stepX : Float;
	/**
		Increment each Game object's vertical origin from the previous by this amount, starting from `setOrigin.y`.
	**/
	@:optional
	@:native("setOrigin.stepY")
	var setOrigin_stepY : Float;
	@:optional
	var setAlpha : Dynamic;
	/**
		The alpha value of each new Game Object.
	**/
	@:optional
	@:native("setAlpha.value")
	var setAlpha_value : Float;
	/**
		Increment each Game Object's alpha from the previous by this amount, starting from `setAlpha.value`.
	**/
	@:optional
	@:native("setAlpha.step")
	var setAlpha_step : Float;
	@:optional
	var setDepth : Dynamic;
	/**
		The depth value of each new Game Object.
	**/
	@:optional
	@:native("setDepth.value")
	var setDepth_value : Float;
	/**
		Increment each Game Object's depth from the previous by this amount, starting from `setDepth.value`.
	**/
	@:optional
	@:native("setDepth.step")
	var setDepth_step : Float;
	@:optional
	var setScrollFactor : Dynamic;
	/**
		The horizontal scroll factor of each new Game Object.
	**/
	@:optional
	@:native("setScrollFactor.x")
	var setScrollFactor_x : Float;
	/**
		The vertical scroll factor of each new Game Object.
	**/
	@:optional
	@:native("setScrollFactor.y")
	var setScrollFactor_y : Float;
	/**
		Increment each Game Object's horizontal scroll factor from the previous by this amount, starting from `setScrollFactor.x`.
	**/
	@:optional
	@:native("setScrollFactor.stepX")
	var setScrollFactor_stepX : Float;
	/**
		Increment each Game object's vertical scroll factor from the previous by this amount, starting from `setScrollFactor.y`.
	**/
	@:optional
	@:native("setScrollFactor.stepY")
	var setScrollFactor_stepY : Float;
	/**
		A geometric shape that defines the hit area for the Game Object.
	**/
	@:optional
	var hitArea : Dynamic;
	/**
		A callback to be invoked when the Game Object is interacted with.
	**/
	@:optional
	dynamic function hitAreaCallback(hitArea:Dynamic, x:Float, y:Float, gameObject:global.phaser.gameobjects.GameObject):Void;
	/**
		Align the new Game Objects in a grid using these settings.
	**/
	@:optional
	var gridAlign : ts.AnyOf2<Bool, global.phaser.types.actions.GridAlignConfig>;
};