package global.phaser.cameras.controls;

/**
	A Smoothed Key Camera Control.
	
	This allows you to control the movement and zoom of a camera using the defined keys.
	Unlike the Fixed Camera Control you can also provide physics values for acceleration, drag and maxSpeed for smoothing effects.
	
	```javascript
	var controlConfig = {
	     camera: this.cameras.main,
	     left: cursors.left,
	     right: cursors.right,
	     up: cursors.up,
	     down: cursors.down,
	     zoomIn: this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.Q),
	     zoomOut: this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.E),
	     zoomSpeed: 0.02,
	     acceleration: 0.06,
	     drag: 0.0005,
	     maxSpeed: 1.0
	};
	```
	
	You must call the `update` method of this controller every frame.
**/
@:native("Phaser.Cameras.Controls.SmoothedKeyControl") extern class SmoothedKeyControl {
	function new(config:global.phaser.types.cameras.controls.SmoothedKeyControlConfig);
	/**
		The Camera that this Control will update.
	**/
	var camera : global.phaser.cameras.scene2d.Camera;
	/**
		The Key to be pressed that will move the Camera left.
	**/
	var left : global.phaser.input.keyboard.Key;
	/**
		The Key to be pressed that will move the Camera right.
	**/
	var right : global.phaser.input.keyboard.Key;
	/**
		The Key to be pressed that will move the Camera up.
	**/
	var up : global.phaser.input.keyboard.Key;
	/**
		The Key to be pressed that will move the Camera down.
	**/
	var down : global.phaser.input.keyboard.Key;
	/**
		The Key to be pressed that will zoom the Camera in.
	**/
	var zoomIn : global.phaser.input.keyboard.Key;
	/**
		The Key to be pressed that will zoom the Camera out.
	**/
	var zoomOut : global.phaser.input.keyboard.Key;
	/**
		The speed at which the camera will zoom if the `zoomIn` or `zoomOut` keys are pressed.
	**/
	var zoomSpeed : Float;
	/**
		The horizontal acceleration the camera will move.
	**/
	var accelX : Float;
	/**
		The vertical acceleration the camera will move.
	**/
	var accelY : Float;
	/**
		The horizontal drag applied to the camera when it is moving.
	**/
	var dragX : Float;
	/**
		The vertical drag applied to the camera when it is moving.
	**/
	var dragY : Float;
	/**
		The maximum horizontal speed the camera will move.
	**/
	var maxSpeedX : Float;
	/**
		The maximum vertical speed the camera will move.
	**/
	var maxSpeedY : Float;
	/**
		A flag controlling if the Controls will update the Camera or not.
	**/
	var active : Bool;
	/**
		Starts the Key Control running, providing it has been linked to a camera.
	**/
	function start():SmoothedKeyControl;
	/**
		Stops this Key Control from running. Call `start` to start it again.
	**/
	function stop():SmoothedKeyControl;
	/**
		Binds this Key Control to a camera.
	**/
	function setCamera(camera:global.phaser.cameras.scene2d.Camera):SmoothedKeyControl;
	/**
		Applies the results of pressing the control keys to the Camera.
		
		You must call this every step, it is not called automatically.
	**/
	function update(delta:Float):Void;
	/**
		Destroys this Key Control.
	**/
	function destroy():Void;
	static var prototype : SmoothedKeyControl;
}