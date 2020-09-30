package global.phaser.cameras.scene2d.effects;

/**
	A Camera Shake effect.
	
	This effect will shake the camera viewport by a random amount, bounded by the specified intensity, each frame.
	
	Only the camera viewport is moved. None of the objects it is displaying are impacted, i.e. their positions do
	not change.
	
	The effect will dispatch several events on the Camera itself and you can also specify an `onUpdate` callback,
	which is invoked each frame for the duration of the effect if required.
**/
@:native("Phaser.Cameras.Scene2D.Effects.Shake") extern class Shake {
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
		The intensity of the effect. Use small float values. The default when the effect starts is 0.05.
		This is a Vector2 object, allowing you to control the shake intensity independently across x and y.
		You can modify this value while the effect is active to create more varied shake effects.
	**/
	var intensity : global.phaser.math.Vector2;
	/**
		If this effect is running this holds the current percentage of the progress, a value between 0 and 1.
	**/
	var progress : Float;
	/**
		Shakes the Camera by the given intensity over the duration specified.
	**/
	function start(?duration:Float, ?intensity:ts.AnyOf2<Float, global.phaser.math.Vector2>, ?force:Bool, ?callback:global.phaser.types.cameras.scene2d.CameraShakeCallback, ?context:Dynamic):global.phaser.cameras.scene2d.Camera;
	/**
		The pre-render step for this effect. Called automatically by the Camera.
	**/
	function preRender():Void;
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
	static var prototype : Shake;
}