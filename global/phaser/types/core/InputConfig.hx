package global.phaser.types.core;

typedef InputConfig = {
	/**
		Keyboard input configuration. `true` uses the default configuration and `false` disables keyboard input.
	**/
	@:optional
	var keyboard : ts.AnyOf2<Bool, KeyboardInputConfig>;
	/**
		Mouse input configuration. `true` uses the default configuration and `false` disables mouse input.
	**/
	@:optional
	var mouse : ts.AnyOf2<Bool, MouseInputConfig>;
	/**
		Touch input configuration. `true` uses the default configuration and `false` disables touch input.
	**/
	@:optional
	var touch : ts.AnyOf2<Bool, TouchInputConfig>;
	/**
		Gamepad input configuration. `true` enables gamepad input.
	**/
	@:optional
	var gamepad : ts.AnyOf2<Bool, GamepadInputConfig>;
	/**
		The maximum number of touch pointers. See {@link Phaser.Input.InputManager#pointers}.
	**/
	@:optional
	var activePointers : Float;
	/**
		The smoothing factor to apply during Pointer movement. See {@link Phaser.Input.Pointer#smoothFactor}.
	**/
	@:optional
	var smoothFactor : Float;
	/**
		Should Phaser listen for input events on the Window? If you disable this, events like 'POINTER_UP_OUTSIDE' will no longer fire.
	**/
	@:optional
	var windowEvents : Bool;
};