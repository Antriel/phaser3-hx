package global.phaser.types.cameras.controls;

typedef FixedKeyControlConfig = {
	/**
		The Camera that this Control will update.
	**/
	@:optional
	var camera : global.phaser.cameras.scene2d.Camera;
	/**
		The Key to be pressed that will move the Camera left.
	**/
	@:optional
	var left : global.phaser.input.keyboard.Key;
	/**
		The Key to be pressed that will move the Camera right.
	**/
	@:optional
	var right : global.phaser.input.keyboard.Key;
	/**
		The Key to be pressed that will move the Camera up.
	**/
	@:optional
	var up : global.phaser.input.keyboard.Key;
	/**
		The Key to be pressed that will move the Camera down.
	**/
	@:optional
	var down : global.phaser.input.keyboard.Key;
	/**
		The Key to be pressed that will zoom the Camera in.
	**/
	@:optional
	var zoomIn : global.phaser.input.keyboard.Key;
	/**
		The Key to be pressed that will zoom the Camera out.
	**/
	@:optional
	var zoomOut : global.phaser.input.keyboard.Key;
	/**
		The speed at which the camera will zoom if the `zoomIn` or `zoomOut` keys are pressed.
	**/
	@:optional
	var zoomSpeed : Float;
	/**
		The horizontal and vertical speed the camera will move.
	**/
	@:optional
	var speed : ts.AnyOf2<Float, Dynamic>;
};