package global.phaser.cameras.scene2d.effects;

/**
	A Camera Rotate effect.
	
	This effect will rotate the Camera so that the its viewport finishes at the given angle in radians,
	over the duration and with the ease specified.
	
	Camera rotation always takes place based on the Camera viewport. By default, rotation happens
	in the center of the viewport. You can adjust this with the `originX` and `originY` properties.
	
	Rotation influences the rendering of _all_ Game Objects visible by this Camera. However, it does not
	rotate the Camera viewport itself, which always remains an axis-aligned rectangle.
	
	Only the camera is rotates. None of the objects it is displaying are impacted, i.e. their positions do
	not change.
	
	The effect will dispatch several events on the Camera itself and you can also specify an `onUpdate` callback,
	which is invoked each frame for the duration of the effect if required.
**/
@:native("Phaser.Cameras.Scene2D.Effects.RotateTo") extern class RotateTo {
	function new(camera:global.phaser.cameras.scene2d.Camera);
	/**
		The Camera this effect belongs to.
	**/
	final camera : global.phaser.cameras.scene2d.Camera;
	/**
		Is this effect actively running?
	**/
	final isRunning : Bool;
	/**
		The duration of the effect, in milliseconds.
	**/
	final duration : Float;
	/**
		The starting angle to rotate the camera from.
	**/
	var source : Float;
	/**
		The constantly updated value based on the force.
	**/
	var current : Float;
	/**
		The destination angle in radians to rotate the camera to.
	**/
	var destination : Float;
	/**
		The ease function to use during the Rotate.
	**/
	var ease : haxe.Constraints.Function;
	/**
		If this effect is running this holds the current percentage of the progress, a value between 0 and 1.
	**/
	var progress : Float;
	/**
		The direction of the rotation.
	**/
	var clockwise : Bool;
	/**
		The shortest direction to the target rotation.
	**/
	var shortestPath : Bool;
	/**
		This effect will scroll the Camera so that the center of its viewport finishes at the given angle,
		over the duration and with the ease specified.
	**/
	function start(radians:Float, ?shortestPath:Bool, ?duration:Float, ?ease:ts.AnyOf2<String, haxe.Constraints.Function>, ?force:Bool, ?callback:global.CameraRotateCallback, ?context:Dynamic):global.phaser.cameras.scene2d.Camera;
	/**
		The main update loop for this effect. Called automatically by the Camera.
	**/
	function update(time:Float, delta:Float):Void;
	/**
		Called internally when the effect completes.
	**/
	function effectComplete():Void;
	/**
		Resets this camera effect.
		If it was previously running, it stops instantly without calling its onComplete callback or emitting an event.
	**/
	function reset():Void;
	/**
		Destroys this effect, releasing it from the Camera.
	**/
	function destroy():Void;
	static var prototype : RotateTo;
}