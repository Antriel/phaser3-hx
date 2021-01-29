package global.phaser.renderer.webgl.pipelines;

/**
	The Single Pipeline is a special version of the Multi Pipeline that only ever
	uses one texture, bound to texture unit zero. Although not as efficient as the
	Multi Pipeline, it provides an easier way to create custom pipelines that only require
	a single bound texture.
	
	Prior to Phaser v3.50 this pipeline didn't exist, but could be compared to the old `TextureTintPipeline`.
	
	The fragment shader it uses can be found in `shaders/src/Single.frag`.
	The vertex shader it uses can be found in `shaders/src/Single.vert`.
	
	The default shader attributes for this pipeline are:
	
	`inPosition` (vec2, offset 0)
	`inTexCoord` (vec2, offset 8)
	`inTexId` (float, offset 16) - this value is always zero in the Single Pipeline
	`inTintEffect` (float, offset 20)
	`inTint` (vec4, offset 24, normalized)
	
	The default shader uniforms for this pipeline are:
	
	`uProjectionMatrix` (mat4)
	`uMainSampler` (sampler2D)
**/
@:native("Phaser.Renderer.WebGL.Pipelines.SinglePipeline") extern class SinglePipeline extends MultiPipeline {
	function new(config:global.phaser.types.renderer.webgl.WebGLPipelineConfig);
	/**
		Called every time the pipeline is bound by the renderer.
		Sets the shader program, vertex buffer and other resources.
		Should only be called when changing pipeline.
	**/
	function bind():SinglePipeline;
	/**
		Sets the currently active shader within this pipeline.
	**/
	function setShader(shader:global.phaser.renderer.webgl.WebGLShader, ?setAttributes:Bool):SinglePipeline;
	/**
		Destroys all shaders currently set in the `WebGLPipeline.shaders` array and then parses the given
		`config` object, extracting the shaders from it, creating `WebGLShader` instances and finally
		setting them into the `shaders` array of this pipeline.
		
		This is a destructive process. Be very careful when you call it, should you need to.
	**/
	function setShadersFromConfig(config:global.phaser.types.renderer.webgl.WebGLPipelineConfig):SinglePipeline;
	/**
		Resizes the properties used to describe the viewport.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function resize(width:Float, height:Float):SinglePipeline;
	/**
		Adjusts this pipelines ortho Projection Matrix to use the given dimensions
		and resets the `uProjectionMatrix` uniform on all bound shaders.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function setProjectionMatrix(width:Float, height:Float):SinglePipeline;
	/**
		This method is called every time the Pipeline Manager rebinds this pipeline.
		
		It resets all shaders this pipeline uses, setting their attributes again.
	**/
	function rebind():SinglePipeline;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right before a quad
		belonging to a Game Object is about to be added to the batch. When this is called, the
		renderer has just performed a flush. It will bind the current render target, if any are set
		and finally call the `onPreBatch` hook.
	**/
	function preBatch(?gameObject:ts.AnyOf2<global.phaser.cameras.scene2d.Camera, global.phaser.gameobjects.GameObject>):SinglePipeline;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right after a quad
		belonging to a Game Object has been added to the batch. When this is called, the
		renderer has just performed a flush.
		
		It calls the `onDraw` hook followed by the `onPostBatch` hook, which can be used to perform
		additional Post FX Pipeline processing.
	**/
	function postBatch(?gameObject:ts.AnyOf2<global.phaser.cameras.scene2d.Camera, global.phaser.gameobjects.GameObject>):SinglePipeline;
	/**
		Uploads the vertex data and emits a draw call for the current batch of vertices.
	**/
	function flush(?isPostFlush:Bool):SinglePipeline;
	/**
		Activates the given WebGL Texture and binds it to the requested texture slot.
	**/
	function bindTexture(?target:js.html.webgl.Texture, ?unit:Float):SinglePipeline;
	/**
		Activates the given Render Target texture and binds it to the
		requested WebGL texture slot.
	**/
	function bindRenderTarget(?target:global.phaser.renderer.webgl.RenderTarget, ?unit:Float):SinglePipeline;
	/**
		Sets the current duration into a 1f uniform value based on the given name.
		
		This can be used for mapping time uniform values, such as `iTime`.
	**/
	function setTime(name:String):SinglePipeline;
	/**
		Sets a 1f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1f(name:String, x:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 2f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2f(name:String, x:Float, y:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 3f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3f(name:String, x:Float, y:Float, z:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 4f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4f(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 1fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 1iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 2iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 3iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 4iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 1i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1i(name:String, x:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 2i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2i(name:String, x:Float, y:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 3i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3i(name:String, x:Float, y:Float, z:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a 4i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4i(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a matrix 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix2fv(name:String, transpose:Bool, matrix:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a matrix 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix3fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Sets a matrix 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix4fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:global.phaser.renderer.webgl.WebGLShader):SinglePipeline;
	/**
		Destroys all shader instances, removes all object references and nulls all external references.
	**/
	function destroy():SinglePipeline;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):SinglePipeline;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):SinglePipeline;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):SinglePipeline;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):SinglePipeline;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):SinglePipeline;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):SinglePipeline;
	static var prototype : SinglePipeline;
}