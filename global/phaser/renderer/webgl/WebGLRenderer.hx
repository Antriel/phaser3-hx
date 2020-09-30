package global.phaser.renderer.webgl;

/**
	WebGLRenderer is a class that contains the needed functionality to keep the
	WebGLRenderingContext state clean. The main idea of the WebGLRenderer is to keep track of
	any context change that happens for WebGL rendering inside of Phaser. This means
	if raw webgl functions are called outside the WebGLRenderer of the Phaser WebGL
	rendering ecosystem they might pollute the current WebGLRenderingContext state producing
	unexpected behavior. It's recommended that WebGL interaction is done through
	WebGLRenderer and/or WebGLPipeline.
**/
@:native("Phaser.Renderer.WebGL.WebGLRenderer") extern class WebGLRenderer {
	function new(game:global.phaser.Game);
	/**
		The local configuration settings of this WebGL Renderer.
	**/
	var config : Dynamic;
	/**
		The Game instance which owns this WebGL Renderer.
	**/
	var game : global.phaser.Game;
	/**
		A constant which allows the renderer to be easily identified as a WebGL Renderer.
	**/
	var type : Float;
	/**
		The width of the canvas being rendered to.
		This is populated in the onResize event handler.
	**/
	var width : Float;
	/**
		The height of the canvas being rendered to.
		This is populated in the onResize event handler.
	**/
	var height : Float;
	/**
		The canvas which this WebGL Renderer draws to.
	**/
	var canvas : js.html.CanvasElement;
	/**
		An array of blend modes supported by the WebGL Renderer.
		
		This array includes the default blend modes as well as any custom blend modes added through {@link #addBlendMode}.
	**/
	var blendModes : Array<Dynamic>;
	/**
		Keeps track of any WebGLTexture created with the current WebGLRenderingContext
	**/
	var nativeTextures : Array<Dynamic>;
	/**
		This property is set to `true` if the WebGL context of the renderer is lost.
	**/
	var contextLost : Bool;
	/**
		This object will store all pipelines created through addPipeline
	**/
	var pipelines : Dynamic;
	/**
		Details about the currently scheduled snapshot.
		
		If a non-null `callback` is set in this object, a snapshot of the canvas will be taken after the current frame is fully rendered.
	**/
	var snapshotState : global.phaser.types.renderer.snapshot.SnapshotState;
	/**
		Cached value for the last texture unit that was used
	**/
	var currentActiveTextureUnit : Float;
	/**
		An array of the last texture handles that were bound to the WebGLRenderingContext
	**/
	var currentTextures : Array<Dynamic>;
	/**
		Current framebuffer in use
	**/
	var currentFramebuffer : js.html.webgl.Framebuffer;
	/**
		Current WebGLPipeline in use
	**/
	var currentPipeline : WebGLPipeline;
	/**
		Current WebGLProgram in use
	**/
	var currentProgram : js.html.webgl.Program;
	/**
		Current WebGLBuffer (Vertex buffer) in use
	**/
	var currentVertexBuffer : js.html.webgl.Buffer;
	/**
		Current WebGLBuffer (Index buffer) in use
	**/
	var currentIndexBuffer : js.html.webgl.Buffer;
	/**
		Current blend mode in use
	**/
	var currentBlendMode : Float;
	/**
		Indicates if the the scissor state is enabled in WebGLRenderingContext
	**/
	var currentScissorEnabled : Bool;
	/**
		Stores the current scissor data
	**/
	var currentScissor : js.lib.Uint32Array;
	/**
		Stack of scissor data
	**/
	var scissorStack : js.lib.Uint32Array;
	/**
		The handler to invoke when the context is lost.
		This should not be changed and is set in the boot method.
	**/
	var contextLostHandler : haxe.Constraints.Function;
	/**
		The handler to invoke when the context is restored.
		This should not be changed and is set in the boot method.
	**/
	var contextRestoredHandler : haxe.Constraints.Function;
	/**
		The underlying WebGL context of the renderer.
	**/
	var gl : js.html.webgl.RenderingContext;
	/**
		Array of strings that indicate which WebGL extensions are supported by the browser
	**/
	var supportedExtensions : Dynamic;
	/**
		Extensions loaded into the current context
	**/
	var extensions : Dynamic;
	/**
		Stores the current WebGL component formats for further use
	**/
	var glFormats : Array<Dynamic>;
	/**
		Stores the supported WebGL texture compression formats.
	**/
	var compression : Array<Dynamic>;
	/**
		Cached drawing buffer height to reduce gl calls.
	**/
	final drawingBufferHeight : Float;
	/**
		A blank 32x32 transparent texture, as used by the Graphics system where needed.
		This is set in the `boot` method.
	**/
	final blankTexture : js.html.webgl.Texture;
	/**
		A default Camera used in calls when no other camera has been provided.
	**/
	var defaultCamera : global.phaser.cameras.scene2d.BaseCamera;
	/**
		The total number of masks currently stacked.
	**/
	var maskCount : Float;
	/**
		The mask stack.
	**/
	var maskStack : Array<global.phaser.display.masks.GeometryMask>;
	/**
		Internal property that tracks the currently set mask.
	**/
	var currentMask : Dynamic;
	/**
		Internal property that tracks the currently set camera mask.
	**/
	var currentCameraMask : Dynamic;
	/**
		Internal gl function mapping for uniform look-up.
		https://developer.mozilla.org/en-US/docs/Web/API/WebGLRenderingContext/uniform
	**/
	var glFuncMap : Dynamic;
	/**
		The `type` of the Game Object being currently rendered.
		This can be used by advanced render functions for batching look-ahead.
	**/
	var currentType : String;
	/**
		Is the `type` of the Game Object being currently rendered different than the
		type of the object before it in the display list? I.e. it's a 'new' type.
	**/
	var newType : Bool;
	/**
		Does the `type` of the next Game Object in the display list match that
		of the object being currently rendered?
	**/
	var nextTypeMatch : Bool;
	/**
		The mipmap magFilter to be used when creating textures.
		
		You can specify this as a string in the game config, i.e.:
		
		`renderer: { mipmapFilter: 'NEAREST_MIPMAP_LINEAR' }`
		
		The 6 options for WebGL1 are, in order from least to most computationally expensive:
		
		NEAREST (for pixel art)
		LINEAR (the default)
		NEAREST_MIPMAP_NEAREST
		LINEAR_MIPMAP_NEAREST
		NEAREST_MIPMAP_LINEAR
		LINEAR_MIPMAP_LINEAR
		
		Mipmaps only work with textures that are fully power-of-two in size.
		
		For more details see https://webglfundamentals.org/webgl/lessons/webgl-3d-textures.html
	**/
	var mipmapFilter : Float;
	/**
		Creates a new WebGLRenderingContext and initializes all internal state.
	**/
	function init(config:Dynamic):WebGLRenderer;
	/**
		The event handler that manages the `resize` event dispatched by the Scale Manager.
	**/
	function onResize(gameSize:global.phaser.structs.Size, baseSize:global.phaser.structs.Size, displaySize:global.phaser.structs.Size, ?resolution:Float):Void;
	/**
		Resizes the drawing buffer to match that required by the Scale Manager.
	**/
	function resize(?width:Float, ?height:Float, ?resolution:Float):WebGLRenderer;
	/**
		Checks if a WebGL extension is supported
	**/
	function hasExtension(extensionName:String):Bool;
	/**
		Loads a WebGL extension
	**/
	function getExtension(extensionName:String):Dynamic;
	/**
		Flushes the current pipeline if the pipeline is bound
	**/
	function flush():Void;
	/**
		Checks if a pipeline is present in the current WebGLRenderer
	**/
	function hasPipeline(pipelineName:String):Bool;
	/**
		Returns the pipeline by name if the pipeline exists
	**/
	function getPipeline(pipelineName:String):WebGLPipeline;
	/**
		Removes a pipeline by name.
	**/
	function removePipeline(pipelineName:String):WebGLRenderer;
	/**
		Adds a pipeline instance into the collection of pipelines
	**/
	function addPipeline(pipelineName:String, pipelineInstance:WebGLPipeline):WebGLPipeline;
	/**
		Pushes a new scissor state. This is used to set nested scissor states.
	**/
	function pushScissor(x:Float, y:Float, width:Float, height:Float, ?drawingBufferHeight:Float):Array<Float>;
	/**
		Sets the current scissor state.
	**/
	function setScissor(x:Float, y:Float, width:Float, height:Float, ?drawingBufferHeight:Float):Void;
	/**
		Pops the last scissor state and sets it.
	**/
	function popScissor():Void;
	/**
		Binds a WebGLPipeline and sets it as the current pipeline to be used.
	**/
	function setPipeline(pipelineInstance:WebGLPipeline, ?gameObject:global.phaser.gameobjects.GameObject):WebGLPipeline;
	/**
		Is there an active stencil mask?
	**/
	function hasActiveStencilMask():Bool;
	/**
		Use this to reset the gl context to the state that Phaser requires to continue rendering.
		Calling this will:
		
		* Disable `DEPTH_TEST`, `CULL_FACE` and `STENCIL_TEST`.
		* Clear the depth buffer and stencil buffers.
		* Reset the viewport size.
		* Reset the blend mode.
		* Bind a blank texture as the active texture on texture unit zero.
		* Rebinds the given pipeline instance.
		
		You should call this having previously called `clearPipeline` and then wishing to return
		control to Phaser again.
	**/
	function rebindPipeline(pipelineInstance:WebGLPipeline):Void;
	/**
		Flushes the current WebGLPipeline being used and then clears it, along with the
		the current shader program and vertex buffer. Then resets the blend mode to NORMAL.
		Call this before jumping to your own gl context handler, and then call `rebindPipeline` when
		you wish to return control to Phaser again.
	**/
	function clearPipeline():Void;
	/**
		Sets the blend mode to the value given.
		
		If the current blend mode is different from the one given, the pipeline is flushed and the new
		blend mode is enabled.
	**/
	function setBlendMode(blendModeId:Float, ?force:Bool):Bool;
	/**
		Creates a new custom blend mode for the renderer.
		
		See https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Constants#Blending_modes
	**/
	function addBlendMode(func:Array<Float>, equation:Float):Float;
	/**
		Updates the function bound to a given custom blend mode.
	**/
	function updateBlendMode(index:Float, func:haxe.Constraints.Function, equation:haxe.Constraints.Function):WebGLRenderer;
	/**
		Removes a custom blend mode from the renderer.
		Any Game Objects still using this blend mode will error, so be sure to clear them first.
	**/
	function removeBlendMode(index:Float):WebGLRenderer;
	/**
		Binds a texture at a texture unit. If a texture is already
		bound to that unit it will force a flush on the current pipeline.
	**/
	function setTexture2D(texture:js.html.webgl.Texture, textureUnit:Float, ?flush:Bool):WebGLRenderer;
	/**
		Binds a framebuffer. If there was another framebuffer already bound it will force a pipeline flush.
	**/
	function setFramebuffer(framebuffer:js.html.webgl.Framebuffer, ?updateScissor:Bool):WebGLRenderer;
	/**
		Binds a program. If there was another program already bound it will force a pipeline flush.
	**/
	function setProgram(program:js.html.webgl.Program):WebGLRenderer;
	/**
		Bounds a vertex buffer. If there is a vertex buffer already bound it'll force a pipeline flush.
	**/
	function setVertexBuffer(vertexBuffer:js.html.webgl.Buffer):WebGLRenderer;
	/**
		Bounds a index buffer. If there is a index buffer already bound it'll force a pipeline flush.
	**/
	function setIndexBuffer(indexBuffer:js.html.webgl.Buffer):WebGLRenderer;
	/**
		Creates a texture from an image source. If the source is not valid it creates an empty texture.
	**/
	function createTextureFromSource(source:Dynamic, width:Float, height:Float, scaleMode:Float):js.html.webgl.Texture;
	/**
		A wrapper for creating a WebGLTexture. If no pixel data is passed it will create an empty texture.
	**/
	function createTexture2D(mipLevel:Float, minFilter:Float, magFilter:Float, wrapT:Float, wrapS:Float, format:Float, pixels:Dynamic, width:Float, height:Float, ?pma:Bool, ?forceSize:Bool, ?flipY:Bool):js.html.webgl.Texture;
	/**
		Wrapper for creating WebGLFramebuffer.
	**/
	function createFramebuffer(width:Float, height:Float, renderTexture:js.html.webgl.Texture, addDepthStencilBuffer:Bool):js.html.webgl.Framebuffer;
	/**
		Wrapper for creating a WebGLProgram
	**/
	function createProgram(vertexShader:String, fragmentShader:String):js.html.webgl.Program;
	/**
		Wrapper for creating a vertex buffer.
	**/
	function createVertexBuffer(initialDataOrSize:js.lib.ArrayBuffer, bufferUsage:Float):js.html.webgl.Buffer;
	/**
		Wrapper for creating a vertex buffer.
	**/
	function createIndexBuffer(initialDataOrSize:js.lib.ArrayBuffer, bufferUsage:Float):js.html.webgl.Buffer;
	/**
		Removes the given texture from the nativeTextures array and then deletes it from the GPU.
	**/
	function deleteTexture(texture:js.html.webgl.Texture):WebGLRenderer;
	/**
		Deletes a WebGLFramebuffer from the GL instance.
	**/
	function deleteFramebuffer(framebuffer:js.html.webgl.Framebuffer):WebGLRenderer;
	/**
		Deletes a WebGLProgram from the GL instance.
	**/
	function deleteProgram(program:js.html.webgl.Program):WebGLRenderer;
	/**
		Deletes a WebGLBuffer from the GL instance.
	**/
	function deleteBuffer(vertexBuffer:js.html.webgl.Buffer):WebGLRenderer;
	/**
		Controls the pre-render operations for the given camera.
		Handles any clipping needed by the camera and renders the background color if a color is visible.
	**/
	function preRenderCamera(camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		Controls the post-render operations for the given camera.
		Renders the foreground camera effects like flash and fading. It resets the current scissor state.
	**/
	function postRenderCamera(camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		Clears the current vertex buffer and updates pipelines.
	**/
	function preRender():Void;
	/**
		The core render step for a Scene Camera.
		
		Iterates through the given Game Object's array and renders them with the given Camera.
		
		This is called by the `CameraManager.render` method. The Camera Manager instance belongs to a Scene, and is invoked
		by the Scene Systems.render method.
		
		This method is not called if `Camera.visible` is `false`, or `Camera.alpha` is zero.
	**/
	function render(scene:global.phaser.Scene, children:global.phaser.gameobjects.GameObject, interpolationPercentage:Float, camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		The post-render step happens after all Cameras in all Scenes have been rendered.
	**/
	function postRender():Void;
	/**
		Schedules a snapshot of the entire game viewport to be taken after the current frame is rendered.
		
		To capture a specific area see the `snapshotArea` method. To capture a specific pixel, see `snapshotPixel`.
		
		Only one snapshot can be active _per frame_. If you have already called `snapshotPixel`, for example, then
		calling this method will override it.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer into an ArrayBufferView.
		It then parses this, copying the contents to a temporary Canvas and finally creating an Image object from it,
		which is the image returned to the callback provided. All in all, this is a computationally expensive and blocking process,
		which gets more expensive the larger the canvas size gets, so please be careful how you employ this in your game.
	**/
	function snapshot(callback:global.phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):WebGLRenderer;
	/**
		Schedules a snapshot of the given area of the game viewport to be taken after the current frame is rendered.
		
		To capture the whole game viewport see the `snapshot` method. To capture a specific pixel, see `snapshotPixel`.
		
		Only one snapshot can be active _per frame_. If you have already called `snapshotPixel`, for example, then
		calling this method will override it.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer into an ArrayBufferView.
		It then parses this, copying the contents to a temporary Canvas and finally creating an Image object from it,
		which is the image returned to the callback provided. All in all, this is a computationally expensive and blocking process,
		which gets more expensive the larger the canvas size gets, so please be careful how you employ this in your game.
	**/
	function snapshotArea(x:Float, y:Float, width:Float, height:Float, callback:global.phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):WebGLRenderer;
	/**
		Schedules a snapshot of the given pixel from the game viewport to be taken after the current frame is rendered.
		
		To capture the whole game viewport see the `snapshot` method. To capture a specific area, see `snapshotArea`.
		
		Only one snapshot can be active _per frame_. If you have already called `snapshotArea`, for example, then
		calling this method will override it.
		
		Unlike the other two snapshot methods, this one will return a `Color` object containing the color data for
		the requested pixel. It doesn't need to create an internal Canvas or Image object, so is a lot faster to execute,
		using less memory.
	**/
	function snapshotPixel(x:Float, y:Float, callback:global.phaser.types.renderer.snapshot.SnapshotCallback):WebGLRenderer;
	/**
		Takes a snapshot of the given area of the given frame buffer.
		
		Unlike the other snapshot methods, this one is processed immediately and doesn't wait for the next render.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer into an ArrayBufferView.
		It then parses this, copying the contents to a temporary Canvas and finally creating an Image object from it,
		which is the image returned to the callback provided. All in all, this is a computationally expensive and blocking process,
		which gets more expensive the larger the canvas size gets, so please be careful how you employ this in your game.
	**/
	function snapshotFramebuffer(framebuffer:js.html.webgl.Framebuffer, bufferWidth:Float, bufferHeight:Float, callback:global.phaser.types.renderer.snapshot.SnapshotCallback, ?getPixel:Bool, ?x:Float, ?y:Float, ?width:Float, ?height:Float, ?type:String, ?encoderOptions:Float):WebGLRenderer;
	/**
		Creates a new WebGL Texture based on the given Canvas Element.
		
		If the `dstTexture` parameter is given, the WebGL Texture is updated, rather than created fresh.
	**/
	function canvasToTexture(srcCanvas:js.html.CanvasElement, ?dstTexture:js.html.webgl.Texture, ?noRepeat:Bool, ?flipY:Bool):js.html.webgl.Texture;
	/**
		Creates a new WebGL Texture based on the given Canvas Element.
	**/
	function createCanvasTexture(srcCanvas:js.html.CanvasElement, ?noRepeat:Bool, ?flipY:Bool):js.html.webgl.Texture;
	/**
		Updates a WebGL Texture based on the given Canvas Element.
	**/
	function updateCanvasTexture(srcCanvas:js.html.CanvasElement, dstTexture:js.html.webgl.Texture, ?flipY:Bool):js.html.webgl.Texture;
	/**
		Creates a new WebGL Texture based on the given HTML Video Element.
	**/
	function createVideoTexture(srcVideo:js.html.VideoElement, ?noRepeat:Bool, ?flipY:Bool):js.html.webgl.Texture;
	/**
		Updates a WebGL Texture based on the given HTML Video Element.
	**/
	function updateVideoTexture(srcVideo:js.html.VideoElement, dstTexture:js.html.webgl.Texture, ?flipY:Bool):js.html.webgl.Texture;
	/**
		Sets the minification and magnification filter for a texture.
	**/
	function setTextureFilter(texture:Float, filter:Float):WebGLRenderer;
	/**
		Sets a 1f uniform value on the given shader.
		
		If the shader is not currently active, it is made active first.
	**/
	function setFloat1(program:js.html.webgl.Program, name:String, x:Float):WebGLRenderer;
	/**
		Sets the 2f uniform values on the given shader.
		
		If the shader is not currently active, it is made active first.
	**/
	function setFloat2(program:js.html.webgl.Program, name:String, x:Float, y:Float):WebGLRenderer;
	/**
		Sets the 3f uniform values on the given shader.
		
		If the shader is not currently active, it is made active first.
	**/
	function setFloat3(program:js.html.webgl.Program, name:String, x:Float, y:Float, z:Float):WebGLRenderer;
	/**
		Sets the 4f uniform values on the given shader.
		
		If the shader is not currently active, it is made active first.
	**/
	function setFloat4(program:js.html.webgl.Program, name:String, x:Float, y:Float, z:Float, w:Float):WebGLRenderer;
	/**
		Sets the value of a 1fv uniform variable in the given WebGLProgram.
		
		If the shader is not currently active, it is made active first.
	**/
	function setFloat1v(program:js.html.webgl.Program, name:String, arr:js.lib.Float32Array):WebGLRenderer;
	/**
		Sets the value of a 2fv uniform variable in the given WebGLProgram.
		
		If the shader is not currently active, it is made active first.
	**/
	function setFloat2v(program:js.html.webgl.Program, name:String, arr:js.lib.Float32Array):WebGLRenderer;
	/**
		Sets the value of a 3fv uniform variable in the given WebGLProgram.
		
		If the shader is not currently active, it is made active first.
	**/
	function setFloat3v(program:js.html.webgl.Program, name:String, arr:js.lib.Float32Array):WebGLRenderer;
	/**
		Sets the value of a 4fv uniform variable in the given WebGLProgram.
		
		If the shader is not currently active, it is made active first.
	**/
	function setFloat4v(program:js.html.webgl.Program, name:String, arr:js.lib.Float32Array):WebGLRenderer;
	/**
		Sets a 1i uniform value on the given shader.
		
		If the shader is not currently active, it is made active first.
	**/
	function setInt1(program:js.html.webgl.Program, name:String, x:Float):WebGLRenderer;
	/**
		Sets the 2i uniform values on the given shader.
		
		If the shader is not currently active, it is made active first.
	**/
	function setInt2(program:js.html.webgl.Program, name:String, x:Float, y:Float):WebGLRenderer;
	/**
		Sets the 3i uniform values on the given shader.
		
		If the shader is not currently active, it is made active first.
	**/
	function setInt3(program:js.html.webgl.Program, name:String, x:Float, y:Float, z:Float):WebGLRenderer;
	/**
		Sets the 4i uniform values on the given shader.
		
		If the shader is not currently active, it is made active first.
	**/
	function setInt4(program:js.html.webgl.Program, name:String, x:Float, y:Float, z:Float, w:Float):WebGLRenderer;
	/**
		Sets the value of a matrix 2fv uniform variable in the given WebGLProgram.
		
		If the shader is not currently active, it is made active first.
	**/
	function setMatrix2(program:js.html.webgl.Program, name:String, transpose:Bool, matrix:js.lib.Float32Array):WebGLRenderer;
	/**
		Sets the value of a matrix 3fv uniform variable in the given WebGLProgram.
		
		If the shader is not currently active, it is made active first.
	**/
	function setMatrix3(program:js.html.webgl.Program, name:String, transpose:Bool, matrix:js.lib.Float32Array):WebGLRenderer;
	/**
		Sets the value of a matrix 4fv uniform variable in the given WebGLProgram.
		
		If the shader is not currently active, it is made active first.
	**/
	function setMatrix4(program:js.html.webgl.Program, name:String, transpose:Bool, matrix:js.lib.Float32Array):WebGLRenderer;
	/**
		Returns the maximum number of texture units that can be used in a fragment shader.
	**/
	function getMaxTextures():Float;
	/**
		Returns the largest texture size (either width or height) that can be created.
		Note that VRAM may not allow a texture of any given size, it just expresses
		hardware / driver support for a given size.
	**/
	function getMaxTextureSize():Float;
	/**
		Destroy this WebGLRenderer, cleaning up all related resources such as pipelines, native textures, etc.
	**/
	function destroy():Void;
	static var prototype : WebGLRenderer;
}