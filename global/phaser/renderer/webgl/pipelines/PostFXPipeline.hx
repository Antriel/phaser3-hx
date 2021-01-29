package global.phaser.renderer.webgl.pipelines;

/**
	The Post FX Pipeline is a special kind of pipeline specifically for handling post
	processing effects. Where-as a standard Pipeline allows you to control the process
	of rendering Game Objects by configuring the shaders and attributes used to draw them,
	a Post FX Pipeline is designed to allow you to apply processing _after_ the Game Object/s
	have been rendered. Typical examples of post processing effects are bloom filters,
	blurs, light effects and color manipulation.
	
	The pipeline works by creating a tiny vertex buffer with just one single hard-coded quad
	in it. Game Objects can have a Post Pipeline set on them. Those objects are then rendered
	using their standard pipeline, but are redirected to the Render Targets owned by the
	post pipeline, which can then apply their own shaders and effects, before passing them
	back to the main renderer.
	
	Please see the Phaser 3 examples for further details on this extensive subject.
	
	The default fragment shader it uses can be found in `shaders/src/PostFX.frag`.
	The default vertex shader it uses can be found in `shaders/src/Quad.vert`.
	
	The default shader attributes for this pipeline are:
	
	`inPosition` (vec2, offset 0)
	`inTexCoord` (vec2, offset 8)
	
	The vertices array layout is:
	
	-1,  1   B----C   1,  1
	  0,  1   |   /|   1,  1
	          |  / |
	          | /  |
	          |/   |
	-1, -1   A----D   1, -1
	  0,  0            1,  0
	
	A = -1, -1 (pos) and 0, 0 (uv)
	B = -1,  1 (pos) and 0, 1 (uv)
	C =  1,  1 (pos) and 1, 1 (uv)
	D =  1, -1 (pos) and 1, 0 (uv)
	
	First tri: A, B, C
	Second tri: A, C, D
	
	Array index:
	
	0  = Tri 1 - Vert A - x pos
	1  = Tri 1 - Vert A - y pos
	2  = Tri 1 - Vert A - uv u
	3  = Tri 1 - Vert A - uv v
	
	4  = Tri 1 - Vert B - x pos
	5  = Tri 1 - Vert B - y pos
	6  = Tri 1 - Vert B - uv u
	7  = Tri 1 - Vert B - uv v
	
	8  = Tri 1 - Vert C - x pos
	9  = Tri 1 - Vert C - y pos
	10 = Tri 1 - Vert C - uv u
	11 = Tri 1 - Vert C - uv v
	
	12 = Tri 2 - Vert A - x pos
	13 = Tri 2 - Vert A - y pos
	14 = Tri 2 - Vert A - uv u
	15 = Tri 2 - Vert A - uv v
	
	16 = Tri 2 - Vert C - x pos
	17 = Tri 2 - Vert C - y pos
	18 = Tri 2 - Vert C - uv u
	19 = Tri 2 - Vert C - uv v
	
	20 = Tri 2 - Vert D - x pos
	21 = Tri 2 - Vert D - y pos
	22 = Tri 2 - Vert D - uv u
	23 = Tri 2 - Vert D - uv v
**/
@:native("Phaser.Renderer.WebGL.Pipelines.PostFXPipeline") extern class PostFXPipeline extends global.phaser.renderer.webgl.WebGLPipeline {
	function new(config:global.phaser.types.renderer.webgl.WebGLPipelineConfig);
	/**
		If this post-pipeline belongs to a Game Object or Camera, this contains a reference to it.
	**/
	var gameObject : global.phaser.gameobjects.GameObject;
	/**
		A Color Matrix instance belonging to this pipeline.
		
		Used during calls to the `drawFrame` method.
	**/
	var colorMatrix : global.phaser.display.ColorMatrix;
	/**
		A reference to the Full Frame 1 Render Target that belongs to the
		Utility Pipeline. This property is set during the `boot` method.
		
		This Render Target is the full size of the renderer.
		
		You can use this directly in Post FX Pipelines for multi-target effects.
		However, be aware that these targets are shared between all post fx pipelines.
	**/
	var fullFrame1 : global.phaser.renderer.webgl.RenderTarget;
	/**
		A reference to the Full Frame 2 Render Target that belongs to the
		Utility Pipeline. This property is set during the `boot` method.
		
		This Render Target is the full size of the renderer.
		
		You can use this directly in Post FX Pipelines for multi-target effects.
		However, be aware that these targets are shared between all post fx pipelines.
	**/
	var fullFrame2 : global.phaser.renderer.webgl.RenderTarget;
	/**
		A reference to the Half Frame 1 Render Target that belongs to the
		Utility Pipeline. This property is set during the `boot` method.
		
		This Render Target is half the size of the renderer.
		
		You can use this directly in Post FX Pipelines for multi-target effects.
		However, be aware that these targets are shared between all post fx pipelines.
	**/
	var halfFrame1 : global.phaser.renderer.webgl.RenderTarget;
	/**
		A reference to the Half Frame 2 Render Target that belongs to the
		Utility Pipeline. This property is set during the `boot` method.
		
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
	function drawFrame(source:global.phaser.renderer.webgl.RenderTarget, ?target:global.phaser.renderer.webgl.RenderTarget, ?clearAlpha:Bool):Void;
	/**
		Draws the `source1` and `source2` Render Targets to the `target` Render Target
		using a linear blend effect, which is controlled by the `strength` parameter.
	**/
	function blendFrames(source1:global.phaser.renderer.webgl.RenderTarget, source2:global.phaser.renderer.webgl.RenderTarget, ?target:global.phaser.renderer.webgl.RenderTarget, ?strength:Float, ?clearAlpha:Bool):Void;
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
		Binds this pipeline and draws the `source` Render Target to the `target` Render Target.
		
		If no `target` is specified, it will pop the framebuffer from the Renderers FBO stack
		and use that instead, which should be done when you need to draw the final results of
		this pipeline to the game canvas.
		
		You can optionally set the shader to be used for the draw here, if this is a multi-shader
		pipeline. By default `currentShader` will be used. If you need to set a shader but not
		a target, just pass `null` as the `target` parameter.
	**/
	function bindAndDraw(source:global.phaser.renderer.webgl.RenderTarget, ?target:global.phaser.renderer.webgl.RenderTarget, ?clear:Bool, ?clearAlpha:Bool, ?currentShader:global.phaser.renderer.webgl.WebGLShader):Void;
	/**
		Sets the currently active shader within this pipeline.
	**/
	function setShader(shader:global.phaser.renderer.webgl.WebGLShader, ?setAttributes:Bool):PostFXPipeline;
	/**
		Destroys all shaders currently set in the `WebGLPipeline.shaders` array and then parses the given
		`config` object, extracting the shaders from it, creating `WebGLShader` instances and finally
		setting them into the `shaders` array of this pipeline.
		
		This is a destructive process. Be very careful when you call it, should you need to.
	**/
	function setShadersFromConfig(config:global.phaser.types.renderer.webgl.WebGLPipelineConfig):PostFXPipeline;
	/**
		Resizes the properties used to describe the viewport.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function resize(width:Float, height:Float):PostFXPipeline;
	/**
		Adjusts this pipelines ortho Projection Matrix to use the given dimensions
		and resets the `uProjectionMatrix` uniform on all bound shaders.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function setProjectionMatrix(width:Float, height:Float):PostFXPipeline;
	/**
		This method is called every time the Pipeline Manager makes this pipeline the currently active one.
		
		It binds the resources and shader needed for this pipeline, including setting the vertex buffer
		and attribute pointers.
	**/
	function bind(?currentShader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		This method is called every time the Pipeline Manager rebinds this pipeline.
		
		It resets all shaders this pipeline uses, setting their attributes again.
	**/
	function rebind():PostFXPipeline;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right before a quad
		belonging to a Game Object is about to be added to the batch. When this is called, the
		renderer has just performed a flush. It will bind the current render target, if any are set
		and finally call the `onPreBatch` hook.
	**/
	function preBatch(?gameObject:ts.AnyOf2<global.phaser.cameras.scene2d.Camera, global.phaser.gameobjects.GameObject>):PostFXPipeline;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right after a quad
		belonging to a Game Object has been added to the batch. When this is called, the
		renderer has just performed a flush.
		
		It calls the `onDraw` hook followed by the `onPostBatch` hook, which can be used to perform
		additional Post FX Pipeline processing.
	**/
	function postBatch(?gameObject:ts.AnyOf2<global.phaser.cameras.scene2d.Camera, global.phaser.gameobjects.GameObject>):PostFXPipeline;
	/**
		Uploads the vertex data and emits a draw call for the current batch of vertices.
	**/
	function flush(?isPostFlush:Bool):PostFXPipeline;
	/**
		Activates the given WebGL Texture and binds it to the requested texture slot.
	**/
	function bindTexture(?target:js.html.webgl.Texture, ?unit:Float):PostFXPipeline;
	/**
		Activates the given Render Target texture and binds it to the
		requested WebGL texture slot.
	**/
	function bindRenderTarget(?target:global.phaser.renderer.webgl.RenderTarget, ?unit:Float):PostFXPipeline;
	/**
		Sets the current duration into a 1f uniform value based on the given name.
		
		This can be used for mapping time uniform values, such as `iTime`.
	**/
	function setTime(name:String):PostFXPipeline;
	/**
		Sets a 1f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1f(name:String, x:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 2f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2f(name:String, x:Float, y:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 3f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3f(name:String, x:Float, y:Float, z:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 4f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4f(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 1fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 1iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 2iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 3iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 4iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 1i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1i(name:String, x:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 2i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2i(name:String, x:Float, y:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 3i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3i(name:String, x:Float, y:Float, z:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a 4i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4i(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a matrix 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix2fv(name:String, transpose:Bool, matrix:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a matrix 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix3fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Sets a matrix 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix4fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:global.phaser.renderer.webgl.WebGLShader):PostFXPipeline;
	/**
		Destroys all shader instances, removes all object references and nulls all external references.
	**/
	function destroy():PostFXPipeline;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):PostFXPipeline;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):PostFXPipeline;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):PostFXPipeline;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):PostFXPipeline;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):PostFXPipeline;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):PostFXPipeline;
	static var prototype : PostFXPipeline;
}