package global.phaser.renderer.webgl.pipelines;

/**
	TextureTintPipeline implements the rendering infrastructure
	for displaying textured objects
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
@:native("Phaser.Renderer.WebGL.Pipelines.TextureTintPipeline") extern class TextureTintPipeline extends global.phaser.renderer.webgl.WebGLPipeline {
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
	function onBind():TextureTintPipeline;
	/**
		Resizes this pipeline and updates the projection.
	**/
	function resize(width:Float, height:Float, resolution:Float):TextureTintPipeline;
	/**
		Assigns a texture to the current batch. If a different texture is already set it creates a new batch object.
	**/
	function setTexture2D(?texture:js.html.webgl.Texture, ?unit:Float):TextureTintPipeline;
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
	function flush():TextureTintPipeline;
	/**
		Takes a Sprite Game Object, or any object that extends it, and adds it to the batch.
	**/
	function batchSprite(sprite:ts.AnyOf2<global.phaser.gameobjects.Sprite, global.phaser.gameobjects.Image>, camera:global.phaser.cameras.scene2d.Camera, ?parentTransformMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
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
	function batchQuad(x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float, u0:Float, v0:Float, u1:Float, v1:Float, tintTL:Float, tintTR:Float, tintBL:Float, tintBR:Float, tintEffect:ts.AnyOf2<Float, Bool>, ?texture:js.html.webgl.Texture, ?unit:Float):Bool;
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
	function batchTri(x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float, u0:Float, v0:Float, u1:Float, v1:Float, tintTL:Float, tintTR:Float, tintBL:Float, tintEffect:ts.AnyOf2<Float, Bool>, ?texture:js.html.webgl.Texture, ?unit:Float):Bool;
	/**
		Generic function for batching a textured quad using argument values instead of a Game Object.
	**/
	function batchTexture(gameObject:global.phaser.gameobjects.GameObject, texture:js.html.webgl.Texture, textureWidth:Float, textureHeight:Float, srcX:Float, srcY:Float, srcWidth:Float, srcHeight:Float, scaleX:Float, scaleY:Float, rotation:Float, flipX:Bool, flipY:Bool, scrollFactorX:Float, scrollFactorY:Float, displayOriginX:Float, displayOriginY:Float, frameX:Float, frameY:Float, frameWidth:Float, frameHeight:Float, tintTL:Float, tintTR:Float, tintBL:Float, tintBR:Float, tintEffect:Float, uOffset:Float, vOffset:Float, camera:global.phaser.cameras.scene2d.Camera, parentTransformMatrix:global.phaser.gameobjects.components.TransformMatrix, ?skipFlip:Bool):Void;
	/**
		Adds a Texture Frame into the batch for rendering.
	**/
	function batchTextureFrame(frame:global.phaser.textures.Frame, x:Float, y:Float, tint:Float, alpha:Float, transformMatrix:global.phaser.gameobjects.components.TransformMatrix, ?parentTransformMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Pushes a filled rectangle into the vertex batch.
		Rectangle has no transform values and isn't transformed into the local space.
		Used for directly batching untransformed rectangles, such as Camera background colors.
	**/
	function drawFillRect(x:Float, y:Float, width:Float, height:Float, color:Float, alpha:Float):Void;
	/**
		Pushes a filled rectangle into the vertex batch.
		Rectangle factors in the given transform matrices before adding to the batch.
	**/
	function batchFillRect(x:Float, y:Float, width:Float, height:Float, currentMatrix:global.phaser.gameobjects.components.TransformMatrix, parentMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Pushes a filled triangle into the vertex batch.
		Triangle factors in the given transform matrices before adding to the batch.
	**/
	function batchFillTriangle(x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float, currentMatrix:global.phaser.gameobjects.components.TransformMatrix, parentMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Pushes a stroked triangle into the vertex batch.
		Triangle factors in the given transform matrices before adding to the batch.
		The triangle is created from 3 lines and drawn using the `batchStrokePath` method.
	**/
	function batchStrokeTriangle(x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float, lineWidth:Float, currentMatrix:global.phaser.gameobjects.components.TransformMatrix, parentMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Adds the given path to the vertex batch for rendering.
		
		It works by taking the array of path data and then passing it through Earcut, which
		creates a list of polygons. Each polygon is then added to the batch.
		
		The path is always automatically closed because it's filled.
	**/
	function batchFillPath(path:Array<Dynamic>, currentMatrix:global.phaser.gameobjects.components.TransformMatrix, parentMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Adds the given path to the vertex batch for rendering.
		
		It works by taking the array of path data and calling `batchLine` for each section
		of the path.
		
		The path is optionally closed at the end.
	**/
	function batchStrokePath(path:Array<Dynamic>, lineWidth:Float, pathOpen:Bool, currentMatrix:global.phaser.gameobjects.components.TransformMatrix, parentMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Creates a quad and adds it to the vertex batch based on the given line values.
	**/
	function batchLine(ax:Float, ay:Float, bx:Float, by:Float, aLineWidth:Float, bLineWidth:Float, currentMatrix:js.lib.Float32Array):Void;
	/**
		Adds a description of vertex attribute to the pipeline
	**/
	function addAttribute(name:String, size:Float, type:Float, normalized:Bool, offset:Float):TextureTintPipeline;
	/**
		Binds the pipeline resources, including programs, vertex buffers and binds attributes
	**/
	function bind():TextureTintPipeline;
	/**
		Called before each frame is rendered, but after the canvas has been cleared.
	**/
	function onPreRender():TextureTintPipeline;
	/**
		Called before a Scene's Camera is rendered.
	**/
	function onRender(scene:global.phaser.Scene, camera:global.phaser.cameras.scene2d.Camera):TextureTintPipeline;
	/**
		Called after each frame has been completely rendered and snapshots have been taken.
	**/
	function onPostRender():TextureTintPipeline;
	/**
		Removes all object references in this WebGL Pipeline and removes its program from the WebGL context.
	**/
	function destroy():TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat1(name:String, x:Float):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat2(name:String, x:Float, y:Float):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat3(name:String, x:Float, y:Float, z:Float):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat4(name:String, x:Float, y:Float, z:Float, w:Float):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat1v(name:String, arr:js.lib.Float32Array):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat2v(name:String, arr:js.lib.Float32Array):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat3v(name:String, arr:js.lib.Float32Array):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat4v(name:String, arr:js.lib.Float32Array):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt1(name:String, x:Float):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt2(name:String, x:Float, y:Float):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt3(name:String, x:Float, y:Float, z:Float):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt4(name:String, x:Float, y:Float, z:Float, w:Float):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix2(name:String, transpose:Bool, matrix:js.lib.Float32Array):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix3(name:String, transpose:Bool, matrix:js.lib.Float32Array):TextureTintPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix4(name:String, transpose:Bool, matrix:js.lib.Float32Array):TextureTintPipeline;
	static var prototype : TextureTintPipeline;
}