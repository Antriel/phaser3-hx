package global.phaser.renderer.webgl;

/**
	The Pipeline Manager is responsible for the creation, activation, running and destruction
	of WebGL Pipelines and Post FX Pipelines in Phaser 3.
	
	The `WebGLRenderer` owns a single instance of the Pipeline Manager, which you can access
	via the `WebGLRenderer.pipelines` property.
	
	By default, there are 8 pipelines installed into the Pipeline Manager when Phaser boots:
	
	1. The Multi Pipeline. Responsible for all multi-texture rendering, i.e. Sprites and Tilemaps.
	2. The Graphics Pipeline. Responsible for rendering Graphics and Shape objects.
	3. The Rope Pipeline. Responsible for rendering the Rope Game Object.
	4. The Light Pipeline. Responsible for rendering the Light Game Object.
	5. The Point Light Pipeline. Responsible for rendering the Point Light Game Object.
	6. The Single Pipeline. Responsible for rendering Game Objects that explicitly require one bound texture.
	7. The Bitmap Mask Pipeline. Responsible for Bitmap Mask rendering.
	8. The Utility Pipeline. Responsible for providing lots of handy texture manipulation functions.
	
	You can add your own custom pipeline via the `PipelineManager.add` method. Pipelines are
	identified by unique string-based keys.
**/
@:native("Phaser.Renderer.WebGL.PipelineManager") extern class PipelineManager {
	function new(renderer:WebGLRenderer);
	/**
		A reference to the Game instance.
	**/
	var game : global.phaser.Game;
	/**
		A reference to the WebGL Renderer instance.
	**/
	var renderer : WebGLRenderer;
	/**
		This map stores all pipeline classes available in this manager.
		
		The Utility Class must always come first.
	**/
	var classes : global.phaser.structs.Map_<String, global.Class_>;
	/**
		This map stores all Post FX Pipeline classes available in this manager.
	**/
	var postPipelineClasses : global.phaser.structs.Map_<String, global.Class_>;
	/**
		This map stores all pipeline instances in this manager.
		
		This is populated with the default pipelines in the `boot` method.
	**/
	var pipelines : global.phaser.structs.Map_<String, WebGLPipeline>;
	/**
		Current pipeline in use by the WebGLRenderer.
	**/
	var current : WebGLPipeline;
	/**
		The previous WebGLPipeline that was in use.
		
		This is set when `clearPipeline` is called and restored in `rebindPipeline` if none is given.
	**/
	var previous : WebGLPipeline;
	/**
		A constant-style reference to the Multi Pipeline Instance.
		
		This is the default Phaser 3 pipeline and is used by the WebGL Renderer to manage
		camera effects and more. This property is set during the `boot` method.
	**/
	var MULTI_PIPELINE : global.phaser.renderer.webgl.pipelines.MultiPipeline;
	/**
		A constant-style reference to the Bitmap Mask Pipeline Instance.
		
		This is the default Phaser 3 mask pipeline and is used Game Objects using
		a Bitmap Mask. This property is set during the `boot` method.
	**/
	var BITMAPMASK_PIPELINE : global.phaser.renderer.webgl.pipelines.BitmapMaskPipeline;
	/**
		A constant-style reference to the Utility Pipeline Instance.
	**/
	var UTILITY_PIPELINE : global.phaser.renderer.webgl.pipelines.UtilityPipeline;
	/**
		A reference to the Full Frame 1 Render Target that belongs to the
		Utility Pipeline. This property is set during the `boot` method.
		
		This Render Target is the full size of the renderer.
		
		You can use this directly in Post FX Pipelines for multi-target effects.
		However, be aware that these targets are shared between all post fx pipelines.
	**/
	var fullFrame1 : RenderTarget;
	/**
		A reference to the Full Frame 2 Render Target that belongs to the
		Utility Pipeline. This property is set during the `boot` method.
		
		This Render Target is the full size of the renderer.
		
		You can use this directly in Post FX Pipelines for multi-target effects.
		However, be aware that these targets are shared between all post fx pipelines.
	**/
	var fullFrame2 : RenderTarget;
	/**
		A reference to the Half Frame 1 Render Target that belongs to the
		Utility Pipeline. This property is set during the `boot` method.
		
		This Render Target is half the size of the renderer.
		
		You can use this directly in Post FX Pipelines for multi-target effects.
		However, be aware that these targets are shared between all post fx pipelines.
	**/
	var halfFrame1 : RenderTarget;
	/**
		A reference to the Half Frame 2 Render Target that belongs to the
		Utility Pipeline. This property is set during the `boot` method.
		
		This Render Target is half the size of the renderer.
		
		You can use this directly in Post FX Pipelines for multi-target effects.
		However, be aware that these targets are shared between all post fx pipelines.
	**/
	var halfFrame2 : RenderTarget;
	/**
		Internal boot handler, called by the WebGLRenderer durings its boot process.
		
		Adds all of the default pipelines, based on the game config, and then calls
		the `boot` method on each one of them.
		
		Finally, the default pipeline is set.
	**/
	function boot(?pipelineConfig:global.phaser.types.core.PipelineConfig):Void;
	/**
		Adds a pipeline instance to this Pipeline Manager.
		
		The name of the instance must be unique within this manager.
		
		Make sure to pass an instance to this method, not a base class.
		
		For example, you should pass it like this:
		
		```javascript
		this.add('yourName', new CustomPipeline());`
		```
		
		and **not** like this:
		
		```javascript
		this.add('yourName', CustomPipeline);`
		```
		
		To add a **Post Pipeline**, see `addPostPipeline` instead.
	**/
	function add(name:String, pipeline:WebGLPipeline):WebGLPipeline;
	/**
		Adds a Post Pipeline to this Pipeline Manager.
		
		Make sure to pass a base class to this method, not an instance.
		
		For example, you should pass it like this:
		
		```javascript
		this.addPostPipeline('yourName', CustomPipeline);`
		```
		
		and **not** like this:
		
		```javascript
		this.addPostPipeline('yourName', new CustomPipeline());`
		```
		
		To add a regular pipeline, see the `add` method instead.
	**/
	function addPostPipeline(name:String, pipeline:haxe.Constraints.Function):PipelineManager;
	/**
		Flushes the current pipeline, if one is bound.
	**/
	function flush():Void;
	/**
		Checks if a pipeline is present in this Pipeline Manager.
	**/
	function has(pipeline:ts.AnyOf2<String, WebGLPipeline>):Bool;
	/**
		Returns the pipeline instance based on the given name, or instance.
		
		If no instance, or matching name, exists in this manager, it returns `undefined`.
	**/
	function get(pipeline:ts.AnyOf2<String, WebGLPipeline>):WebGLPipeline;
	/**
		Returns a _new instance_ of the post pipeline based on the given name, or class.
		
		If no instance, or matching name, exists in this manager, it returns `undefined`.
	**/
	function getPostPipeline(pipeline:ts.AnyOf3<String, haxe.Constraints.Function, global.phaser.renderer.webgl.pipelines.PostFXPipeline>, ?gameObject:global.phaser.gameobjects.GameObject):global.phaser.renderer.webgl.pipelines.PostFXPipeline;
	/**
		Removes a pipeline instance based on the given name.
		
		If no pipeline matches the name, this method does nothing.
		
		Note that the pipeline will not be flushed or destroyed, it's simply removed from
		this manager.
	**/
	function remove(name:String, ?removeClass:Bool, ?removePostPipelineClass:Bool):Void;
	/**
		Sets the current pipeline to be used by the `WebGLRenderer`.
		
		This method accepts a pipeline instance as its parameter, not the name.
		
		If the pipeline isn't already the current one it will call `WebGLPipeline.bind` and then `onBind`.
		
		You cannot set Post FX Pipelines using this method. To use a Post FX Pipeline, you should
		apply it to either a Camera, Container or other supporting Game Object.
	**/
	function set(pipeline:WebGLPipeline, ?gameObject:global.phaser.gameobjects.GameObject, ?currentShader:WebGLShader):WebGLPipeline;
	/**
		This method is called by the `WebGLPipeline.batchQuad` method, right before a quad
		belonging to a Game Object is about to be added to the batch. It causes a batch
		flush, then calls the `preBatch` method on the post-fx pipelines belonging to the
		Game Object.
	**/
	function preBatch(gameObject:global.phaser.gameobjects.GameObject):Void;
	/**
		This method is called by the `WebGLPipeline.batchQuad` method, right after a quad
		belonging to a Game Object has been added to the batch. It causes a batch
		flush, then calls the `postBatch` method on the post-fx pipelines belonging to the
		Game Object.
	**/
	function postBatch(gameObject:global.phaser.gameobjects.GameObject):Void;
	/**
		Called at the start of the `WebGLRenderer.preRenderCamera` method.
		
		If the Camera has post pipelines set, it will flush the batch and then call the
		`preBatch` method on the post-fx pipelines belonging to the Camera.
	**/
	function preBatchCamera(camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		Called at the end of the `WebGLRenderer.postRenderCamera` method.
		
		If the Camera has post pipelines set, it will flush the batch and then call the
		`postBatch` method on the post-fx pipelines belonging to the Camera.
	**/
	function postBatchCamera(camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		Checks to see if the given pipeline is already the active pipeline, both within this
		Pipeline Manager and also has the same shader set in the Renderer.
	**/
	function isCurrent(pipeline:WebGLPipeline, ?currentShader:WebGLShader):Bool;
	/**
		Copy the `source` Render Target to the `target` Render Target.
		
		You can optionally set the brightness factor of the copy.
		
		The difference between this method and `drawFrame` is that this method
		uses a faster copy shader, where only the brightness can be modified.
		If you need color level manipulation, see `drawFrame` instead.
		
		The copy itself is handled by the Utility Pipeline.
	**/
	function copyFrame(source:RenderTarget, ?target:RenderTarget, ?brightness:Float, ?clear:Bool, ?clearAlpha:Bool):PipelineManager;
	/**
		Pops the framebuffer from the renderers FBO stack and sets that as the active target,
		then draws the `source` Render Target to it. It then resets the renderer textures.
		
		This should be done when you need to draw the _final_ results of a pipeline to the game
		canvas, or the next framebuffer in line on the FBO stack. You should only call this once
		in the `onDraw` handler and it should be the final thing called. Be careful not to call
		this if you need to actually use the pipeline shader, instead of the copy shader. In
		those cases, use the `bindAndDraw` method.
	**/
	function copyToGame(source:RenderTarget):Void;
	/**
		Copy the `source` Render Target to the `target` Render Target, using the
		given Color Matrix.
		
		The difference between this method and `copyFrame` is that this method
		uses a color matrix shader, where you have full control over the luminance
		values used during the copy. If you don't need this, you can use the faster
		`copyFrame` method instead.
		
		The copy itself is handled by the Utility Pipeline.
	**/
	function drawFrame(source:RenderTarget, ?target:RenderTarget, ?clearAlpha:Bool, ?colorMatrix:global.phaser.display.ColorMatrix):PipelineManager;
	/**
		Draws the `source1` and `source2` Render Targets to the `target` Render Target
		using a linear blend effect, which is controlled by the `strength` parameter.
		
		The draw itself is handled by the Utility Pipeline.
	**/
	function blendFrames(source1:RenderTarget, source2:RenderTarget, ?target:RenderTarget, ?strength:Float, ?clearAlpha:Bool):PipelineManager;
	/**
		Draws the `source1` and `source2` Render Targets to the `target` Render Target
		using an additive blend effect, which is controlled by the `strength` parameter.
		
		The draw itself is handled by the Utility Pipeline.
	**/
	function blendFramesAdditive(source1:RenderTarget, source2:RenderTarget, ?target:RenderTarget, ?strength:Float, ?clearAlpha:Bool):PipelineManager;
	/**
		Clears the given Render Target.
	**/
	function clearFrame(target:RenderTarget, ?clearAlpha:Bool):PipelineManager;
	/**
		Copy the `source` Render Target to the `target` Render Target.
		
		The difference with this copy is that no resizing takes place. If the `source`
		Render Target is larger than the `target` then only a portion the same size as
		the `target` dimensions is copied across.
		
		You can optionally set the brightness factor of the copy.
	**/
	function blitFrame(source:RenderTarget, target:RenderTarget, ?brightness:Float, ?clear:Bool, ?clearAlpha:Bool, ?eraseMode:Bool):PipelineManager;
	/**
		Binds the `source` Render Target and then copies a section of it to the `target` Render Target.
		
		This method is extremely fast because it uses `gl.copyTexSubImage2D` and doesn't
		require the use of any shaders. Remember the coordinates are given in standard WebGL format,
		where x and y specify the lower-left corner of the section, not the top-left. Also, the
		copy entirely replaces the contents of the target texture, no 'merging' or 'blending' takes
		place.
	**/
	function copyFrameRect(source:RenderTarget, target:RenderTarget, x:Float, y:Float, width:Float, height:Float, ?clear:Bool, ?clearAlpha:Bool):PipelineManager;
	/**
		Returns `true` if the current pipeline is forced to use texture unit zero.
	**/
	function forceZero():Bool;
	/**
		Sets the Multi Pipeline to be the currently bound pipeline.
		
		This is the default Phaser 3 rendering pipeline.
	**/
	function setMulti():global.phaser.renderer.webgl.pipelines.MultiPipeline;
	/**
		Sets the Utility Pipeline to be the currently bound pipeline.
	**/
	function setUtility(?currentShader:WebGLShader):global.phaser.renderer.webgl.pipelines.UtilityPipeline;
	/**
		Use this to reset the gl context to the state that Phaser requires to continue rendering.
		
		Calling this will:
		
		* Disable `DEPTH_TEST`, `CULL_FACE` and `STENCIL_TEST`.
		* Clear the depth buffer and stencil buffers.
		* Reset the viewport size.
		* Reset the blend mode.
		* Bind a blank texture as the active texture on texture unit zero.
		* Rebinds the given pipeline instance.
		
		You should call this if you have previously called `clear`, and then wish to return
		rendering control to Phaser again.
	**/
	function rebind(?pipeline:WebGLPipeline):Void;
	/**
		Flushes the current pipeline being used and then clears it, along with the
		the current shader program and vertex buffer from the `WebGLRenderer`.
		
		Then resets the blend mode to NORMAL.
		
		Call this before jumping to your own gl context handler, and then call `rebind` when
		you wish to return control to Phaser again.
	**/
	function clear():Void;
	/**
		Destroy the Pipeline Manager, cleaning up all related resources and references.
	**/
	function destroy():Void;
	static var prototype : PipelineManager;
}