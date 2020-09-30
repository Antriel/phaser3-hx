package global.phaser.textures;

/**
	A Texture consists of a source, usually an Image from the Cache, and a collection of Frames.
	The Frames represent the different areas of the Texture. For example a texture atlas
	may have many Frames, one for each element within the atlas. Where-as a single image would have
	just one frame, that encompasses the whole image.
	
	Every Texture, no matter where it comes from, always has at least 1 frame called the `__BASE` frame.
	This frame represents the entirety of the source image.
	
	Textures are managed by the global TextureManager. This is a singleton class that is
	responsible for creating and delivering Textures and their corresponding Frames to Game Objects.
	
	Sprites and other Game Objects get the texture data they need from the TextureManager.
**/
@:native("Phaser.Textures.Texture") extern class Texture {
	function new(manager:TextureManager, key:String, source:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>, ?width:Float, ?height:Float);
	/**
		A reference to the Texture Manager this Texture belongs to.
	**/
	var manager : TextureManager;
	/**
		The unique string-based key of this Texture.
	**/
	var key : String;
	/**
		An array of TextureSource instances.
		These are unique to this Texture and contain the actual Image (or Canvas) data.
	**/
	var source : Array<TextureSource>;
	/**
		An array of TextureSource data instances.
		Used to store additional data images, such as normal maps or specular maps.
	**/
	var dataSource : Array<Dynamic>;
	/**
		A key-value object pair associating the unique Frame keys with the Frames objects.
	**/
	var frames : Dynamic;
	/**
		Any additional data that was set in the source JSON (if any),
		or any extra data you'd like to store relating to this texture
	**/
	var customData : Dynamic;
	/**
		The name of the first frame of the Texture.
	**/
	var firstFrame : String;
	/**
		The total number of Frames in this Texture, including the `__BASE` frame.
		
		A Texture will always contain at least 1 frame because every Texture contains a `__BASE` frame by default,
		in addition to any extra frames that have been added to it, such as when parsing a Sprite Sheet or Texture Atlas.
	**/
	var frameTotal : Float;
	/**
		Adds a new Frame to this Texture.
		
		A Frame is a rectangular region of a TextureSource with a unique index or string-based key.
		
		The name given must be unique within this Texture. If it already exists, this method will return `null`.
	**/
	function add(name:ts.AnyOf2<String, Float>, sourceIndex:Float, x:Float, y:Float, width:Float, height:Float):Frame;
	/**
		Removes the given Frame from this Texture. The Frame is destroyed immediately.
		
		Any Game Objects using this Frame should stop using it _before_ you remove it,
		as it does not happen automatically.
	**/
	function remove(name:String):Bool;
	/**
		Checks to see if a Frame matching the given key exists within this Texture.
	**/
	function has(name:String):Bool;
	/**
		Gets a Frame from this Texture based on either the key or the index of the Frame.
		
		In a Texture Atlas Frames are typically referenced by a key.
		In a Sprite Sheet Frames are referenced by an index.
		Passing no value for the name returns the base texture.
	**/
	function get(?name:ts.AnyOf2<String, Float>):Frame;
	/**
		Takes the given TextureSource and returns the index of it within this Texture.
		If it's not in this Texture, it returns -1.
		Unless this Texture has multiple TextureSources, such as with a multi-atlas, this
		method will always return zero or -1.
	**/
	function getTextureSourceIndex(source:TextureSource):Float;
	/**
		Returns an array of all the Frames in the given TextureSource.
	**/
	function getFramesFromTextureSource(sourceIndex:Float, ?includeBase:Bool):Array<Frame>;
	/**
		Returns an array with all of the names of the Frames in this Texture.
		
		Useful if you want to randomly assign a Frame to a Game Object, as you can
		pick a random element from the returned array.
	**/
	function getFrameNames(?includeBase:Bool):Array<String>;
	/**
		Given a Frame name, return the source image it uses to render with.
		
		This will return the actual DOM Image or Canvas element.
	**/
	function getSourceImage(?name:ts.AnyOf2<String, Float>):ts.AnyOf3<js.html.CanvasElement, global.phaser.gameobjects.RenderTexture, js.html.ImageElement>;
	/**
		Given a Frame name, return the data source image it uses to render with.
		You can use this to get the normal map for an image for example.
		
		This will return the actual DOM Image.
	**/
	function getDataSourceImage(?name:ts.AnyOf2<String, Float>):ts.AnyOf2<js.html.CanvasElement, js.html.ImageElement>;
	/**
		Adds a data source image to this Texture.
		
		An example of a data source image would be a normal map, where all of the Frames for this Texture
		equally apply to the normal map.
	**/
	function setDataSource(data:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>):Void;
	/**
		Sets the Filter Mode for this Texture.
		
		The mode can be either Linear, the default, or Nearest.
		
		For pixel-art you should use Nearest.
		
		The mode applies to the entire Texture, not just a specific Frame of it.
	**/
	function setFilter(filterMode:FilterMode):Void;
	/**
		Destroys this Texture and releases references to its sources and frames.
	**/
	function destroy():Void;
	static var prototype : Texture;
}