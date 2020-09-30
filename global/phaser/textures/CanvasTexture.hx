package global.phaser.textures;

/**
	A Canvas Texture is a special kind of Texture that is backed by an HTML Canvas Element as its source.
	
	You can use the properties of this texture to draw to the canvas element directly, using all of the standard
	canvas operations available in the browser. Any Game Object can be given this texture and will render with it.
	
	Note: When running under WebGL the Canvas Texture needs to re-generate its base WebGLTexture and reupload it to
	the GPU every time you modify it, otherwise the changes you make to this texture will not be visible. To do this
	you should call `CanvasTexture.refresh()` once you are finished with your changes to the canvas. Try and keep
	this to a minimum, especially on large canvas sizes, or you may inadvertently thrash the GPU by constantly uploading
	texture data to it. This restriction does not apply if using the Canvas Renderer.
	
	It starts with only one frame that covers the whole of the canvas. You can add further frames, that specify
	sections of the canvas using the `add` method.
	
	Should you need to resize the canvas use the `setSize` method so that it accurately updates all of the underlying
	texture data as well. Forgetting to do this (i.e. by changing the canvas size directly from your code) could cause
	graphical errors.
**/
@:native("Phaser.Textures.CanvasTexture") extern class CanvasTexture extends Texture {
	function new(manager:TextureManager, key:String, source:js.html.CanvasElement, width:Float, height:Float);
	/**
		The source Canvas Element.
	**/
	final canvas : js.html.CanvasElement;
	/**
		The 2D Canvas Rendering Context.
	**/
	final context : js.html.CanvasRenderingContext2D;
	/**
		The width of the Canvas.
		This property is read-only, if you wish to change it use the `setSize` method.
	**/
	final width : Float;
	/**
		The height of the Canvas.
		This property is read-only, if you wish to change it use the `setSize` method.
	**/
	final height : Float;
	/**
		The context image data.
		Use the `update` method to populate this when the canvas changes.
	**/
	var imageData : js.html.ImageData;
	/**
		A Uint8ClampedArray view into the `buffer`.
		Use the `update` method to populate this when the canvas changes.
		Note that this is unavailable in some browsers, such as Epic Browser, due to their security restrictions.
	**/
	var data : js.lib.Uint8ClampedArray;
	/**
		An Uint32Array view into the `buffer`.
	**/
	var pixels : js.lib.Uint32Array;
	/**
		An ArrayBuffer the same size as the context ImageData.
	**/
	var buffer : js.lib.ArrayBuffer;
	/**
		This re-creates the `imageData` from the current context.
		It then re-builds the ArrayBuffer, the `data` Uint8ClampedArray reference and the `pixels` Int32Array.
		
		Warning: This is a very expensive operation, so use it sparingly.
	**/
	function update():CanvasTexture;
	/**
		Draws the given Image or Canvas element to this CanvasTexture, then updates the internal
		ImageData buffer and arrays.
	**/
	function draw(x:Float, y:Float, source:ts.AnyOf2<js.html.CanvasElement, js.html.ImageElement>):CanvasTexture;
	/**
		Draws the given texture frame to this CanvasTexture, then updates the internal
		ImageData buffer and arrays.
	**/
	function drawFrame(key:String, ?frame:ts.AnyOf2<String, Float>, ?x:Float, ?y:Float):CanvasTexture;
	/**
		Sets a pixel in the CanvasTexture to the given color and alpha values.
		
		This is an expensive operation to run in large quantities, so use sparingly.
	**/
	function setPixel(x:Float, y:Float, red:Float, green:Float, blue:Float, ?alpha:Float):CanvasTexture;
	/**
		Puts the ImageData into the context of this CanvasTexture at the given coordinates.
	**/
	function putData(imageData:js.html.ImageData, x:Float, y:Float, ?dirtyX:Float, ?dirtyY:Float, ?dirtyWidth:Float, ?dirtyHeight:Float):CanvasTexture;
	/**
		Gets an ImageData region from this CanvasTexture from the position and size specified.
		You can write this back using `CanvasTexture.putData`, or manipulate it.
	**/
	function getData(x:Float, y:Float, width:Float, height:Float):js.html.ImageData;
	/**
		Get the color of a specific pixel from this texture and store it in a Color object.
		
		If you have drawn anything to this CanvasTexture since it was created you must call `CanvasTexture.update` to refresh the array buffer,
		otherwise this may return out of date color values, or worse - throw a run-time error as it tries to access an array element that doesn't exist.
	**/
	function getPixel(x:Float, y:Float, ?out:global.phaser.display.Color):global.phaser.display.Color;
	/**
		Returns an array containing all of the pixels in the given region.
		
		If the requested region extends outside the bounds of this CanvasTexture,
		the region is truncated to fit.
		
		If you have drawn anything to this CanvasTexture since it was created you must call `CanvasTexture.update` to refresh the array buffer,
		otherwise this may return out of date color values, or worse - throw a run-time error as it tries to access an array element that doesn't exist.
	**/
	function getPixels(?x:Float, ?y:Float, ?width:Float, ?height:Float):Array<Array<global.phaser.types.textures.PixelConfig>>;
	/**
		Returns the Image Data index for the given pixel in this CanvasTexture.
		
		The index can be used to read directly from the `this.data` array.
		
		The index points to the red value in the array. The subsequent 3 indexes
		point to green, blue and alpha respectively.
	**/
	function getIndex(x:Float, y:Float):Float;
	/**
		This should be called manually if you are running under WebGL.
		It will refresh the WebGLTexture from the Canvas source. Only call this if you know that the
		canvas has changed, as there is a significant GPU texture allocation cost involved in doing so.
	**/
	function refresh():CanvasTexture;
	/**
		Gets the Canvas Element.
	**/
	function getCanvas():js.html.CanvasElement;
	/**
		Gets the 2D Canvas Rendering Context.
	**/
	function getContext():js.html.CanvasRenderingContext2D;
	/**
		Clears the given region of this Canvas Texture, resetting it back to transparent.
		If no region is given, the whole Canvas Texture is cleared.
	**/
	function clear(?x:Float, ?y:Float, ?width:Float, ?height:Float):CanvasTexture;
	/**
		Changes the size of this Canvas Texture.
	**/
	function setSize(width:Float, ?height:Float):CanvasTexture;
	static var prototype : CanvasTexture;
}