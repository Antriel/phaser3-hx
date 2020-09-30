package global.phaser.renderer.webgl;

/**
	WebGLPipeline is a class that describes the way elements will be renderered
	in WebGL, specially focused on batching vertices (batching is not provided).
	Pipelines are mostly used for describing 2D rendering passes but it's
	flexible enough to be used for any type of rendering including 3D.
	Internally WebGLPipeline will handle things like compiling shaders,
	creating vertex buffers, assigning primitive topology and binding
	vertex attributes.
	
	The config properties are:
	- game: Current game instance.
	- renderer: Current WebGL renderer.
	- gl: Current WebGL context.
	- topology: This indicates how the primitives are rendered. The default value is GL_TRIANGLES.
	              Here is the full list of rendering primitives (https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Constants).
	- vertShader: Source for vertex shader as a string.
	- fragShader: Source for fragment shader as a string.
	- vertexCapacity: The amount of vertices that shall be allocated
	- vertexSize: The size of a single vertex in bytes.
	- vertices: An optional buffer of vertices
	- attributes: An array describing the vertex attributes
	
	The vertex attributes properties are:
	- name : String - Name of the attribute in the vertex shader
	- size : integer - How many components describe the attribute. For ex: vec3 = size of 3, float = size of 1
	- type : GLenum - WebGL type (gl.BYTE, gl.SHORT, gl.UNSIGNED_BYTE, gl.UNSIGNED_SHORT, gl.FLOAT)
	- normalized : boolean - Is the attribute normalized
	- offset : integer - The offset in bytes to the current attribute in the vertex. Equivalent to offsetof(vertex, attrib) in C
	Here you can find more information of how to describe an attribute:
	- https://developer.mozilla.org/en-US/docs/Web/API/WebGLRenderingContext/vertexAttribPointer
**/
@:native("Phaser.Renderer.WebGL.WebGLPipeline") extern class WebGLPipeline {
	function new(config:Dynamic);
	/**
		Name of the Pipeline. Used for identifying
	**/
	var name : String;
	/**
		The Game which owns this WebGL Pipeline.
	**/
	var game : global.phaser.Game;
	/**
		The canvas which this WebGL Pipeline renders to.
	**/
	var view : js.html.CanvasElement;
	/**
		Used to store the current game resolution
	**/
	var resolution : Float;
	/**
		Width of the current viewport
	**/
	var width : Float;
	/**
		Height of the current viewport
	**/
	var height : Float;
	/**
		The WebGL context this WebGL Pipeline uses.
	**/
	var gl : js.html.webgl.RenderingContext;
	/**
		How many vertices have been fed to the current pipeline.
	**/
	var vertexCount : Float;
	/**
		The limit of vertices that the pipeline can hold
	**/
	var vertexCapacity : Float;
	/**
		The WebGL Renderer which owns this WebGL Pipeline.
	**/
	var renderer : WebGLRenderer;
	/**
		Raw byte buffer of vertices.
	**/
	var vertexData : js.lib.ArrayBuffer;
	/**
		The handle to a WebGL vertex buffer object.
	**/
	var vertexBuffer : js.html.webgl.Buffer;
	/**
		The handle to a WebGL program
	**/
	var program : js.html.webgl.Program;
	/**
		Array of objects that describe the vertex attributes
	**/
	var attributes : Dynamic;
	/**
		The size in bytes of the vertex
	**/
	var vertexSize : Float;
	/**
		The primitive topology which the pipeline will use to submit draw calls
	**/
	var topology : Float;
	/**
		Uint8 view to the vertex raw buffer. Used for uploading vertex buffer resources
		to the GPU.
	**/
	var bytes : js.lib.Uint8Array;
	/**
		This will store the amount of components of 32 bit length
	**/
	var vertexComponentCount : Float;
	/**
		Indicates if the current pipeline is flushing the contents to the GPU.
		When the variable is set the flush function will be locked.
	**/
	var flushLocked : Bool;
	/**
		Indicates if the current pipeline is active or not for this frame only.
		Reset in the onRender method.
	**/
	var active : Bool;
	/**
		Called when the Game has fully booted and the Renderer has finished setting up.
		
		By this stage all Game level systems are now in place and you can perform any final
		tasks that the pipeline may need that relied on game systems such as the Texture Manager.
	**/
	function boot():Void;
	/**
		Adds a description of vertex attribute to the pipeline
	**/
	function addAttribute(name:String, size:Float, type:Float, normalized:Bool, offset:Float):WebGLPipeline;
	/**
		Check if the current batch of vertices is full.
	**/
	function shouldFlush():Bool;
	/**
		Resizes the properties used to describe the viewport
	**/
	function resize(width:Float, height:Float, resolution:Float):WebGLPipeline;
	/**
		Binds the pipeline resources, including programs, vertex buffers and binds attributes
	**/
	function bind():WebGLPipeline;
	/**
		Set whenever this WebGL Pipeline is bound to a WebGL Renderer.
		
		This method is called every time the WebGL Pipeline is attempted to be bound, even if it already is the current pipeline.
	**/
	function onBind():WebGLPipeline;
	/**
		Called before each frame is rendered, but after the canvas has been cleared.
	**/
	function onPreRender():WebGLPipeline;
	/**
		Called before a Scene's Camera is rendered.
	**/
	function onRender(scene:global.phaser.Scene, camera:global.phaser.cameras.scene2d.Camera):WebGLPipeline;
	/**
		Called after each frame has been completely rendered and snapshots have been taken.
	**/
	function onPostRender():WebGLPipeline;
	/**
		Uploads the vertex data and emits a draw call
		for the current batch of vertices.
	**/
	function flush():WebGLPipeline;
	/**
		Removes all object references in this WebGL Pipeline and removes its program from the WebGL context.
	**/
	function destroy():WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat1(name:String, x:Float):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat2(name:String, x:Float, y:Float):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat3(name:String, x:Float, y:Float, z:Float):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat4(name:String, x:Float, y:Float, z:Float, w:Float):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat1v(name:String, arr:js.lib.Float32Array):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat2v(name:String, arr:js.lib.Float32Array):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat3v(name:String, arr:js.lib.Float32Array):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat4v(name:String, arr:js.lib.Float32Array):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt1(name:String, x:Float):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt2(name:String, x:Float, y:Float):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt3(name:String, x:Float, y:Float, z:Float):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt4(name:String, x:Float, y:Float, z:Float, w:Float):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix2(name:String, transpose:Bool, matrix:js.lib.Float32Array):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix3(name:String, transpose:Bool, matrix:js.lib.Float32Array):WebGLPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix4(name:String, transpose:Bool, matrix:js.lib.Float32Array):WebGLPipeline;
	static var prototype : WebGLPipeline;
}