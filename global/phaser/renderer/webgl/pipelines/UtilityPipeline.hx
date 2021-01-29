package global.phaser.renderer.webgl.pipelines;

/**
	The Utility Pipeline is a special-use pipeline that belongs to the Pipeline Manager.
	
	It provides 4 shaders and handy associated methods:
	
	1) Copy Shader. A fast texture to texture copy shader with optional brightness setting.
	2) Additive Blend Mode Shader. Blends two textures using an additive blend mode.
	3) Linear Blend Mode Shader. Blends two textures using a linear blend mode.
	4) Color Matrix Copy Shader. Draws a texture to a target using a Color Matrix.
	
	You do not extend this pipeline, but instead get a reference to it from the Pipeline
	Manager via the `setUtility` method. You can also access methods such as `copyFrame`
	directly from the Pipeline Manager.
	
	This pipeline provides methods for manipulating framebuffer backed textures, such as
	copying or blending one texture to another, copying a portion of a texture, additively
	blending two textures, flipping textures and more.
	
	The default shader attributes for this pipeline are:
	
	`inPosition` (vec2, offset 0)
	`inTexCoord` (vec2, offset 8)
	
	This pipeline has a hard-coded batch size of 1 and a hard coded set of vertices.
**/
@:native("Phaser.Renderer.WebGL.Pipelines.UtilityPipeline") extern class UtilityPipeline extends global.phaser.renderer.webgl.WebGLPipeline {
	function new(config:global.phaser.types.renderer.webgl.WebGLPipelineConfig);
	/**
		A default Color Matrix, used by the Color Matrix Shader when one
		isn't provided.
	**/
	var colorMatrix : global.phaser.display.ColorMatrix;
	/**
		A reference to the Copy Shader belonging to this Utility Pipeline.
		
		This property is set during the `boot` method.
	**/
	var copyShader : global.phaser.renderer.webgl.WebGLShader;
	/**
		A reference to the Additive Blend Shader belonging to this Utility Pipeline.
		
		This property is set during the `boot` method.
	**/
	var addShader : global.phaser.renderer.webgl.WebGLShader;
	/**
		A reference to the Linear Blend Shader belonging to this Utility Pipeline.
		
		This property is set during the `boot` method.
	**/
	var linearShader : global.phaser.renderer.webgl.WebGLShader;
	/**
		A reference to the Color Matrix Shader belonging to this Utility Pipeline.
		
		This property is set during the `boot` method.
	**/
	var colorMatrixShader : global.phaser.renderer.webgl.WebGLShader;
	/**
		A reference to the Full Frame 1 Render Target.
		
		This property is set during the `boot` method.
		
		This Render Target is the full size of the renderer.
		
		You can use this directly in Post FX Pipelines for multi-target effects.
		However, be aware that these targets are shared between all post fx pipelines.
	**/
	var fullFrame1 : global.phaser.renderer.webgl.RenderTarget;
	/**
		A reference to the Full Frame 2 Render Target.
		
		This property is set during the `boot` method.
		
		This Render Target is the full size of the renderer.
		
		You can use this directly in Post FX Pipelines for multi-target effects.
		However, be aware that these targets are shared between all post fx pipelines.
	**/
	var fullFrame2 : global.phaser.renderer.webgl.RenderTarget;
	/**
		A reference to the Half Frame 1 Render Target.
		
		This property is set during the `boot` method.
		
		This Render Target is half the size of the renderer.
		
		You can use this directly in Post FX Pipelines for multi-target effects.
		However, be aware that these targets are shared between all post fx pipelines.
	**/
	var halfFrame1 : global.phaser.renderer.webgl.RenderTarget;
	/**
		A reference to the Half Frame 2 Render Target.
		
		This property is set during the `boot` method.
		
		This Render Target is half the size of the renderer.
		
		You can use this directly in Post FX Pipelines for multi-target effects.
		However, be aware that these targets are shared between all post fx pipelines.
	**/
	var halfFrame2 : global.phaser.renderer.webgl.RenderTarget;
	/**
		Copy the `source` Render Target to the `target` Render Target.
		
		You can optionally set the brightness factor of the copy.
		
		The difference between this method and `drawFrame` is that this method
		uses a faster copy shader, where only the brightness can be modified.
		If you need color level manipulation, see `drawFrame` instead.
	**/
	function copyFrame(source:global.phaser.renderer.webgl.RenderTarget, ?target:global.phaser.renderer.webgl.RenderTarget, ?brightness:Float, ?clear:Bool, ?clearAlpha:Bool):Void;
	/**
		Copy the `source` Render Target to the `target` Render Target.
		
		The difference with this copy is that no resizing takes place. If the `source`
		Render Target is larger than the `target` then only a portion the same size as
		the `target` dimensions is copied across.
		
		You can optionally set the brightness factor of the copy.
	**/
	function blitFrame(source:global.phaser.renderer.webgl.RenderTarget, target:global.phaser.renderer.webgl.RenderTarget, ?brightness:Float, ?clear:Bool, ?clearAlpha:Bool, ?eraseMode:Bool):Void;
	/**
		Binds the `source` Render Target and then copies a section of it to the `target` Render Target.
		
		This method is extremely fast because it uses `gl.copyTexSubImage2D` and doesn't
		require the use of any shaders. Remember the coordinates are given in standard WebGL format,
		where x and y specify the lower-left corner of the section, not the top-left. Also, the
		copy entirely replaces the contents of the target texture, no 'merging' or 'blending' takes
		place.
	**/
	function copyFrameRect(source:global.phaser.renderer.webgl.RenderTarget, target:global.phaser.renderer.webgl.RenderTarget, x:Float, y:Float, width:Float, height:Float, ?clear:Bool, ?clearAlpha:Bool):Void;
	/**
		Pops the framebuffer from the renderers FBO stack and sets that as the active target,
		then draws the `source` Render Target to it. It then resets the renderer textures.
		
		This should be done when you need to draw the _final_ results of a pipeline to the game
		canvas, or the next framebuffer in line on the FBO stack. You should only call this once
		in the `onDraw` handler and it should be the final thing called. Be careful not to call
		this if you need to actually use the pipeline shader, instead of the copy shader. In
		those cases, use the `bindAndDraw` method.
	**/
	function copyToGame(source:global.phaser.renderer.webgl.RenderTarget):Void;
	/**
		Copy the `source` Render Target to the `target` Render Target, using the
		given Color Matrix.
		
		The difference between this method and `copyFrame` is that this method
		uses a color matrix shader, where you have full control over the luminance
		values used during the copy. If you don't need this, you can use the faster
		`copyFrame` method instead.
	**/
	function drawFrame(source:global.phaser.renderer.webgl.RenderTarget, ?target:global.phaser.renderer.webgl.RenderTarget, ?clearAlpha:Bool, ?colorMatrix:global.phaser.display.ColorMatrix):Void;
	/**
		Draws the `source1` and `source2` Render Targets to the `target` Render Target
		using a linear blend effect, which is controlled by the `strength` parameter.
	**/
	function blendFrames(source1:global.phaser.renderer.webgl.RenderTarget, source2:global.phaser.renderer.webgl.RenderTarget, ?target:global.phaser.renderer.webgl.RenderTarget, ?strength:Float, ?clearAlpha:Bool, ?blendShader:global.phaser.renderer.webgl.WebGLShader):Void;
	/**
		Draws the `source1` and `source2` Render Targets to the `target` Render Target
		using an additive blend effect, which is controlled by the `strength` parameter.
	**/
	function blendFramesAdditive(source1:global.phaser.renderer.webgl.RenderTarget, source2:global.phaser.renderer.webgl.RenderTarget, ?target:global.phaser.renderer.webgl.RenderTarget, ?strength:Float, ?clearAlpha:Bool):Void;
	/**
		Clears the given Render Target.
	**/
	function clearFrame(target:global.phaser.renderer.webgl.RenderTarget, ?clearAlpha:Bool):Void;
	/**
		Set the UV values for the 6 vertices that make up the quad used by the shaders
		in the Utility Pipeline.
		
		Be sure to call `resetUVs` once you have finished manipulating the UV coordinates.
	**/
	function setUVs(uA:Float, vA:Float, uB:Float, vB:Float, uC:Float, vC:Float, uD:Float, vD:Float):Void;
	/**
		Sets the vertex UV coordinates of the quad used by the shaders in the Utility Pipeline
		so that they correctly adjust the texture coordinates for a blit frame effect.
		
		Be sure to call `resetUVs` once you have finished manipulating the UV coordinates.
	**/
	function setTargetUVs(source:global.phaser.renderer.webgl.RenderTarget, target:global.phaser.renderer.webgl.RenderTarget):Void;
	/**
		Horizontally flips the UV coordinates of the quad used by the shaders in this
		Utility Pipeline.
		
		Be sure to call `resetUVs` once you have finished manipulating the UV coordinates.
	**/
	function flipX():Void;
	/**
		Vertically flips the UV coordinates of the quad used by the shaders in this
		Utility Pipeline.
		
		Be sure to call `resetUVs` once you have finished manipulating the UV coordinates.
	**/
	function flipY():Void;
	/**
		Resets the quad vertice UV values to their default settings.
		
		The quad is used by all shaders of the Utility Pipeline.
	**/
	function resetUVs():Void;
	/**
		Sets the currently active shader within this pipeline.
	**/
	function setShader(shader:global.phaser.renderer.webgl.WebGLShader, ?setAttributes:Bool):UtilityPipeline;
	/**
		Destroys all shaders currently set in the `WebGLPipeline.shaders` array and then parses the given
		`config` object, extracting the shaders from it, creating `WebGLShader` instances and finally
		setting them into the `shaders` array of this pipeline.
		
		This is a destructive process. Be very careful when you call it, should you need to.
	**/
	function setShadersFromConfig(config:global.phaser.types.renderer.webgl.WebGLPipelineConfig):UtilityPipeline;
	/**
		Resizes the properties used to describe the viewport.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function resize(width:Float, height:Float):UtilityPipeline;
	/**
		Adjusts this pipelines ortho Projection Matrix to use the given dimensions
		and resets the `uProjectionMatrix` uniform on all bound shaders.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function setProjectionMatrix(width:Float, height:Float):UtilityPipeline;
	/**
		This method is called every time the Pipeline Manager makes this pipeline the currently active one.
		
		It binds the resources and shader needed for this pipeline, including setting the vertex buffer
		and attribute pointers.
	**/
	function bind(?currentShader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		This method is called every time the Pipeline Manager rebinds this pipeline.
		
		It resets all shaders this pipeline uses, setting their attributes again.
	**/
	function rebind():UtilityPipeline;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right before a quad
		belonging to a Game Object is about to be added to the batch. When this is called, the
		renderer has just performed a flush. It will bind the current render target, if any are set
		and finally call the `onPreBatch` hook.
	**/
	function preBatch(?gameObject:ts.AnyOf2<global.phaser.cameras.scene2d.Camera, global.phaser.gameobjects.GameObject>):UtilityPipeline;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right after a quad
		belonging to a Game Object has been added to the batch. When this is called, the
		renderer has just performed a flush.
		
		It calls the `onDraw` hook followed by the `onPostBatch` hook, which can be used to perform
		additional Post FX Pipeline processing.
	**/
	function postBatch(?gameObject:ts.AnyOf2<global.phaser.cameras.scene2d.Camera, global.phaser.gameobjects.GameObject>):UtilityPipeline;
	/**
		Uploads the vertex data and emits a draw call for the current batch of vertices.
	**/
	function flush(?isPostFlush:Bool):UtilityPipeline;
	/**
		Activates the given WebGL Texture and binds it to the requested texture slot.
	**/
	function bindTexture(?target:js.html.webgl.Texture, ?unit:Float):UtilityPipeline;
	/**
		Activates the given Render Target texture and binds it to the
		requested WebGL texture slot.
	**/
	function bindRenderTarget(?target:global.phaser.renderer.webgl.RenderTarget, ?unit:Float):UtilityPipeline;
	/**
		Sets the current duration into a 1f uniform value based on the given name.
		
		This can be used for mapping time uniform values, such as `iTime`.
	**/
	function setTime(name:String):UtilityPipeline;
	/**
		Sets a 1f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1f(name:String, x:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 2f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2f(name:String, x:Float, y:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 3f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3f(name:String, x:Float, y:Float, z:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 4f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4f(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 1fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 1iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 2iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 3iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 4iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 1i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1i(name:String, x:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 2i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2i(name:String, x:Float, y:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 3i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3i(name:String, x:Float, y:Float, z:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a 4i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4i(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a matrix 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix2fv(name:String, transpose:Bool, matrix:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a matrix 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix3fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Sets a matrix 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix4fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:global.phaser.renderer.webgl.WebGLShader):UtilityPipeline;
	/**
		Destroys all shader instances, removes all object references and nulls all external references.
	**/
	function destroy():UtilityPipeline;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):UtilityPipeline;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):UtilityPipeline;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):UtilityPipeline;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):UtilityPipeline;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):UtilityPipeline;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):UtilityPipeline;
	static var prototype : UtilityPipeline;
}