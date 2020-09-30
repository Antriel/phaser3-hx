package global.phaser.renderer.webgl.pipelines;

/**
	BitmapMaskPipeline handles all bitmap masking rendering in WebGL. It works by using 
	sampling two texture on the fragment shader and using the fragment's alpha to clip the region.
	The config properties are:
	- game: Current game instance.
	- renderer: Current WebGL renderer.
	- topology: This indicates how the primitives are rendered. The default value is GL_TRIANGLES.
	              Here is the full list of rendering primitives (https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Constants).
	- vertShader: Source for vertex shader as a string.
	- fragShader: Source for fragment shader as a string.
	- vertexCapacity: The amount of vertices that shall be allocated
	- vertexSize: The size of a single vertex in bytes.
**/
@:native("Phaser.Renderer.WebGL.Pipelines.BitmapMaskPipeline") extern class BitmapMaskPipeline extends global.phaser.renderer.webgl.WebGLPipeline {
	function new(config:Dynamic);
	/**
		Float32 view of the array buffer containing the pipeline's vertices.
	**/
	var vertexViewF32 : js.lib.Float32Array;
	/**
		Size of the batch.
	**/
	var maxQuads : Float;
	/**
		Dirty flag to check if resolution properties need to be updated on the 
		masking shader.
	**/
	var resolutionDirty : Bool;
	/**
		Called every time the pipeline needs to be used.
		It binds all necessary resources.
	**/
	function onBind():BitmapMaskPipeline;
	/**
		Resizes this pipeline and updates the projection.
	**/
	function resize(width:Float, height:Float, resolution:Float):BitmapMaskPipeline;
	/**
		Binds necessary resources and renders the mask to a separated framebuffer.
		The framebuffer for the masked object is also bound for further use.
	**/
	function beginMask(mask:global.phaser.gameobjects.GameObject, maskedObject:global.phaser.gameobjects.GameObject, camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		The masked game objects framebuffer is unbound and its texture 
		is bound together with the mask texture and the mask shader and 
		a draw call with a single quad is processed. Here is where the
		masking effect is applied.
	**/
	function endMask(mask:global.phaser.gameobjects.GameObject):Void;
	/**
		Adds a description of vertex attribute to the pipeline
	**/
	function addAttribute(name:String, size:Float, type:Float, normalized:Bool, offset:Float):BitmapMaskPipeline;
	/**
		Binds the pipeline resources, including programs, vertex buffers and binds attributes
	**/
	function bind():BitmapMaskPipeline;
	/**
		Called before each frame is rendered, but after the canvas has been cleared.
	**/
	function onPreRender():BitmapMaskPipeline;
	/**
		Called before a Scene's Camera is rendered.
	**/
	function onRender(scene:global.phaser.Scene, camera:global.phaser.cameras.scene2d.Camera):BitmapMaskPipeline;
	/**
		Called after each frame has been completely rendered and snapshots have been taken.
	**/
	function onPostRender():BitmapMaskPipeline;
	/**
		Uploads the vertex data and emits a draw call
		for the current batch of vertices.
	**/
	function flush():BitmapMaskPipeline;
	/**
		Removes all object references in this WebGL Pipeline and removes its program from the WebGL context.
	**/
	function destroy():BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat1(name:String, x:Float):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat2(name:String, x:Float, y:Float):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat3(name:String, x:Float, y:Float, z:Float):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat4(name:String, x:Float, y:Float, z:Float, w:Float):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat1v(name:String, arr:js.lib.Float32Array):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat2v(name:String, arr:js.lib.Float32Array):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat3v(name:String, arr:js.lib.Float32Array):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat4v(name:String, arr:js.lib.Float32Array):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt1(name:String, x:Float):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt2(name:String, x:Float, y:Float):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt3(name:String, x:Float, y:Float, z:Float):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt4(name:String, x:Float, y:Float, z:Float, w:Float):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix2(name:String, transpose:Bool, matrix:js.lib.Float32Array):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix3(name:String, transpose:Bool, matrix:js.lib.Float32Array):BitmapMaskPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix4(name:String, transpose:Bool, matrix:js.lib.Float32Array):BitmapMaskPipeline;
	static var prototype : BitmapMaskPipeline;
}