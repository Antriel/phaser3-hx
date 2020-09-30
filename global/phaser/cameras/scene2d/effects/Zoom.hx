package global.phaser.cameras.scene2d.effects;

/**
	A Camera Zoom effect.
	
	This effect will zoom the Camera to the given scale, over the duration and with the ease specified.
	
	The effect will dispatch several events on the Camera itself and you can also specify an `onUpdate` callback,
	which is invoked each frame for the duration of the effect if required.
**/
@:native("Phaser.Cameras.Scene2D.Effects.Zoom") extern class Zoom {
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
		The starting zoom value;
	**/
	var source : Float;
	/**
		The destination zoom value.
	**/
	var destination : Float;
	/**
		The ease function to use during the zoom.
	**/
	var ease : haxe.Constraints.Function;
	/**
		If this effect is running this holds the current percentage of the progress, a value between 0 and 1.
	**/
	var progress : Float;
	/**
		This effect will zoom the Camera to the given scale, over the duration and with the ease specified.
	**/
	function start(zoom:Float, ?duration:Float, ?ease:ts.AnyOf2<String, haxe.Constraints.Function>, ?force:Bool, ?callback:global.phaser.types.cameras.scene2d.CameraZoomCallback, ?context:Dynamic):global.phaser.cameras.scene2d.Camera;
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
	static var prototype : Zoom;
}