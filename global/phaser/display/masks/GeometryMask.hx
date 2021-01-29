package global.phaser.display.masks;

/**
	A Geometry Mask can be applied to a Game Object to hide any pixels of it which don't intersect
	a visible pixel from the geometry mask. The mask is essentially a clipping path which can only
	make a masked pixel fully visible or fully invisible without changing its alpha (opacity).
	
	A Geometry Mask uses a Graphics Game Object to determine which pixels of the masked Game Object(s)
	should be clipped. For any given point of a masked Game Object's texture, the pixel will only be displayed
	if the Graphics Game Object of the Geometry Mask has a visible pixel at the same position. The color and
	alpha of the pixel from the Geometry Mask do not matter.
	
	The Geometry Mask's location matches the location of its Graphics object, not the location of the masked objects.
	Moving or transforming the underlying Graphics object will change the mask (and affect the visibility
	of any masked objects), whereas moving or transforming a masked object will not affect the mask.
	You can think of the Geometry Mask (or rather, of its Graphics object) as an invisible curtain placed
	in front of all masked objects which has its own visual properties and, naturally, respects the camera's
	visual properties, but isn't affected by and doesn't follow the masked objects by itself.
**/
@:native("Phaser.Display.Masks.GeometryMask") extern class GeometryMask {
	function new(scene:global.phaser.Scene, graphicsGeometry:global.phaser.gameobjects.Graphics);
	/**
		The Graphics object which describes the Geometry Mask.
	**/
	var geometryMask : global.phaser.gameobjects.Graphics;
	/**
		Similar to the BitmapMasks invertAlpha setting this to true will then hide all pixels
		drawn to the Geometry Mask.
		
		This is a WebGL only feature.
	**/
	var invertAlpha : Bool;
	/**
		Is this mask a stencil mask?
	**/
	final isStencil : Bool;
	/**
		Sets a new Graphics object for the Geometry Mask.
	**/
	function setShape(graphicsGeometry:global.phaser.gameobjects.Graphics):GeometryMask;
	/**
		Sets the `invertAlpha` property of this Geometry Mask.
		
		Inverting the alpha essentially flips the way the mask works.
		
		This is a WebGL only feature.
	**/
	function setInvertAlpha(?value:Bool):GeometryMask;
	/**
		Renders the Geometry Mask's underlying Graphics object to the OpenGL stencil buffer and enables the stencil test, which clips rendered pixels according to the mask.
	**/
	function preRenderWebGL(renderer:global.phaser.renderer.webgl.WebGLRenderer, child:global.phaser.gameobjects.GameObject, camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		Applies the current stencil mask to the renderer.
	**/
	function applyStencil(renderer:global.phaser.renderer.webgl.WebGLRenderer, camera:global.phaser.cameras.scene2d.Camera, inc:Bool):Void;
	/**
		Flushes all rendered pixels and disables the stencil test of a WebGL context, thus disabling the mask for it.
	**/
	function postRenderWebGL(renderer:global.phaser.renderer.webgl.WebGLRenderer):Void;
	/**
		Sets the clipping path of a 2D canvas context to the Geometry Mask's underlying Graphics object.
	**/
	function preRenderCanvas(renderer:global.phaser.renderer.canvas.CanvasRenderer, mask:global.phaser.gameobjects.GameObject, camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		Restore the canvas context's previous clipping path, thus turning off the mask for it.
	**/
	function postRenderCanvas(renderer:global.phaser.renderer.canvas.CanvasRenderer):Void;
	/**
		Destroys this GeometryMask and nulls any references it holds.
		
		Note that if a Game Object is currently using this mask it will _not_ automatically detect you have destroyed it,
		so be sure to call `clearMask` on any Game Object using it, before destroying it.
	**/
	function destroy():Void;
	static var prototype : GeometryMask;
}