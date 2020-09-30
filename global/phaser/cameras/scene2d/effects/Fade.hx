package global.phaser.cameras.scene2d.effects;

/**
	A Camera Fade effect.
	
	This effect will fade the camera viewport to the given color, over the duration specified.
	
	Only the camera viewport is faded. None of the objects it is displaying are impacted, i.e. their colors do
	not change.
	
	The effect will dispatch several events on the Camera itself and you can also specify an `onUpdate` callback,
	which is invoked each frame for the duration of the effect, if required.
**/
@:native("Phaser.Cameras.Scene2D.Effects.Fade") extern class Fade {
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
		Has this effect finished running?
		
		This is different from `isRunning` because it remains set to `true` when the effect is over,
		until the effect is either reset or started again.
	**/
	final isComplete : Bool;
	/**
		The direction of the fade.
		`true` = fade out (transparent to color), `false` = fade in (color to transparent)
	**/
	final direction : Bool;
	/**
		The duration of the effect, in milliseconds.
	**/
	final duration : Float;
	/**
		If this effect is running this holds the current percentage of the progress, a value between 0 and 1.
	**/
	var progress : Float;
	/**
		Fades the Camera to or from the given color over the duration specified.
	**/
	function start(?direction:Bool, ?duration:Float, ?red:Float, ?green:Float, ?blue:Float, ?force:Bool, ?callback:global.phaser.types.cameras.scene2d.CameraFadeCallback, ?context:Dynamic):global.phaser.cameras.scene2d.Camera;
	/**
		The main update loop for this effect. Called automatically by the Camera.
	**/
	function update(time:Float, delta:Float):Void;
	/**
		Called internally by the Canvas Renderer.
	**/
	function postRenderCanvas(ctx:js.html.CanvasRenderingContext2D):Bool;
	/**
		Called internally by the WebGL Renderer.
	**/
	function postRenderWebGL(pipeline:global.phaser.renderer.webgl.pipelines.TextureTintPipeline, getTintFunction:haxe.Constraints.Function):Bool;
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
	static var prototype : Fade;
}