package global.phaser.renderer.webgl;

/**
	The `WebGLPipeline` is a base class used by all of the core Phaser pipelines.
	
	It describes the way elements will be rendered in WebGL. Internally, it handles
	compiling the shaders, creating vertex buffers, assigning primitive topology and
	binding vertex attributes, all based on the given configuration data.
	
	The pipeline is configured by passing in a `WebGLPipelineConfig` object. Please
	see the documentation for this type to fully understand the configuration options
	available to you.
	
	Usually, you would not extend from this class directly, but would instead extend
	from one of the core pipelines, such as the Multi Pipeline.
	
	The pipeline flow per render-step is as follows:
	
	1) onPreRender - called once at the start of the render step
	2) onRender - call for each Scene Camera that needs to render (so can be multiple times per render step)
	3) Internal flow:
	3a)   bind (only called if a Game Object is using this pipeline and it's not currently active)
	3b)   onBind (called for every Game Object that uses this pipeline)
	3c)   flush (can be called by a Game Object, internal method or from outside by changing pipeline)
	4) onPostRender - called once at the end of the render step
**/
@:native("Phaser.Renderer.WebGL.WebGLPipeline") extern class WebGLPipeline extends global.phaser.events.EventEmitter {
	function new(config:global.phaser.types.renderer.webgl.WebGLPipelineConfig);
	/**
		Name of the pipeline. Used for identification and setting from Game Objects.
	**/
	var name : String;
	/**
		The Phaser Game instance to which this pipeline is bound.
	**/
	var game : global.phaser.Game;
	/**
		The WebGL Renderer instance to which this pipeline is bound.
	**/
	var renderer : WebGLRenderer;
	/**
		A reference to the WebGL Pipeline Manager.
		
		This is initially undefined and only set when this pipeline is added
		to the manager.
	**/
	var manager : PipelineManager;
	/**
		The WebGL context this WebGL Pipeline uses.
	**/
	var gl : js.html.webgl.RenderingContext;
	/**
		The canvas which this WebGL Pipeline renders to.
	**/
	var view : js.html.CanvasElement;
	/**
		Width of the current viewport.
	**/
	var width : Float;
	/**
		Height of the current viewport.
	**/
	var height : Float;
	/**
		The current number of vertices that have been added to the pipeline batch.
	**/
	var vertexCount : Float;
	/**
		The total number of vertices that this pipeline batch can hold before it will flush.
		
		This defaults to `renderer batchSize * 6`, where `batchSize` is defined in the Renderer Game Config.
	**/
	var vertexCapacity : Float;
	/**
		Raw byte buffer of vertices.
		
		Either set via the config object `vertices` property, or generates a new Array Buffer of
		size `vertexCapacity * vertexSize`.
	**/
	final vertexData : js.lib.ArrayBuffer;
	/**
		The WebGLBuffer that holds the vertex data.
		
		Created from the `vertexData` ArrayBuffer. If `vertices` are set in the config, a `STATIC_DRAW` buffer
		is created. If not, a `DYNAMIC_DRAW` buffer is created.
	**/
	final vertexBuffer : js.html.webgl.Buffer;
	/**
		The primitive topology which the pipeline will use to submit draw calls.
		
		Defaults to GL_TRIANGLES if not otherwise set in the config.
	**/
	var topology : Float;
	/**
		Uint8 view to the `vertexData` ArrayBuffer. Used for uploading vertex buffer resources to the GPU.
	**/
	var bytes : js.lib.Uint8Array;
	/**
		Float32 view of the array buffer containing the pipeline's vertices.
	**/
	var vertexViewF32 : js.lib.Float32Array;
	/**
		Uint32 view of the array buffer containing the pipeline's vertices.
	**/
	var vertexViewU32 : js.lib.Uint32Array;
	/**
		Indicates if the current pipeline is active, or not.
		
		Toggle this property to enable or disable a pipeline from rendering anything.
	**/
	var active : Bool;
	/**
		Holds the most recently assigned texture unit.
		
		Treat this value as read-only.
	**/
	var currentUnit : Float;
	/**
		Some pipelines require the forced use of texture zero (like the light pipeline).
		
		This property should be set when that is the case.
	**/
	var forceZero : Bool;
	/**
		Indicates if this pipeline has booted or not.
		
		A pipeline boots only when the Game instance itself, and all associated systems, is
		fully ready.
	**/
	final hasBooted : Bool;
	/**
		Indicates if this is a Post FX Pipeline, or not.
	**/
	final isPostFX : Bool;
	/**
		An array of RenderTarget instances that belong to this pipeline.
	**/
	var renderTargets : Array<RenderTarget>;
	/**
		A reference to the currently bound Render Target instance from the `WebGLPipeline.renderTargets` array.
	**/
	var currentRenderTarget : RenderTarget;
	/**
		An array of all the WebGLShader instances that belong to this pipeline.
		
		Shaders manage their own attributes and uniforms, but share the same vertex data buffer,
		which belongs to this pipeline.
		
		Shaders are set in a call to the `setShadersFromConfig` method, which happens automatically,
		but can also be called at any point in your game. See the method documentation for details.
	**/
	var shaders : Array<WebGLShader>;
	/**
		A reference to the currently bound WebGLShader instance from the `WebGLPipeline.shaders` array.
		
		For lots of pipelines, this is the only shader, so it is a quick way to reference it without
		an array look-up.
	**/
	var currentShader : WebGLShader;
	/**
		The Projection matrix, used by shaders as 'uProjectionMatrix' uniform.
	**/
	var projectionMatrix : global.phaser.math.Matrix4;
	/**
		The cached width of the Projection matrix.
	**/
	var projectionWidth : Float;
	/**
		The cached height of the Projection matrix.
	**/
	var projectionHeight : Float;
	/**
		The configuration object that was used to create this pipeline.
		
		Treat this object as 'read only', because changing it post-creation will not
		impact this pipeline in any way. However, it is used internally for cloning
		and post-boot set-up.
	**/
	var config : global.phaser.types.renderer.webgl.WebGLPipelineConfig;
	/**
		Called when the Game has fully booted and the Renderer has finished setting up.
		
		By this stage all Game level systems are now in place. You can perform any final tasks that the
		pipeline may need, that relies on game systems such as the Texture Manager being ready.
	**/
	function boot():Void;
	/**
		This method is called once when this pipeline has finished being set-up
		at the end of the boot process. By the time this method is called, all
		of the shaders are ready and configured.
	**/
	function onBoot():Void;
	/**
		This method is called once when this pipeline has finished being set-up
		at the end of the boot process. By the time this method is called, all
		of the shaders are ready and configured. It's also called if the renderer
		changes size.
	**/
	function onResize(width:Float, height:Float):Void;
	/**
		Sets the currently active shader within this pipeline.
	**/
	function setShader(shader:WebGLShader, ?setAttributes:Bool):WebGLPipeline;
	/**
		Searches all shaders in this pipeline for one matching the given name, then returns it.
	**/
	function getShaderByName(name:String):WebGLShader;
	/**
		Destroys all shaders currently set in the `WebGLPipeline.shaders` array and then parses the given
		`config` object, extracting the shaders from it, creating `WebGLShader` instances and finally
		setting them into the `shaders` array of this pipeline.
		
		This is a destructive process. Be very careful when you call it, should you need to.
	**/
	function setShadersFromConfig(config:global.phaser.types.renderer.webgl.WebGLPipelineConfig):WebGLPipeline;
	/**
		Custom pipelines can use this method in order to perform any required pre-batch tasks
		for the given Game Object. It must return the texture unit the Game Object was assigned.
	**/
	function setGameObject(gameObject:global.phaser.gameobjects.GameObject, ?frame:global.phaser.textures.Frame):Float;
	/**
		Check if the current batch of vertices is full.
		
		You can optionally provide an `amount` parameter. If given, it will check if the batch
		needs to flush _if_ the `amount` is added to it. This allows you to test if you should
		flush before populating the batch.
	**/
	function shouldFlush(?amount:Float):Bool;
	/**
		Resizes the properties used to describe the viewport.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function resize(width:Float, height:Float):WebGLPipeline;
	/**
		Adjusts this pipelines ortho Projection Matrix to use the given dimensions
		and resets the `uProjectionMatrix` uniform on all bound shaders.
		
		This method is called automatically by the renderer during its resize handler.
	**/
	function setProjectionMatrix(width:Float, height:Float):WebGLPipeline;
	/**
		Adjusts this pipelines ortho Projection Matrix to match that of the global
		WebGL Renderer Projection Matrix.
		
		This method is called automatically by the Pipeline Manager when this
		pipeline is set.
	**/
	function updateProjectionMatrix():Void;
	/**
		This method is called every time the Pipeline Manager makes this pipeline the currently active one.
		
		It binds the resources and shader needed for this pipeline, including setting the vertex buffer
		and attribute pointers.
	**/
	function bind(?currentShader:WebGLShader):WebGLPipeline;
	/**
		This method is called every time the Pipeline Manager rebinds this pipeline.
		
		It resets all shaders this pipeline uses, setting their attributes again.
	**/
	function rebind():WebGLPipeline;
	/**
		Binds the vertex buffer to be the active ARRAY_BUFFER on the WebGL context.
		
		It first checks to see if it's already set as the active buffer and only
		binds itself if not.
	**/
	function setVertexBuffer():Bool;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right before a quad
		belonging to a Game Object is about to be added to the batch. When this is called, the
		renderer has just performed a flush. It will bind the current render target, if any are set
		and finally call the `onPreBatch` hook.
	**/
	function preBatch(?gameObject:ts.AnyOf2<global.phaser.cameras.scene2d.Camera, global.phaser.gameobjects.GameObject>):WebGLPipeline;
	/**
		This method is called as a result of the `WebGLPipeline.batchQuad` method, right after a quad
		belonging to a Game Object has been added to the batch. When this is called, the
		renderer has just performed a flush.
		
		It calls the `onDraw` hook followed by the `onPostBatch` hook, which can be used to perform
		additional Post FX Pipeline processing.
	**/
	function postBatch(?gameObject:ts.AnyOf2<global.phaser.cameras.scene2d.Camera, global.phaser.gameobjects.GameObject>):WebGLPipeline;
	/**
		This method is only used by Post FX Pipelines and those that extend from them.
		
		This method is called every time the `postBatch` method is called and is passed a
		reference to the current render target.
		
		At the very least a Post FX Pipeline should call `this.bindAndDraw(renderTarget)`,
		however, you can do as much additional processing as you like in this method if
		you override it from within your own pipelines.
	**/
	function onDraw(renderTarget:RenderTarget):Void;
	/**
		This method is called every time the Pipeline Manager deactivates this pipeline, swapping from
		it to another one. This happens after a call to `flush` and before the new pipeline is bound.
	**/
	function unbind():Void;
	/**
		Uploads the vertex data and emits a draw call for the current batch of vertices.
	**/
	function flush(?isPostFlush:Bool):WebGLPipeline;
	/**
		By default this is an empty method hook that you can override and use in your own custom pipelines.
		
		This method is called every time the Pipeline Manager makes this the active pipeline. It is called
		at the end of the `WebGLPipeline.bind` method, after the current shader has been set. The current
		shader is passed to this hook.
		
		For example, if a display list has 3 Sprites in it that all use the same pipeline, this hook will
		only be called for the first one, as the 2nd and 3rd Sprites do not cause the pipeline to be changed.
		
		If you need to listen for that event instead, use the `onBind` hook.
	**/
	function onActive(currentShader:WebGLShader):Void;
	/**
		By default this is an empty method hook that you can override and use in your own custom pipelines.
		
		This method is called every time a **Game Object** asks the Pipeline Manager to use this pipeline,
		even if the pipeline is already active.
		
		Unlike the `onActive` method, which is only called when the Pipeline Manager makes this pipeline
		active, this hook is called for every Game Object that requests use of this pipeline, allowing you to
		perform per-object set-up, such as loading shader uniform data.
	**/
	function onBind(?gameObject:global.phaser.gameobjects.GameObject):Void;
	/**
		By default this is an empty method hook that you can override and use in your own custom pipelines.
		
		This method is called when the Pipeline Manager needs to rebind this pipeline. This happens after a
		pipeline has been cleared, usually when passing control over to a 3rd party WebGL library, like Spine,
		and then returing to Phaser again.
	**/
	function onRebind():Void;
	/**
		By default this is an empty method hook that you can override and use in your own custom pipelines.
		
		This method is called every time the `batchQuad` or `batchTri` methods are called. If this was
		as a result of a Game Object, then the Game Object reference is passed to this hook too.
		
		This hook is called _after_ the quad (or tri) has been added to the batch, so you can safely
		call 'flush' from within this.
		
		Note that Game Objects may call `batchQuad` or `batchTri` multiple times for a single draw,
		for example the Graphics Game Object.
	**/
	function onBatch(?gameObject:global.phaser.gameobjects.GameObject):Void;
	/**
		By default this is an empty method hook that you can override and use in your own custom pipelines.
		
		This method is called immediately before a **Game Object** is about to add itself to the batch.
	**/
	function onPreBatch(?gameObject:global.phaser.gameobjects.GameObject):Void;
	/**
		By default this is an empty method hook that you can override and use in your own custom pipelines.
		
		This method is called immediately after a **Game Object** has been added to the batch.
	**/
	function onPostBatch(?gameObject:global.phaser.gameobjects.GameObject):Void;
	/**
		By default this is an empty method hook that you can override and use in your own custom pipelines.
		
		This method is called once per frame, right before anything has been rendered, but after the canvas
		has been cleared. If this pipeline has a render target, it will also have been cleared by this point.
	**/
	function onPreRender():Void;
	/**
		By default this is an empty method hook that you can override and use in your own custom pipelines.
		
		This method is called _once per frame_, by every Camera in a Scene that wants to render.
		
		It is called at the start of the rendering process, before anything has been drawn to the Camera.
	**/
	function onRender(scene:global.phaser.Scene, camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		By default this is an empty method hook that you can override and use in your own custom pipelines.
		
		This method is called _once per frame_, after all rendering has happened and snapshots have been taken.
		
		It is called at the very end of the rendering process, once all Cameras, for all Scenes, have
		been rendered.
	**/
	function onPostRender():Void;
	/**
		By default this is an empty method hook that you can override and use in your own custom pipelines.
		
		This method is called every time this pipeline is asked to flush its batch.
		
		It is called immediately before the `gl.bufferData` and `gl.drawArrays` calls are made, so you can
		perform any final pre-render modifications. To apply changes post-render, see `onAfterFlush`.
	**/
	function onBeforeFlush(?isPostFlush:Bool):Void;
	/**
		By default this is an empty method hook that you can override and use in your own custom pipelines.
		
		This method is called immediately after this pipeline has finished flushing its batch.
		
		It is called after the `gl.drawArrays` call.
		
		You can perform additional post-render effects, but be careful not to call `flush`
		on this pipeline from within this method, or you'll cause an infinite loop.
		
		To apply changes pre-render, see `onBeforeFlush`.
	**/
	function onAfterFlush(?isPostFlush:Bool):Void;
	/**
		Adds a single vertex to the current vertex buffer and increments the
		`vertexCount` property by 1.
		
		This method is called directly by `batchTri` and `batchQuad`.
		
		It does not perform any batch limit checking itself, so if you need to call
		this method directly, do so in the same way that `batchQuad` does, for example.
	**/
	function batchVert(x:Float, y:Float, u:Float, v:Float, unit:Float, tintEffect:ts.AnyOf2<Float, Bool>, tint:Float):Void;
	/**
		Adds the vertices data into the batch and flushes if full.
		
		Assumes 6 vertices in the following arrangement:
		
		```
		0----3
		|\  B|
		| \  |
		|  \ |
		| A \|
		|    \
		1----2
		```
		
		Where tx0/ty0 = 0, tx1/ty1 = 1, tx2/ty2 = 2 and tx3/ty3 = 3
	**/
	function batchQuad(gameObject:Null<global.phaser.gameobjects.GameObject>, x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float, u0:Float, v0:Float, u1:Float, v1:Float, tintTL:Float, tintTR:Float, tintBL:Float, tintBR:Float, tintEffect:ts.AnyOf2<Float, Bool>, ?texture:js.html.webgl.Texture, ?unit:Float):Bool;
	/**
		Adds the vertices data into the batch and flushes if full.
		
		Assumes 3 vertices in the following arrangement:
		
		```
		0
		|\
		| \
		|  \
		|   \
		|    \
		1-----2
		```
	**/
	function batchTri(gameObject:Null<global.phaser.gameobjects.GameObject>, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float, u0:Float, v0:Float, u1:Float, v1:Float, tintTL:Float, tintTR:Float, tintBL:Float, tintEffect:ts.AnyOf2<Float, Bool>, ?texture:js.html.webgl.Texture, ?unit:Float):Bool;
	/**
		Pushes a filled rectangle into the vertex batch.
		
		The dimensions are run through `Math.floor` before the quad is generated.
		
		Rectangle has no transform values and isn't transformed into the local space.
		
		Used for directly batching untransformed rectangles, such as Camera background colors.
	**/
	function drawFillRect(x:Float, y:Float, width:Float, height:Float, color:Float, alpha:Float, ?texture:js.html.webgl.Texture, ?flipUV:Bool):Void;
	/**
		Sets the texture to be bound to the next available texture unit and returns
		the unit id.
	**/
	function setTexture2D(?texture:js.html.webgl.Texture):Float;
	/**
		Activates the given WebGL Texture and binds it to the requested texture slot.
	**/
	function bindTexture(?target:js.html.webgl.Texture, ?unit:Float):WebGLPipeline;
	/**
		Activates the given Render Target texture and binds it to the
		requested WebGL texture slot.
	**/
	function bindRenderTarget(?target:RenderTarget, ?unit:Float):WebGLPipeline;
	/**
		Sets the current duration into a 1f uniform value based on the given name.
		
		This can be used for mapping time uniform values, such as `iTime`.
	**/
	function setTime(name:String):WebGLPipeline;
	/**
		Sets a 1f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1f(name:String, x:Float, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 2f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2f(name:String, x:Float, y:Float, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 3f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3f(name:String, x:Float, y:Float, z:Float, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 4f uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4f(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 1fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4fv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 1iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 2iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 3iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 4iv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4iv(name:String, arr:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 1i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set1i(name:String, x:Float, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 2i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set2i(name:String, x:Float, y:Float, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 3i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set3i(name:String, x:Float, y:Float, z:Float, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a 4i uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function set4i(name:String, x:Float, y:Float, z:Float, w:Float, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a matrix 2fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix2fv(name:String, transpose:Bool, matrix:ts.AnyOf2<Array<Float>, js.lib.Float32Array>, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a matrix 3fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix3fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:WebGLShader):WebGLPipeline;
	/**
		Sets a matrix 4fv uniform value based on the given name on the currently set shader.
		
		The current shader is bound, before the uniform is set, making it active within the
		WebGLRenderer. This means you can safely call this method from a location such as
		a Scene `create` or `update` method. However, when working within a Shader file
		directly, use the `WebGLShader` method equivalent instead, to avoid the program
		being set.
	**/
	function setMatrix4fv(name:String, transpose:Bool, matrix:js.lib.Float32Array, ?shader:WebGLShader):WebGLPipeline;
	/**
		Destroys all shader instances, removes all object references and nulls all external references.
	**/
	function destroy():WebGLPipeline;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebGLPipeline;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebGLPipeline;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):WebGLPipeline;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebGLPipeline;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):WebGLPipeline;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):WebGLPipeline;
	static var prototype : WebGLPipeline;
}