package global.phaser.renderer;

@:native("Phaser.Renderer.Canvas") @valueModuleOnly extern class Canvas {
	/**
		Returns an array which maps the default blend modes to supported Canvas blend modes.
		
		If the browser doesn't support a blend mode, it will default to the normal `source-over` blend mode.
	**/
	static function GetBlendModes():Array<Dynamic>;
	/**
		Takes a reference to the Canvas Renderer, a Canvas Rendering Context, a Game Object, a Camera and a parent matrix
		and then performs the following steps:
		
		1. Checks the alpha of the source combined with the Camera alpha. If 0 or less it aborts.
		2. Takes the Camera and Game Object matrix and multiplies them, combined with the parent matrix if given.
		3. Sets the blend mode of the context to be that used by the Game Object.
		4. Sets the alpha value of the context to be that used by the Game Object combined with the Camera.
		5. Saves the context state.
		6. Sets the final matrix values into the context via setTransform.
		7. If Renderer.antialias, or the frame.source.scaleMode is set, then imageSmoothingEnabled is set.
		
		This function is only meant to be used internally. Most of the Canvas Renderer classes use it.
	**/
	static function SetTransform(renderer:global.phaser.renderer.canvas.CanvasRenderer, ctx:js.html.CanvasRenderingContext2D, src:global.phaser.gameobjects.GameObject, camera:global.phaser.cameras.scene2d.Camera, ?parentMatrix:global.phaser.gameobjects.components.TransformMatrix):Bool;
}