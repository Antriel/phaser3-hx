package global.phaser.display.masks;

/**
	A Bitmap Mask combines the alpha (opacity) of a masked pixel with the alpha of another pixel.
	Unlike the Geometry Mask, which is a clipping path, a Bitmap Mask behaves like an alpha mask,
	not a clipping path. It is only available when using the WebGL Renderer.
	
	A Bitmap Mask can use any Game Object to determine the alpha of each pixel of the masked Game Object(s).
	For any given point of a masked Game Object's texture, the pixel's alpha will be multiplied by the alpha
	of the pixel at the same position in the Bitmap Mask's Game Object. The color of the pixel from the
	Bitmap Mask doesn't matter.
	
	For example, if a pure blue pixel with an alpha of 0.95 is masked with a pure red pixel with an
	alpha of 0.5, the resulting pixel will be pure blue with an alpha of 0.475. Naturally, this means
	that a pixel in the mask with an alpha of 0 will hide the corresponding pixel in all masked Game Objects
	  A pixel with an alpha of 1 in the masked Game Object will receive the same alpha as the
	corresponding pixel in the mask.
	
	Note: You cannot combine Bitmap Masks and Blend Modes on the same Game Object. You can, however,
	combine Geometry Masks and Blend Modes together.
	
	The Bitmap Mask's location matches the location of its Game Object, not the location of the
	masked objects. Moving or transforming the underlying Game Object will change the mask
	(and affect the visibility of any masked objects), whereas moving or transforming a masked object
	will not affect the mask.
	
	The Bitmap Mask will not render its Game Object by itself. If the Game Object is not in a
	Scene's display list, it will only be used for the mask and its full texture will not be directly
	visible. Adding the underlying Game Object to a Scene will not cause any problems - it will
	render as a normal Game Object and will also serve as a mask.
**/
@:native("Phaser.Display.Masks.BitmapMask") extern class BitmapMask {
	function new(scene:global.phaser.Scene, renderable:global.phaser.gameobjects.GameObject);
	/**
		A reference to either the Canvas or WebGL Renderer that this Mask is using.
	**/
	var renderer : ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>;
	/**
		A renderable Game Object that uses a texture, such as a Sprite.
	**/
	var bitmapMask : global.phaser.gameobjects.GameObject;
	/**
		The texture used for the masks framebuffer.
	**/
	var maskTexture : js.html.webgl.Texture;
	/**
		The texture used for the main framebuffer.
	**/
	var mainTexture : js.html.webgl.Texture;
	/**
		Whether the Bitmap Mask is dirty and needs to be updated.
	**/
	var dirty : Bool;
	/**
		The framebuffer to which a masked Game Object is rendered.
	**/
	var mainFramebuffer : js.html.webgl.Framebuffer;
	/**
		The framebuffer to which the Bitmap Mask's masking Game Object is rendered.
	**/
	var maskFramebuffer : js.html.webgl.Framebuffer;
	/**
		Whether to invert the masks alpha.
		
		If `true`, the alpha of the masking pixel will be inverted before it's multiplied with the masked pixel.
		Essentially, this means that a masked area will be visible only if the corresponding area in the mask is invisible.
	**/
	var invertAlpha : Bool;
	/**
		Is this mask a stencil mask?
	**/
	final isStencil : Bool;
	/**
		Creates the WebGL Texture2D objects and Framebuffers required for this
		mask. If this mask has already been created, then `clearMask` is called first.
	**/
	function createMask():Void;
	/**
		Deletes the `mainTexture` and `maskTexture` WebGL Textures and deletes
		the `mainFramebuffer` and `maskFramebuffer` too, nulling all references.
		
		This is called when this mask is destroyed, or if you try to creat a new
		mask from this object when one is already set.
	**/
	function clearMask():Void;
	/**
		Sets a new masking Game Object for the Bitmap Mask.
	**/
	function setBitmap(renderable:global.phaser.gameobjects.GameObject):Void;
	/**
		Prepares the WebGL Renderer to render a Game Object with this mask applied.
		
		This renders the masking Game Object to the mask framebuffer and switches to the main framebuffer so that the masked Game Object will be rendered to it instead of being rendered directly to the frame.
	**/
	function preRenderWebGL(renderer:ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>, maskedObject:global.phaser.gameobjects.GameObject, camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		Finalizes rendering of a masked Game Object.
		
		This resets the previously bound framebuffer and switches the WebGL Renderer to the Bitmap Mask Pipeline, which uses a special fragment shader to apply the masking effect.
	**/
	function postRenderWebGL(renderer:ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>):Void;
	/**
		This is a NOOP method. Bitmap Masks are not supported by the Canvas Renderer.
	**/
	function preRenderCanvas(renderer:ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>, mask:global.phaser.gameobjects.GameObject, camera:global.phaser.cameras.scene2d.Camera):Void;
	/**
		This is a NOOP method. Bitmap Masks are not supported by the Canvas Renderer.
	**/
	function postRenderCanvas(renderer:ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>):Void;
	/**
		Destroys this BitmapMask and nulls any references it holds.
		
		Note that if a Game Object is currently using this mask it will _not_ automatically detect you have destroyed it,
		so be sure to call `clearMask` on any Game Object using it, before destroying it.
	**/
	function destroy():Void;
	static var prototype : BitmapMask;
}