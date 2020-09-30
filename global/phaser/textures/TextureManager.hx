package global.phaser.textures;

/**
	Textures are managed by the global TextureManager. This is a singleton class that is
	responsible for creating and delivering Textures and their corresponding Frames to Game Objects.
	
	Sprites and other Game Objects get the texture data they need from the TextureManager.
	
	Access it via `scene.textures`.
**/
@:native("Phaser.Textures.TextureManager") extern class TextureManager extends global.phaser.events.EventEmitter {
	function new(game:global.phaser.Game);
	/**
		The Game that this TextureManager belongs to.
	**/
	var game : global.phaser.Game;
	/**
		The name of this manager.
	**/
	var name : String;
	/**
		An object that has all of textures that Texture Manager creates.
		Textures are assigned to keys so we can access to any texture that this object has directly by key value without iteration.
	**/
	var list : Dynamic;
	/**
		Checks the given texture key and throws a console.warn if the key is already in use, then returns false.
		If you wish to avoid the console.warn then use `TextureManager.exists` instead.
	**/
	function checkKey(key:String):Bool;
	/**
		Removes a Texture from the Texture Manager and destroys it. This will immediately
		clear all references to it from the Texture Manager, and if it has one, destroy its
		WebGLTexture. This will emit a `removetexture` event.
		
		Note: If you have any Game Objects still using this texture they will start throwing
		errors the next time they try to render. Make sure that removing the texture is the final
		step when clearing down to avoid this.
	**/
	function remove(key:ts.AnyOf2<String, Texture>):TextureManager;
	/**
		Removes a key from the Texture Manager but does not destroy the Texture that was using the key.
	**/
	function removeKey(key:String):TextureManager;
	/**
		Adds a new Texture to the Texture Manager created from the given Base64 encoded data.
	**/
	function addBase64(key:String, data:Dynamic):TextureManager;
	/**
		Gets an existing texture frame and converts it into a base64 encoded image and returns the base64 data.
		
		You can also provide the image type and encoder options.
		
		This will only work with bitmap based texture frames, such as those created from Texture Atlases.
		It will not work with GL Texture objects, such as Shaders, or Render Textures. For those please
		see the WebGL Snapshot function instead.
	**/
	function getBase64(key:String, ?frame:ts.AnyOf2<String, Float>, ?type:String, ?encoderOptions:Float):String;
	/**
		Adds a new Texture to the Texture Manager created from the given Image element.
	**/
	function addImage(key:String, source:js.html.ImageElement, ?dataSource:ts.AnyOf2<js.html.CanvasElement, js.html.ImageElement>):Texture;
	/**
		Takes a WebGL Texture and creates a Phaser Texture from it, which is added to the Texture Manager using the given key.
		
		This allows you to then use the Texture as a normal texture for texture based Game Objects like Sprites.
		
		This is a WebGL only feature.
	**/
	function addGLTexture(key:String, glTexture:js.html.webgl.Texture, width:Float, height:Float):Texture;
	/**
		Adds a Render Texture to the Texture Manager using the given key.
		This allows you to then use the Render Texture as a normal texture for texture based Game Objects like Sprites.
	**/
	function addRenderTexture(key:String, renderTexture:global.phaser.gameobjects.RenderTexture):Texture;
	/**
		Creates a new Texture using the given config values.
		
		Generated textures consist of a Canvas element to which the texture data is drawn.
		
		Generates a texture based on the given Create configuration object.
		
		The texture is drawn using a fixed-size indexed palette of 16 colors, where the hex value in the
		data cells map to a single color. For example, if the texture config looked like this:
		
		```javascript
		var star = [
		   '.....828.....',
		   '....72227....',
		   '....82228....',
		   '...7222227...',
		   '2222222222222',
		   '8222222222228',
		   '.72222222227.',
		   '..787777787..',
		   '..877777778..',
		   '.78778887787.',
		   '.27887.78872.',
		   '.787.....787.'
		];
		
		this.textures.generate('star', { data: star, pixelWidth: 4 });
		```
		
		Then it would generate a texture that is 52 x 48 pixels in size, because each cell of the data array
		represents 1 pixel multiplied by the `pixelWidth` value. The cell values, such as `8`, maps to color
		number 8 in the palette. If a cell contains a period character `.` then it is transparent.
		
		The default palette is Arne16, but you can specify your own using the `palette` property.
	**/
	function generate(key:String, config:global.phaser.types.create.GenerateTextureConfig):Texture;
	/**
		Creates a new Texture using a blank Canvas element of the size given.
		
		Canvas elements are automatically pooled and calling this method will
		extract a free canvas from the CanvasPool, or create one if none are available.
	**/
	function createCanvas(key:String, ?width:Float, ?height:Float):CanvasTexture;
	/**
		Creates a new Canvas Texture object from an existing Canvas element
		and adds it to this Texture Manager, unless `skipCache` is true.
	**/
	function addCanvas(key:String, source:js.html.CanvasElement, ?skipCache:Bool):CanvasTexture;
	/**
		Adds a new Texture Atlas to this Texture Manager.
		It can accept either JSON Array or JSON Hash formats, as exported by Texture Packer and similar software.
	**/
	function addAtlas(key:String, source:js.html.ImageElement, data:Dynamic, ?dataSource:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>):Texture;
	/**
		Adds a Texture Atlas to this Texture Manager.
		The frame data of the atlas must be stored in an Array within the JSON.
		This is known as a JSON Array in software such as Texture Packer.
	**/
	function addAtlasJSONArray(key:String, source:ts.AnyOf2<js.html.ImageElement, Array<js.html.ImageElement>>, data:ts.AnyOf2<Dynamic, Array<Dynamic>>, ?dataSource:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>):Texture;
	/**
		Adds a Texture Atlas to this Texture Manager.
		The frame data of the atlas must be stored in an Object within the JSON.
		This is known as a JSON Hash in software such as Texture Packer.
	**/
	function addAtlasJSONHash(key:String, source:js.html.ImageElement, data:Dynamic, ?dataSource:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>):Texture;
	/**
		Adds a Texture Atlas to this Texture Manager, where the atlas data is given
		in the XML format.
	**/
	function addAtlasXML(key:String, source:js.html.ImageElement, data:Dynamic, ?dataSource:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>):Texture;
	/**
		Adds a Unity Texture Atlas to this Texture Manager.
		The data must be in the form of a Unity YAML file.
	**/
	function addUnityAtlas(key:String, source:js.html.ImageElement, data:Dynamic, ?dataSource:ts.AnyOf4<js.html.CanvasElement, js.html.ImageElement, Array<js.html.ImageElement>, Array<js.html.CanvasElement>>):Texture;
	/**
		Adds a Sprite Sheet to this Texture Manager.
		
		In Phaser terminology a Sprite Sheet is a texture containing different frames, but each frame is the exact
		same size and cannot be trimmed or rotated.
	**/
	function addSpriteSheet(key:String, source:js.html.ImageElement, config:global.phaser.types.textures.SpriteSheetConfig):Texture;
	/**
		Adds a Sprite Sheet to this Texture Manager, where the Sprite Sheet exists as a Frame within a Texture Atlas.
		
		In Phaser terminology a Sprite Sheet is a texture containing different frames, but each frame is the exact
		same size and cannot be trimmed or rotated.
	**/
	function addSpriteSheetFromAtlas(key:String, config:global.phaser.types.textures.SpriteSheetFromAtlasConfig):Texture;
	/**
		Creates a new Texture using the given source and dimensions.
	**/
	function create(key:String, source:js.html.ImageElement, width:Float, height:Float):Texture;
	/**
		Checks the given key to see if a Texture using it exists within this Texture Manager.
	**/
	function exists(key:String):Bool;
	/**
		Returns a Texture from the Texture Manager that matches the given key.
		
		If the key is `undefined` it will return the `__DEFAULT` Texture.
		
		If the key is an instance of a Texture, it will return the key directly.
		
		Finally. if the key is given, but not found and not a Texture instance, it will return the `__MISSING` Texture.
	**/
	function get(key:ts.AnyOf2<String, Texture>):Texture;
	/**
		Takes a Texture key and Frame name and returns a clone of that Frame if found.
	**/
	function cloneFrame(key:String, frame:ts.AnyOf2<String, Float>):Frame;
	/**
		Takes a Texture key and Frame name and returns a reference to that Frame, if found.
	**/
	function getFrame(key:String, ?frame:ts.AnyOf2<String, Float>):Frame;
	/**
		Returns an array with all of the keys of all Textures in this Texture Manager.
		The output array will exclude the `__DEFAULT` and `__MISSING` keys.
	**/
	function getTextureKeys():Array<String>;
	/**
		Given a Texture and an `x` and `y` coordinate this method will return a new
		Color object that has been populated with the color and alpha values of the pixel
		at that location in the Texture.
	**/
	function getPixel(x:Float, y:Float, key:String, ?frame:ts.AnyOf2<String, Float>):global.phaser.display.Color;
	/**
		Given a Texture and an `x` and `y` coordinate this method will return a value between 0 and 255
		corresponding to the alpha value of the pixel at that location in the Texture. If the coordinate
		is out of bounds it will return null.
	**/
	function getPixelAlpha(x:Float, y:Float, key:String, ?frame:ts.AnyOf2<String, Float>):Float;
	/**
		Sets the given Game Objects `texture` and `frame` properties so that it uses
		the Texture and Frame specified in the `key` and `frame` arguments to this method.
	**/
	function setTexture(gameObject:global.phaser.gameobjects.GameObject, key:String, ?frame:ts.AnyOf2<String, Float>):global.phaser.gameobjects.GameObject;
	/**
		Changes the key being used by a Texture to the new key provided.
		
		The old key is removed, allowing it to be re-used.
		
		Game Objects are linked to Textures by a reference to the Texture object, so
		all existing references will be retained.
	**/
	function renameTexture(currentKey:String, newKey:String):Bool;
	/**
		Passes all Textures to the given callback.
	**/
	function each(callback:global.EachTextureCallback, scope:Dynamic, args:haxe.extern.Rest<Dynamic>):Void;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TextureManager;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TextureManager;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):TextureManager;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):TextureManager;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):TextureManager;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):TextureManager;
	static var prototype : TextureManager;
}