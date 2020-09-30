package global.phaser.renderer.webgl.pipelines;

/**
	ForwardDiffuseLightPipeline implements a forward rendering approach for 2D lights.
	This pipeline extends TextureTintPipeline so it implements all it's rendering functions
	and batching system.
**/
@:native("Phaser.Renderer.WebGL.Pipelines.ForwardDiffuseLightPipeline") extern class ForwardDiffuseLightPipeline extends TextureTintPipeline {
	function new(config:Dynamic);
	/**
		This function sets all the needed resources for each camera pass.
	**/
	function onRender(scene:global.phaser.Scene, camera:global.phaser.cameras.scene2d.Camera):ForwardDiffuseLightPipeline;
	/**
		Generic function for batching a textured quad
	**/
	function batchTexture(gameObject:global.phaser.gameobjects.GameObject, texture:js.html.webgl.Texture, textureWidth:Float, textureHeight:Float, srcX:Float, srcY:Float, srcWidth:Float, srcHeight:Float, scaleX:Float, scaleY:Float, rotation:Float, flipX:Bool, flipY:Bool, scrollFactorX:Float, scrollFactorY:Float, displayOriginX:Float, displayOriginY:Float, frameX:Float, frameY:Float, frameWidth:Float, frameHeight:Float, tintTL:Float, tintTR:Float, tintBL:Float, tintBR:Float, tintEffect:Float, uOffset:Float, vOffset:Float, camera:global.phaser.cameras.scene2d.Camera, parentTransformMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Sets the Game Objects normal map as the active texture.
	**/
	function setNormalMap(gameObject:global.phaser.gameobjects.GameObject):Void;
	/**
		Rotates the normal map vectors inversely by the given angle.
		Only works in 2D space.
	**/
	function setNormalMapRotation(rotation:Float):Void;
	/**
		Takes a Sprite Game Object, or any object that extends it, which has a normal texture and adds it to the batch.
	**/
	function batchSprite(sprite:global.phaser.gameobjects.Sprite, camera:global.phaser.cameras.scene2d.Camera, parentTransformMatrix:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Called every time the pipeline needs to be used.
		It binds all necessary resources.
	**/
	function onBind():ForwardDiffuseLightPipeline;
	/**
		Resizes this pipeline and updates the projection.
	**/
	function resize(width:Float, height:Float, resolution:Float):ForwardDiffuseLightPipeline;
	/**
		Uploads the vertex data and emits a draw call for the current batch of vertices.
	**/
	function flush():ForwardDiffuseLightPipeline;
	/**
		Adds a description of vertex attribute to the pipeline
	**/
	function addAttribute(name:String, size:Float, type:Float, normalized:Bool, offset:Float):ForwardDiffuseLightPipeline;
	/**
		Binds the pipeline resources, including programs, vertex buffers and binds attributes
	**/
	function bind():ForwardDiffuseLightPipeline;
	/**
		Called before each frame is rendered, but after the canvas has been cleared.
	**/
	function onPreRender():ForwardDiffuseLightPipeline;
	/**
		Called after each frame has been completely rendered and snapshots have been taken.
	**/
	function onPostRender():ForwardDiffuseLightPipeline;
	/**
		Removes all object references in this WebGL Pipeline and removes its program from the WebGL context.
	**/
	function destroy():ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat1(name:String, x:Float):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat2(name:String, x:Float, y:Float):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat3(name:String, x:Float, y:Float, z:Float):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat4(name:String, x:Float, y:Float, z:Float, w:Float):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat1v(name:String, arr:js.lib.Float32Array):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat2v(name:String, arr:js.lib.Float32Array):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat3v(name:String, arr:js.lib.Float32Array):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setFloat4v(name:String, arr:js.lib.Float32Array):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt1(name:String, x:Float):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt2(name:String, x:Float, y:Float):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt3(name:String, x:Float, y:Float, z:Float):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setInt4(name:String, x:Float, y:Float, z:Float, w:Float):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix2(name:String, transpose:Bool, matrix:js.lib.Float32Array):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix3(name:String, transpose:Bool, matrix:js.lib.Float32Array):ForwardDiffuseLightPipeline;
	/**
		Set a uniform value of the current pipeline program.
	**/
	function setMatrix4(name:String, transpose:Bool, matrix:js.lib.Float32Array):ForwardDiffuseLightPipeline;
	static var prototype : ForwardDiffuseLightPipeline;
}