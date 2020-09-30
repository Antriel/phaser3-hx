package global.phaser.textures;

/**
	A Texture Source is the encapsulation of the actual source data for a Texture.
	
	This is typically an Image Element, loaded from the file system or network, a Canvas Element or a Video Element.
	
	A Texture can contain multiple Texture Sources, which only happens when a multi-atlas is loaded.
**/
@:native("Phaser.Textures.TextureSource") extern class TextureSource {
	function new(texture:Texture, source:ts.AnyOf5<js.html.webgl.Texture, js.html.CanvasElement, global.phaser.gameobjects.RenderTexture, js.html.VideoElement, js.html.ImageElement>, ?width:Float, ?height:Float, ?flipY:Bool);
	/**
		The Texture this TextureSource belongs to.
	**/
	var renderer : ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>;
	/**
		The Texture this TextureSource belongs to.
	**/
	var texture : Texture;
	/**
		The source of the image data.
		
		This is either an Image Element, a Canvas Element, a Video Element, a RenderTexture or a WebGLTexture.
	**/
	var source : ts.AnyOf5<js.html.webgl.Texture, js.html.CanvasElement, global.phaser.gameobjects.RenderTexture, js.html.VideoElement, js.html.ImageElement>;
	/**
		The image data.
		
		This is either an Image element, Canvas element or a Video Element.
	**/
	var image : ts.AnyOf3<js.html.CanvasElement, js.html.VideoElement, js.html.ImageElement>;
	/**
		Currently un-used.
	**/
	var compressionAlgorithm : Float;
	/**
		The resolution of the source image.
	**/
	var resolution : Float;
	/**
		The width of the source image. If not specified in the constructor it will check
		the `naturalWidth` and then `width` properties of the source image.
	**/
	var width : Float;
	/**
		The height of the source image. If not specified in the constructor it will check
		the `naturalHeight` and then `height` properties of the source image.
	**/
	var height : Float;
	/**
		The Scale Mode the image will use when rendering.
		Either Linear or Nearest.
	**/
	var scaleMode : Float;
	/**
		Is the source image a Canvas Element?
	**/
	var isCanvas : Bool;
	/**
		Is the source image a Video Element?
	**/
	var isVideo : Bool;
	/**
		Is the source image a Render Texture?
	**/
	var isRenderTexture : Bool;
	/**
		Is the source image a WebGLTexture?
	**/
	var isGLTexture : Bool;
	/**
		Are the source image dimensions a power of two?
	**/
	var isPowerOf2 : Bool;
	/**
		The WebGL Texture of the source image. If this TextureSource is driven from a WebGLTexture
		already, then this is a reference to that WebGLTexture.
	**/
	var glTexture : js.html.webgl.Texture;
	/**
		Sets the `UNPACK_FLIP_Y_WEBGL` flag the WebGL Texture uses during upload.
	**/
	var flipY : Bool;
	/**
		Creates a WebGL Texture, if required, and sets the Texture filter mode.
	**/
	function init(game:global.phaser.Game):Void;
	/**
		Sets the Filter Mode for this Texture.
		
		The mode can be either Linear, the default, or Nearest.
		
		For pixel-art you should use Nearest.
	**/
	function setFilter(filterMode:FilterMode):Void;
	/**
		Sets the `UNPACK_FLIP_Y_WEBGL` flag for the WebGL Texture during texture upload.
	**/
	function setFlipY(?value:Bool):Void;
	/**
		If this TextureSource is backed by a Canvas and is running under WebGL,
		it updates the WebGLTexture using the canvas data.
	**/
	function update():Void;
	/**
		Destroys this Texture Source and nulls the references.
	**/
	function destroy():Void;
	static var prototype : TextureSource;
}