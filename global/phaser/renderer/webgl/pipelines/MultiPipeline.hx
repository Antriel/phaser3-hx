package global.phaser.renderer.webgl.pipelines;

/**
	The Multi Pipeline is the core 2D texture rendering pipeline used by Phaser in WebGL.
	Virtually all Game Objects use this pipeline by default, including Sprites, Graphics
	and Tilemaps. It handles the batching of quads and tris, as well as methods for
	drawing and batching geometry data.
	
	Prior to Phaser v3.50 this pipeline was called the `TextureTintPipeline`.
	
	In previous versions of Phaser only one single texture unit was supported at any one time.
	The Multi Pipeline is an evolution of the old Texture Tint Pipeline, updated to support
	multi-textures for increased performance.
	
	The fragment shader it uses can be found in `shaders/src/Multi.frag`.
	The vertex shader it uses can be found in `shaders/src/Multi.vert`.
	
	The default shader attributes for this pipeline are:
	
	`inPosition` (vec2, offset 0)
	`inTexCoord` (vec2, offset 8)
	`inTexId` (float, offset 16)
	`inTintEffect` (float, offset 20)
	`inTint` (vec4, offset 24, normalized)
	
	The default shader uniforms for this pipeline are:
	
	`uProjectionMatrix` (mat4)
	`uMainSampler` (sampler2D array)
	
	If you wish to create a custom pipeline extending from this one, you can use two string
	declarations in your fragment shader source: `%count%` and `%forloop%`, where `count` is
	used to set the number of `sampler2Ds` available, and `forloop` is a block of GLSL code
	that will get the currently bound texture unit.
	
	This pipeline will automatically inject that code for you, should those values exist
	in your shader source. If you wish to handle this yourself, you can also use the
	function `Utils.parseFragmentShaderMaxTextures`.
	
	If you wish to create a pipeline that works from a single texture, or that doesn't have
	internal texture iteration, please see the `SinglePipeline` instead.
**/
@:native("Phaser.Renderer.WebGL.Pipelines.MultiPipeline") extern class MultiPipeline extends global.phaser.renderer.webgl.WebGLPipeline {
	function new(config:global.phaser.types.renderer.webgl.WebGLPipelineConfig);
	/**
		Called every time the pipeline is bound by the renderer.
		Sets the shader program, vertex buffer and other resources.
		Should only be called when changing pipeline.
	**/
	function bind():MultiPipeline;
	/**
		Takes a Sprite Game Object, or any object that extends it, and adds it to the batch.
	**/
	function batchSprite(gameObject:ts.AnyOf2<global.phaser.gameobjects.Sprite, global.phaser.gameobjects.Image>, camera:global.phaser.cameras.scene2d.Camera, ?parentTransformMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Generic function for batching a textured quad using argument values instead of a Game Object.
	**/
	function batchTexture(gameObject:global.phaser.gameobjects.GameObject, texture:js.html.webgl.Texture, textureWidth:Float, textureHeight:Float, srcX:Float, srcY:Float, srcWidth:Float, srcHeight:Float, scaleX:Float, scaleY:Float, rotation:Float, flipX:Bool, flipY:Bool, scrollFactorX:Float, scrollFactorY:Float, displayOriginX:Float, displayOriginY:Float, frameX:Float, frameY:Float, frameWidth:Float, frameHeight:Float, tintTL:Float, tintTR:Float, tintBL:Float, tintBR:Float, tintEffect:Float, uOffset:Float, vOffset:Float, camera:global.phaser.cameras.scene2d.Camera, parentTransformMatrix:global.phaser.gameobjects.components.TransformMatrix, ?skipFlip:Bool, ?textureUnit:Float):Void;
	/**
		Adds a Texture Frame into the batch for rendering.
	**/
	function batchTextureFrame(frame:global.phaser.textures.Frame, x:Float, y:Float, tint:Float, alpha:Float, transformMatrix:global.phaser.gameobjects.components.TransformMatrix, ?parentTransformMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Sets the currently active shader within this pipeline.
	**/
	function setShader(shader:global.phaser.renderer.webgl.WebGLShader, ?setAttributes:Bool):MultiPipeline;
	/**
		Destroys all shaders currently set in the `WebGLPipeline.shaders` array and then parses the given
		`config` object, extracting the shaders from it, creating `WebGLShader` instances and finally
		setting them into the `shaders` array of this pipeline.
		
		This is a destructive process. Be very careful when you call it, should you need to.
	**/
	function setShadersFromConfig(config:global.phaser.types.renderer.webgl.WebGLPipelineConfig):MultiPipeline;
	/**
		Resizes the properties used to describe the viewport.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function resize(width:Float, height:Float):MultiPipeline;
	/**
		Adjusts this pipelines ortho Projection Matrix to use the given dimensions
		and resets the `uProjectionMatrix` uniform on all bound shaders.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function setProjectionMatrix(width:Float, height:Float):MultiPipeline;
	/**
		This method is called every time the Pipeline Manager rebinds this pipeline.
		
		It resets all shaders this pipeline uses, setting their attributes again.
	**/
	function rebind():MultiPipeline;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right before a quad
		belonging to a Game Object is about to be added to the batch. When this is called, the
		renderer has just performed a flush. It will bind the current render target, if any are set
		and finally call the `onPreBatch` hook.
	**/
	function preBatch(?gameObject:ts.AnyOf2<global.phaser.cameras.scene2d.Camera, global.phaser.gameobjects.GameObject>):MultiPipeline;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right after a quad
		belonging to a Game Object has been added to the batch. When this is called, the
		renderer has just performed a flush.
		
		It calls the `onDraw` hook followed by the `onPostBatch` hook, which can be used to perform
		additional Post FX Pipeline processing.
	**/
	function postBatch(?gameObject:ts.AnyOf2<global.phaser.cameras.scene2d.Camera, global.phaser.gameobjects.GameObject>):MultiPipeline;
	/**
		Uploads the vertex data and emits a draw call for the current batch of vertices.
	**/
	function flush(?isPostFlush:Bool):MultiPipeline;
	/**
		Activates the given WebGL Texture and binds it to the requested texture slot.
	**/
	function bindTexture(?target:js.html.webgl.Texture, ?unit:Float):MultiPipeline;
	/**
		Activates the given Render Target texture and binds it to the
		requested WebGL texture slot.
	**/
	function bindRenderTarget(?target:global.phaser.renderer.webgl.RenderTarget, ?unit:Float):MultiPipeline;
	/**
		Sets the current duration into a 1f uniform value based on the given name.
		
		This can be used for mapping time uniform values, such as `iTime`.
	**/
	function setTime(name:String):MultiPipeline;
	/**
		Sets a 1f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1f(name:String, x:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 2f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2f(name:String, x:Float, y:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 3f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3f(name:String, x:Float, y:Float, z:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 4f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4f(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 1fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 1iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 2iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 3iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 4iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 1i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1i(name:String, x:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 2i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2i(name:String, x:Float, y:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 3i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3i(name:String, x:Float, y:Float, z:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a 4i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4i(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a matrix 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix2fv(name:String, transpose:Bool, matrix:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a matrix 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix3fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Sets a matrix 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix4fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:global.phaser.renderer.webgl.WebGLShader):MultiPipeline;
	/**
		Destroys all shader instances, removes all object references and nulls all external references.
	**/
	function destroy():MultiPipeline;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):MultiPipeline;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):MultiPipeline;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):MultiPipeline;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):MultiPipeline;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):MultiPipeline;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):MultiPipeline;
	static var prototype : MultiPipeline;
}