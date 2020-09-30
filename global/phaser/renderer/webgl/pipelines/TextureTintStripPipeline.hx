package global.phaser.renderer.webgl.pipelines;

/**
	TextureTintStripPipeline implements the rendering infrastructure
	for displaying textured objects
	The config properties are:
	- game: Current game instance.
	- renderer: Current WebGL renderer.
	- vertShader: Source for vertex shader as a string.
	- fragShader: Source for fragment shader as a string.
	- vertexCapacity: The amount of vertices that shall be allocated
	- vertexSize: The size of a single vertex in bytes.
**/
@:native("Phaser.Renderer.WebGL.Pipelines.TextureTintStripPipeline") extern class TextureTintStripPipeline extends global.phaser.renderer.webgl.WebGLPipeline {
	function new(config:Dynamic);
	/**
		Float32 view of the array buffer containing the pipeline's vertices.
	**/
	var vertexViewF32 : js.lib.Float32Array;
	/**
		Uint32 view of the array buffer containing the pipeline's vertices.
	**/
	var vertexViewU32 : js.lib.Uint32Array;
	/**
		Size of the batch.
	**/
	var maxQuads : Float;
	/**
		Collection of batch information
	**/
	var batches : Array<Dynamic>;
	/**
		Called every time the pipeline needs to be used.
		It binds all necessary resources.
	**/
	function onBind():TextureTintStripPipeline;
	/**
		Resizes this pipeline and updates the projection.
	**/
	function resize(width:Float, height:Float, resolution:Float):TextureTintStripPipeline;
	/**
		Assigns a texture to the current batch. If a different texture is already set it creates a new batch object.
	**/
	function setTexture2D(?texture:js.html.webgl.Texture, ?unit:Float):TextureTintStripPipeline;
	/**
		Checks if the current batch has the same texture and texture unit, or if we need to create a new batch.
	**/
	function requireTextureBatch(texture:js.html.webgl.Texture, unit:Float):Bool;
	/**
		Creates a new batch object and pushes it to a batch array.
		The batch object contains information relevant to the current 
		vertex batch like the offset in the vertex buffer, vertex count and 
		the textures used by that batch.
	**/
	function pushBatch(texture:js.html.webgl.Texture, unit:Float):Void;
	/**
		Uploads the vertex data and emits a draw call for the current batch of vertices.
	**/
	function flush():TextureTintStripPipeline;
	/**
		Adds a description of vertex attribute to the pipeline
	**/
	function addAttribute(name:String, size:Float, type:Float, normalized:Bool, offset:Float):TextureTintStripPipeline;
	/**
		Binds the pipeline resources, including programs, vertex buffers and binds attributes
	**/
	function bind():TextureTintStripPipeline;
	/**
		Called before each frame is rendered, but after the canvas has been cleared.
	**/
	function onPreRender():TextureTintStripPipeline;
	/**
		Called before a Scene's Camera is rendered.
	**/
	function onRender(scene:global.phaser.Scene, camera:global.phaser.cameras.scene2d.Camera):TextureTintStripPipeline;
	/**
		Called after each frame has been completely rendered and snapshots have been taken.
	**/
	function onPostRender():TextureTintStripPipeline;
	/**
		Removes all object references in this WebGL Pipeline and removes its program from the WebGL context.
	**/
	function destroy():TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat1(name:String, x:Float):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat2(name:String, x:Float, y:Float):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat3(name:String, x:Float, y:Float, z:Float):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat4(name:String, x:Float, y:Float, z:Float, w:Float):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat1v(name:String, arr:js.lib.Float32Array):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat2v(name:String, arr:js.lib.Float32Array):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat3v(name:String, arr:js.lib.Float32Array):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat4v(name:String, arr:js.lib.Float32Array):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt1(name:String, x:Float):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt2(name:String, x:Float, y:Float):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt3(name:String, x:Float, y:Float, z:Float):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt4(name:String, x:Float, y:Float, z:Float, w:Float):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix2(name:String, transpose:Bool, matrix:js.lib.Float32Array):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix3(name:String, transpose:Bool, matrix:js.lib.Float32Array):TextureTintStripPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix4(name:String, transpose:Bool, matrix:js.lib.Float32Array):TextureTintStripPipeline;
	static var prototype : TextureTintStripPipeline;
}