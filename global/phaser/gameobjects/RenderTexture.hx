package global.phaser.gameobjects;

/**
	A Render Texture.
	
	A Render Texture is a special texture that allows any number of Game Objects to be drawn to it. You can take many complex objects and
	draw them all to this one texture, which can they be used as the texture for other Game Object's. It's a way to generate dynamic
	textures at run-time that are WebGL friendly and don't invoke expensive GPU uploads.
	
	Note that under WebGL a FrameBuffer, which is what the Render Texture uses internally, cannot be anti-aliased. This means
	that when drawing objects such as Shapes to a Render Texture they will appear to be drawn with no aliasing, however this
	is a technical limitation of WebGL. To get around it, create your shape as a texture in an art package, then draw that
	to the Render Texture.
**/
@:native("Phaser.GameObjects.RenderTexture") extern class RenderTexture extends GameObject {
	function new(scene:global.phaser.Scene, ?x:Float, ?y:Float, ?width:Float, ?height:Float);
	/**
		A reference to either the Canvas or WebGL Renderer that the Game instance is using.
	**/
	var renderer : ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>;
	/**
		A reference to the Texture Manager.
	**/
	var textureManager : global.phaser.textures.TextureManager;
	/**
		The tint of the Render Texture when rendered.
	**/
	var globalTint : Float;
	/**
		The alpha of the Render Texture when rendered.
	**/
	var globalAlpha : Float;
	/**
		The HTML Canvas Element that the Render Texture is drawing to when using the Canvas Renderer.
	**/
	var canvas : js.html.CanvasElement;
	/**
		Is this Render Texture dirty or not? If not it won't spend time clearing or filling itself.
	**/
	var dirty : Bool;
	/**
		The Texture corresponding to this Render Texture.
	**/
	var texture : global.phaser.textures.Texture;
	/**
		The Frame corresponding to this Render Texture.
	**/
	var frame : global.phaser.textures.Frame;
	/**
		A reference to the Rendering Context belonging to the Canvas Element this Render Texture is drawing to.
	**/
	var context : js.html.CanvasRenderingContext2D;
	/**
		An internal Camera that can be used to move around the Render Texture.
		Control it just like you would any Scene Camera. The difference is that it only impacts the placement of what
		is drawn to the Render Texture. You can scroll, zoom and rotate this Camera.
	**/
	var camera : global.phaser.cameras.scene2d.BaseCamera;
	/**
		The Render Target that belongs to this Render Texture.
		
		A Render Target encapsulates a framebuffer and texture for the WebGL Renderer.
		
		This property remains `null` under Canvas.
	**/
	var renderTarget : global.phaser.renderer.webgl.RenderTarget;
	/**
		Sets the size of this Game Object.
	**/
	function setSize(width:Float, height:Float):RenderTexture;
	/**
		Resizes the Render Texture to the new dimensions given.
		
		If Render Texture was created from specific frame, only the size of the frame will be changed. The size of the source
		texture will not change.
		
		If Render Texture was not created from specific frame, the following will happen:
		
		In WebGL it will destroy and then re-create the frame buffer being used by the Render Texture.
		In Canvas it will resize the underlying canvas element.
		
		Both approaches will erase everything currently drawn to the Render Texture.
		
		If the dimensions given are the same as those already being used, calling this method will do nothing.
	**/
	function resize(width:Float, ?height:Float):RenderTexture;
	/**
		Set the tint to use when rendering this Render Texture.
	**/
	function setGlobalTint(tint:Float):RenderTexture;
	/**
		Set the alpha to use when rendering this Render Texture.
	**/
	function setGlobalAlpha(alpha:Float):RenderTexture;
	/**
		Stores a copy of this Render Texture in the Texture Manager using the given key.
		
		After doing this, any texture based Game Object, such as a Sprite, can use the contents of this
		Render Texture by using the texture key:
		
		```javascript
		var rt = this.add.renderTexture(0, 0, 128, 128);
		
		// Draw something to the Render Texture
		
		rt.saveTexture('doodle');
		
		this.add.image(400, 300, 'doodle');
		```
		
		Updating the contents of this Render Texture will automatically update _any_ Game Object
		that is using it as a texture. Calling `saveTexture` again will not save another copy
		of the same texture, it will just rename the key of the existing copy.
		
		By default it will create a single base texture. You can add frames to the texture
		by using the `Texture.add` method. After doing this, you can then allow Game Objects
		to use a specific frame from a Render Texture.
		
		If you destroy this Render Texture, any Game Object using it via the Texture Manager will
		stop rendering. Ensure you remove the texture from the Texture Manager and any Game Objects
		using it first, before destroying this Render Texture.
	**/
	function saveTexture(key:String):global.phaser.textures.Texture;
	/**
		Fills the Render Texture with the given color.
	**/
	function fill(rgb:Float, ?alpha:Float, ?x:Float, ?y:Float, ?width:Float, ?height:Float):RenderTexture;
	/**
		Clears the Render Texture.
	**/
	function clear():RenderTexture;
	/**
		Draws the given object, or an array of objects, to this Render Texture using a blend mode of ERASE.
		This has the effect of erasing any filled pixels in the objects from this Render Texture.
		
		It can accept any of the following:
		
		* Any renderable Game Object, such as a Sprite, Text, Graphics or TileSprite.
		* Tilemap Layers.
		* A Group. The contents of which will be iterated and drawn in turn.
		* A Container. The contents of which will be iterated fully, and drawn in turn.
		* A Scene's Display List. Pass in `Scene.children` to draw the whole list.
		* Another Render Texture.
		* A Texture Frame instance.
		* A string. This is used to look-up a texture from the Texture Manager.
		
		Note: You cannot erase a Render Texture from itself.
		
		If passing in a Group or Container it will only draw children that return `true`
		when their `willRender()` method is called. I.e. a Container with 10 children,
		5 of which have `visible=false` will only draw the 5 visible ones.
		
		If passing in an array of Game Objects it will draw them all, regardless if
		they pass a `willRender` check or not.
		
		You can pass in a string in which case it will look for a texture in the Texture
		Manager matching that string, and draw the base frame.
		
		You can pass in the `x` and `y` coordinates to draw the objects at. The use of
		the coordinates differ based on what objects are being drawn. If the object is
		a Group, Container or Display List, the coordinates are _added_ to the positions
		of the children. For all other types of object, the coordinates are exact.
		
		Calling this method causes the WebGL batch to flush, so it can write the texture
		data to the framebuffer being used internally. The batch is flushed at the end,
		after the entries have been iterated. So if you've a bunch of objects to draw,
		try and pass them in an array in one single call, rather than making lots of
		separate calls.
	**/
	function erase(entries:Dynamic, ?x:Float, ?y:Float):RenderTexture;
	/**
		Draws the given object, or an array of objects, to this Render Texture.
		
		It can accept any of the following:
		
		* Any renderable Game Object, such as a Sprite, Text, Graphics or TileSprite.
		* Tilemap Layers.
		* A Group. The contents of which will be iterated and drawn in turn.
		* A Container. The contents of which will be iterated fully, and drawn in turn.
		* A Scene's Display List. Pass in `Scene.children` to draw the whole list.
		* Another Render Texture.
		* A Texture Frame instance.
		* A string. This is used to look-up a texture from the Texture Manager.
		
		Note: You cannot draw a Render Texture to itself.
		
		If passing in a Group or Container it will only draw children that return `true`
		when their `willRender()` method is called. I.e. a Container with 10 children,
		5 of which have `visible=false` will only draw the 5 visible ones.
		
		If passing in an array of Game Objects it will draw them all, regardless if
		they pass a `willRender` check or not.
		
		You can pass in a string in which case it will look for a texture in the Texture
		Manager matching that string, and draw the base frame. If you need to specify
		exactly which frame to draw then use the method `drawFrame` instead.
		
		You can pass in the `x` and `y` coordinates to draw the objects at. The use of
		the coordinates differ based on what objects are being drawn. If the object is
		a Group, Container or Display List, the coordinates are _added_ to the positions
		of the children. For all other types of object, the coordinates are exact.
		
		The `alpha` and `tint` values are only used by Texture Frames.
		Game Objects use their own alpha and tint values when being drawn.
		
		Calling this method causes the WebGL batch to flush, so it can write the texture
		data to the framebuffer being used internally. The batch is flushed at the end,
		after the entries have been iterated. So if you've a bunch of objects to draw,
		try and pass them in an array in one single call, rather than making lots of
		separate calls.
	**/
	function draw(entries:Dynamic, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):RenderTexture;
	/**
		Draws the Texture Frame to the Render Texture at the given position.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
		
		```javascript
		var rt = this.add.renderTexture(0, 0, 800, 600);
		rt.drawFrame(key, frame);
		```
		
		You can optionally provide a position, alpha and tint value to apply to the frame
		before it is drawn.
		
		Calling this method will cause a batch flush, so if you've got a stack of things to draw
		in a tight loop, try using the `draw` method instead.
		
		If you need to draw a Sprite to this Render Texture, use the `draw` method instead.
	**/
	function drawFrame(key:String, ?frame:ts.AnyOf2<String, Float>, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):RenderTexture;
	/**
		Use this method if you need to batch draw a large number of Game Objects to
		this Render Texture in a single go, or on a frequent basis.
		
		This method starts the beginning of a batched draw.
		
		It is faster than calling `draw`, but you must be very careful to manage the
		flow of code and remember to call `endDraw()`. If you don't need to draw large
		numbers of objects it's much safer and easier to use the `draw` method instead.
		
		The flow should be:
		
		```javascript
		// Call once:
		RenderTexture.beginDraw();
		
		// repeat n times:
		RenderTexture.batchDraw();
		// or
		RenderTexture.batchDrawFrame();
		
		// Call once:
		RenderTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Render Texture while the
		batch is still open, or call `beginDraw` again.
	**/
	function beginDraw():RenderTexture;
	/**
		Use this method if you have already called `beginDraw` and need to batch
		draw a large number of objects to this Render Texture.
		
		This method batches the drawing of the given objects to this Render Texture,
		without causing a bind or batch flush.
		
		It is faster than calling `draw`, but you must be very careful to manage the
		flow of code and remember to call `endDraw()`. If you don't need to draw large
		numbers of objects it's much safer and easier to use the `draw` method instead.
		
		The flow should be:
		
		```javascript
		// Call once:
		RenderTexture.beginDraw();
		
		// repeat n times:
		RenderTexture.batchDraw();
		// or
		RenderTexture.batchDrawFrame();
		
		// Call once:
		RenderTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Render Texture while the
		batch is still open, or call `beginDraw` again.
		
		Draws the given object, or an array of objects, to this Render Texture.
		
		It can accept any of the following:
		
		* Any renderable Game Object, such as a Sprite, Text, Graphics or TileSprite.
		* Tilemap Layers.
		* A Group. The contents of which will be iterated and drawn in turn.
		* A Container. The contents of which will be iterated fully, and drawn in turn.
		* A Scene's Display List. Pass in `Scene.children` to draw the whole list.
		* Another Render Texture.
		* A Texture Frame instance.
		* A string. This is used to look-up a texture from the Texture Manager.
		
		Note: You cannot draw a Render Texture to itself.
		
		If passing in a Group or Container it will only draw children that return `true`
		when their `willRender()` method is called. I.e. a Container with 10 children,
		5 of which have `visible=false` will only draw the 5 visible ones.
		
		If passing in an array of Game Objects it will draw them all, regardless if
		they pass a `willRender` check or not.
		
		You can pass in a string in which case it will look for a texture in the Texture
		Manager matching that string, and draw the base frame. If you need to specify
		exactly which frame to draw then use the method `drawFrame` instead.
		
		You can pass in the `x` and `y` coordinates to draw the objects at. The use of
		the coordinates differ based on what objects are being drawn. If the object is
		a Group, Container or Display List, the coordinates are _added_ to the positions
		of the children. For all other types of object, the coordinates are exact.
		
		The `alpha` and `tint` values are only used by Texture Frames.
		Game Objects use their own alpha and tint values when being drawn.
	**/
	function batchDraw(entries:Dynamic, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):RenderTexture;
	/**
		Use this method if you have already called `beginDraw` and need to batch
		draw a large number of texture frames to this Render Texture.
		
		This method batches the drawing of the given frames to this Render Texture,
		without causing a bind or batch flush.
		
		It is faster than calling `drawFrame`, but you must be very careful to manage the
		flow of code and remember to call `endDraw()`. If you don't need to draw large
		numbers of frames it's much safer and easier to use the `drawFrame` method instead.
		
		The flow should be:
		
		```javascript
		// Call once:
		RenderTexture.beginDraw();
		
		// repeat n times:
		RenderTexture.batchDraw();
		// or
		RenderTexture.batchDrawFrame();
		
		// Call once:
		RenderTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Render Texture while the
		batch is still open, or call `beginDraw` again.
		
		Draws the Texture Frame to the Render Texture at the given position.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
		
		```javascript
		var rt = this.add.renderTexture(0, 0, 800, 600);
		rt.drawFrame(key, frame);
		```
		
		You can optionally provide a position, alpha and tint value to apply to the frame
		before it is drawn.
		
		Calling this method will cause a batch flush, so if you've got a stack of things to draw
		in a tight loop, try using the `draw` method instead.
		
		If you need to draw a Sprite to this Render Texture, use the `draw` method instead.
	**/
	function batchDrawFrame(key:String, ?frame:ts.AnyOf2<String, Float>, ?x:Float, ?y:Float, ?alpha:Float, ?tint:Float):RenderTexture;
	/**
		Use this method to finish batch drawing to this Render Texture.
		
		Never call this method without first calling `beginDraw`.
		
		It is faster than calling `draw`, but you must be very careful to manage the
		flow of code and remember to call `endDraw()`. If you don't need to draw large
		numbers of objects it's much safer and easier to use the `draw` method instead.
		
		The flow should be:
		
		```javascript
		// Call once:
		RenderTexture.beginDraw();
		
		// repeat n times:
		RenderTexture.batchDraw();
		// or
		RenderTexture.batchDrawFrame();
		
		// Call once:
		RenderTexture.endDraw();
		```
		
		Do not call any methods other than `batchDraw`, `batchDrawFrame`, or `endDraw` once you
		have started a batch. Also, be very careful not to destroy this Render Texture while the
		batch is still open, or call `beginDraw` again.
	**/
	function endDraw():RenderTexture;
	/**
		Takes a snapshot of the given area of this Render Texture.
		
		The snapshot is taken immediately.
		
		To capture the whole Render Texture see the `snapshot` method. To capture a specific pixel, see `snapshotPixel`.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer into an ArrayBufferView.
		It then parses this, copying the contents to a temporary Canvas and finally creating an Image object from it,
		which is the image returned to the callback provided. All in all, this is a computationally expensive and blocking process,
		which gets more expensive the larger the canvas size gets, so please be careful how you employ this in your game.
	**/
	function snapshotArea(x:Float, y:Float, width:Float, height:Float, callback:global.phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):RenderTexture;
	/**
		Takes a snapshot of the whole of this Render Texture.
		
		The snapshot is taken immediately.
		
		To capture just a portion of the Render Texture see the `snapshotArea` method. To capture a specific pixel, see `snapshotPixel`.
		
		Snapshots work by using the WebGL `readPixels` feature to grab every pixel from the frame buffer into an ArrayBufferView.
		It then parses this, copying the contents to a temporary Canvas and finally creating an Image object from it,
		which is the image returned to the callback provided. All in all, this is a computationally expensive and blocking process,
		which gets more expensive the larger the canvas size gets, so please be careful how you employ this in your game.
	**/
	function snapshot(callback:global.phaser.types.renderer.snapshot.SnapshotCallback, ?type:String, ?encoderOptions:Float):RenderTexture;
	/**
		Takes a snapshot of the given pixel from this Render Texture.
		
		The snapshot is taken immediately.
		
		To capture the whole Render Texture see the `snapshot` method. To capture a specific portion, see `snapshotArea`.
		
		Unlike the other two snapshot methods, this one will send your callback a `Color` object containing the color data for
		the requested pixel. It doesn't need to create an internal Canvas or Image object, so is a lot faster to execute,
		using less memory, than the other snapshot methods.
	**/
	function snapshotPixel(x:Float, y:Float, callback:global.phaser.types.renderer.snapshot.SnapshotCallback):RenderTexture;
	/**
		Internal destroy handler, called as part of the destroy process.
	**/
	private function preDestroy():Void;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():RenderTexture;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
		
		If your game is running under WebGL you can optionally specify four different alpha values, each of which
		correspond to the four corners of the Game Object. Under Canvas only the `topLeft` value given is used.
	**/
	function setAlpha(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):RenderTexture;
	/**
		The alpha value of the Game Object.
		
		This is a global value, impacting the entire Game Object, not just a region of it.
	**/
	var alpha : Float;
	/**
		The alpha value starting from the top-left of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaTopLeft : Float;
	/**
		The alpha value starting from the top-right of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaTopRight : Float;
	/**
		The alpha value starting from the bottom-left of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaBottomLeft : Float;
	/**
		The alpha value starting from the bottom-right of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
	**/
	var alphaBottomRight : Float;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency of which blend modes
		are used.
	**/
	var blendMode : ts.AnyOf2<String, global.phaser.BlendModes>;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE (only works when rendering to a framebuffer, like a Render Texture)
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency in which blend modes
		are used.
	**/
	function setBlendMode(value:ts.AnyOf2<String, global.phaser.BlendModes>):RenderTexture;
	/**
		The native (un-scaled) width of this Game Object.
		
		Changing this value will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or use
		the `displayWidth` property.
	**/
	var width : Float;
	/**
		The native (un-scaled) height of this Game Object.
		
		Changing this value will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or use
		the `displayHeight` property.
	**/
	var height : Float;
	/**
		The displayed width of this Game Object.
		
		This value takes into account the scale factor.
		
		Setting this value will adjust the Game Object's scale property.
	**/
	var displayWidth : Float;
	/**
		The displayed height of this Game Object.
		
		This value takes into account the scale factor.
		
		Setting this value will adjust the Game Object's scale property.
	**/
	var displayHeight : Float;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):RenderTexture;
	/**
		A boolean flag indicating if this Game Object is being cropped or not.
		You can toggle this at any time after `setCrop` has been called, to turn cropping on or off.
		Equally, calling `setCrop` with no arguments will reset the crop and disable it.
	**/
	var isCropped : Bool;
	/**
		Applies a crop to a texture based Game Object, such as a Sprite or Image.
		
		The crop is a rectangle that limits the area of the texture frame that is visible during rendering.
		
		Cropping a Game Object does not change its size, dimensions, physics body or hit area, it just
		changes what is shown when rendered.
		
		The crop coordinates are relative to the texture frame, not the Game Object, meaning 0 x 0 is the top-left.
		
		Therefore, if you had a Game Object that had an 800x600 sized texture, and you wanted to show only the left
		half of it, you could call `setCrop(0, 0, 400, 600)`.
		
		It is also scaled to match the Game Object scale automatically. Therefore a crop rect of 100x50 would crop
		an area of 200x100 when applied to a Game Object that had a scale factor of 2.
		
		You can either pass in numeric values directly, or you can provide a single Rectangle object as the first argument.
		
		Call this method with no arguments at all to reset the crop, or toggle the property `isCropped` to `false`.
		
		You should do this if the crop rectangle becomes the same size as the frame itself, as it will allow
		the renderer to skip several internal calculations.
	**/
	function setCrop(?x:ts.AnyOf2<Float, global.phaser.geom.Rectangle>, ?y:Float, ?width:Float, ?height:Float):RenderTexture;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	var depth : Float;
	/**
		The depth of this Game Object within the Scene.
		
		The depth is also known as the 'z-index' in some environments, and allows you to change the rendering order
		of Game Objects, without actually moving their position in the display list.
		
		The default depth is zero. A Game Object with a higher depth
		value will always render in front of one with a lower value.
		
		Setting the depth will queue a depth sort event within the Scene.
	**/
	function setDepth(value:Float):RenderTexture;
	/**
		The horizontally flipped state of the Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	var flipX : Bool;
	/**
		The vertically flipped state of the Game Object.
		
		A Game Object that is flipped vertically will render inversed on the vertical axis (i.e. upside down)
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	var flipY : Bool;
	/**
		Toggles the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function toggleFlipX():RenderTexture;
	/**
		Toggles the vertical flipped state of this Game Object.
	**/
	function toggleFlipY():RenderTexture;
	/**
		Sets the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlipX(value:Bool):RenderTexture;
	/**
		Sets the vertical flipped state of this Game Object.
	**/
	function setFlipY(value:Bool):RenderTexture;
	/**
		Sets the horizontal and vertical flipped state of this Game Object.
		
		A Game Object that is flipped will render inversed on the flipped axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlip(x:Bool, y:Bool):RenderTexture;
	/**
		Resets the horizontal and vertical flipped state of this Game Object back to their default un-flipped state.
	**/
	function resetFlip():RenderTexture;
	/**
		Gets the center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getCenter<O>(?output:O):O;
	/**
		Gets the top-left corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the top-right corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getTopRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the left-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getLeftCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the right-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getRightCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-left corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomLeft<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-center coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomCenter<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bottom-right corner coordinate of this Game Object, regardless of origin.
		The returned point is calculated in local space and does not factor in any parent containers
	**/
	function getBottomRight<O>(?output:O, ?includeParent:Bool):O;
	/**
		Gets the bounds of this Game Object, regardless of origin.
		The values are stored and returned in a Rectangle, or Rectangle-like, object.
	**/
	function getBounds<O>(?output:O):O;
	/**
		The Mask this Game Object is using during render.
	**/
	var mask : ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>;
	/**
		Sets the mask that this Game Object will use to render with.
		
		The mask must have been previously created and can be either a GeometryMask or a BitmapMask.
		Note: Bitmap Masks only work on WebGL. Geometry Masks work on both WebGL and Canvas.
		
		If a mask is already set on this Game Object it will be immediately replaced.
		
		Masks are positioned in global space and are not relative to the Game Object to which they
		are applied. The reason for this is that multiple Game Objects can all share the same mask.
		
		Masks have no impact on physics or input detection. They are purely a rendering component
		that allows you to limit what is visible during the render pass.
	**/
	function setMask(mask:ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>):RenderTexture;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):RenderTexture;
	/**
		Creates and returns a Bitmap Mask. This mask can be used by any Game Object,
		including this one.
		
		Note: Bitmap Masks only work on WebGL. Geometry Masks work on both WebGL and Canvas.
		
		To create the mask you need to pass in a reference to a renderable Game Object.
		A renderable Game Object is one that uses a texture to render with, such as an
		Image, Sprite, Render Texture or BitmapText.
		
		If you do not provide a renderable object, and this Game Object has a texture,
		it will use itself as the object. This means you can call this method to create
		a Bitmap Mask from any renderable Game Object.
	**/
	function createBitmapMask(?renderable:GameObject):global.phaser.display.masks.BitmapMask;
	/**
		Creates and returns a Geometry Mask. This mask can be used by any Game Object,
		including this one.
		
		To create the mask you need to pass in a reference to a Graphics Game Object.
		
		If you do not provide a graphics object, and this Game Object is an instance
		of a Graphics object, then it will use itself to create the mask.
		
		This means you can call this method to create a Geometry Mask from any Graphics Game Object.
	**/
	function createGeometryMask(?graphics:Graphics):global.phaser.display.masks.GeometryMask;
	/**
		The horizontal origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the left of the Game Object.
	**/
	var originX : Float;
	/**
		The vertical origin of this Game Object.
		The origin maps the relationship between the size and position of the Game Object.
		The default value is 0.5, meaning all Game Objects are positioned based on their center.
		Setting the value to 0 means the position now relates to the top of the Game Object.
	**/
	var originY : Float;
	/**
		The horizontal display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginX : Float;
	/**
		The vertical display origin of this Game Object.
		The origin is a normalized value between 0 and 1.
		The displayOrigin is a pixel value, based on the size of the Game Object combined with the origin.
	**/
	var displayOriginY : Float;
	/**
		Sets the origin of this Game Object.
		
		The values are given in the range 0 to 1.
	**/
	function setOrigin(?x:Float, ?y:Float):RenderTexture;
	/**
		Sets the origin of this Game Object based on the Pivot values in its Frame.
	**/
	function setOriginFromFrame():RenderTexture;
	/**
		Sets the display origin of this Game Object.
		The difference between this and setting the origin is that you can use pixel values for setting the display origin.
	**/
	function setDisplayOrigin(?x:Float, ?y:Float):RenderTexture;
	/**
		Updates the Display Origin cached values internally stored on this Game Object.
		You don't usually call this directly, but it is exposed for edge-cases where you may.
	**/
	function updateDisplayOrigin():RenderTexture;
	/**
		The initial WebGL pipeline of this Game Object.
		
		If you call `resetPipeline` on this Game Object, the pipeline is reset to this default.
	**/
	var defaultPipeline : global.phaser.renderer.webgl.WebGLPipeline;
	/**
		The current WebGL pipeline of this Game Object.
	**/
	var pipeline : global.phaser.renderer.webgl.WebGLPipeline;
	/**
		Does this Game Object have any Post Pipelines set?
	**/
	var hasPostPipeline : Bool;
	/**
		The WebGL Post FX Pipelines this Game Object uses for post-render effects.
		
		The pipelines are processed in the order in which they appear in this array.
		
		If you modify this array directly, be sure to set the
		`hasPostPipeline` property accordingly.
	**/
	var postPipeline : Array<global.phaser.renderer.webgl.pipelines.PostFXPipeline>;
	/**
		An object to store pipeline specific data in, to be read by the pipelines this Game Object uses.
	**/
	var pipelineData : Dynamic;
	/**
		Sets the initial WebGL Pipeline of this Game Object.
		
		This should only be called during the instantiation of the Game Object. After that, use `setPipeline`.
	**/
	function initPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.WebGLPipeline>):Bool;
	/**
		Sets the main WebGL Pipeline of this Game Object.
		
		Also sets the `pipelineData` property, if the parameter is given.
		
		Both the pipeline and post pipelines share the same pipeline data object.
	**/
	function setPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):RenderTexture;
	/**
		Sets one, or more, Post Pipelines on this Game Object.
		
		Post Pipelines are invoked after this Game Object has rendered to its target and
		are commonly used for post-fx.
		
		The post pipelines are appended to the `postPipelines` array belonging to this
		Game Object. When the renderer processes this Game Object, it iterates through the post
		pipelines in the order in which they appear in the array. If you are stacking together
		multiple effects, be aware that the order is important.
		
		If you call this method multiple times, the new pipelines will be appended to any existing
		post pipelines already set. Use the `resetPostPipeline` method to clear them first, if required.
		
		You can optionally also sets the `pipelineData` property, if the parameter is given.
		
		Both the pipeline and post pipelines share the pipeline data object together.
	**/
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<haxe.Constraints.Function>, Array<String>, global.phaser.renderer.webgl.pipelines.PostFXPipeline, Array<global.phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):RenderTexture;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
		
		Both the pipeline and post pipelines share the pipeline data object together.
	**/
	function setPipelineData(key:String, ?value:Dynamic):RenderTexture;
	/**
		Gets a Post Pipeline instance from this Game Object, based on the given name, and returns it.
	**/
	function getPostPipeline(pipeline:ts.AnyOf3<String, haxe.Constraints.Function, global.phaser.renderer.webgl.pipelines.PostFXPipeline>):ts.AnyOf2<global.phaser.renderer.webgl.pipelines.PostFXPipeline, Array<global.phaser.renderer.webgl.pipelines.PostFXPipeline>>;
	/**
		Resets the WebGL Pipeline of this Game Object back to the default it was created with.
	**/
	function resetPipeline(?resetPostPipelines:Bool, ?resetData:Bool):Bool;
	/**
		Resets the WebGL Post Pipelines of this Game Object. It does this by calling
		the `destroy` method on each post pipeline and then clearing the local array.
	**/
	function resetPostPipeline(?resetData:Bool):Void;
	/**
		Removes a type of Post Pipeline instances from this Game Object, based on the given name, and destroys them.
		
		If you wish to remove all Post Pipelines use the `resetPostPipeline` method instead.
	**/
	function removePostPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.pipelines.PostFXPipeline>):RenderTexture;
	/**
		Gets the name of the WebGL Pipeline this Game Object is currently using.
	**/
	function getPipelineName():String;
	/**
		The horizontal scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorX : Float;
	/**
		The vertical scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorY : Float;
	/**
		Sets the scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	function setScrollFactor(x:Float, ?y:Float):RenderTexture;
	/**
		The tint value being applied to the top-left vertice of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
		The value should be set as a hex number, i.e. 0xff0000 for red, or 0xff00ff for purple.
	**/
	var tintTopLeft : Float;
	/**
		The tint value being applied to the top-right vertice of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
		The value should be set as a hex number, i.e. 0xff0000 for red, or 0xff00ff for purple.
	**/
	var tintTopRight : Float;
	/**
		The tint value being applied to the bottom-left vertice of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
		The value should be set as a hex number, i.e. 0xff0000 for red, or 0xff00ff for purple.
	**/
	var tintBottomLeft : Float;
	/**
		The tint value being applied to the bottom-right vertice of the Game Object.
		This value is interpolated from the corner to the center of the Game Object.
		The value should be set as a hex number, i.e. 0xff0000 for red, or 0xff00ff for purple.
	**/
	var tintBottomRight : Float;
	/**
		The tint fill mode.
		
		`false` = An additive tint (the default), where vertices colors are blended with the texture.
		`true` = A fill tint, where the vertices colors replace the texture, but respects texture alpha.
	**/
	var tintFill : Bool;
	/**
		Clears all tint values associated with this Game Object.
		
		Immediately sets the color values back to 0xffffff and the tint type to 'additive',
		which results in no visible change to the texture.
	**/
	function clearTint():RenderTexture;
	/**
		Sets an additive tint on this Game Object.
		
		The tint works by taking the pixel color values from the Game Objects texture, and then
		multiplying it by the color value of the tint. You can provide either one color value,
		in which case the whole Game Object will be tinted in that color. Or you can provide a color
		per corner. The colors are blended together across the extent of the Game Object.
		
		To modify the tint color once set, either call this method again with new values or use the
		`tint` property to set all colors at once. Or, use the properties `tintTopLeft`, `tintTopRight,
		`tintBottomLeft` and `tintBottomRight` to set the corner color values independently.
		
		To remove a tint call `clearTint`.
		
		To swap this from being an additive tint to a fill based tint set the property `tintFill` to `true`.
	**/
	function setTint(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):RenderTexture;
	/**
		Sets a fill-based tint on this Game Object.
		
		Unlike an additive tint, a fill-tint literally replaces the pixel colors from the texture
		with those in the tint. You can use this for effects such as making a player flash 'white'
		if hit by something. You can provide either one color value, in which case the whole
		Game Object will be rendered in that color. Or you can provide a color per corner. The colors
		are blended together across the extent of the Game Object.
		
		To modify the tint color once set, either call this method again with new values or use the
		`tint` property to set all colors at once. Or, use the properties `tintTopLeft`, `tintTopRight,
		`tintBottomLeft` and `tintBottomRight` to set the corner color values independently.
		
		To remove a tint call `clearTint`.
		
		To swap this from being a fill-tint to an additive tint set the property `tintFill` to `false`.
	**/
	function setTintFill(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):RenderTexture;
	/**
		The tint value being applied to the whole of the Game Object.
		This property is a setter-only. Use the properties `tintTopLeft` etc to read the current tint value.
	**/
	var tint : Float;
	/**
		Does this Game Object have a tint applied?
		
		It checks to see if the 4 tint properties are set to the value 0xffffff
		and that the `tintFill` property is `false`. This indicates that a Game Object isn't tinted.
	**/
	final isTinted : Bool;
	/**
		The x position of this Game Object.
	**/
	var x : Float;
	/**
		The y position of this Game Object.
	**/
	var y : Float;
	/**
		The z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#depth} instead.
	**/
	var z : Float;
	/**
		The w position of this Game Object.
	**/
	var w : Float;
	/**
		This is a special setter that allows you to set both the horizontal and vertical scale of this Game Object
		to the same value, at the same time. When reading this value the result returned is `(scaleX + scaleY) / 2`.
		
		Use of this property implies you wish the horizontal and vertical scales to be equal to each other. If this
		isn't the case, use the `scaleX` or `scaleY` properties instead.
	**/
	var scale : Float;
	/**
		The horizontal scale of this Game Object.
	**/
	var scaleX : Float;
	/**
		The vertical scale of this Game Object.
	**/
	var scaleY : Float;
	/**
		The angle of this Game Object as expressed in degrees.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, 90 is down, 180/-180 is left
		and -90 is up.
		
		If you prefer to work in radians, see the `rotation` property instead.
	**/
	var angle : Float;
	/**
		The angle of this Game Object in radians.
		
		Phaser uses a right-hand clockwise rotation system, where 0 is right, PI/2 is down, +-PI is left
		and -PI/2 is up.
		
		If you prefer to work in degrees, see the `angle` property instead.
	**/
	var rotation : Float;
	/**
		Sets the position of this Game Object.
	**/
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):RenderTexture;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<global.phaser.types.math.Vector2Like, global.phaser.types.math.Vector3Like, global.phaser.types.math.Vector4Like>):RenderTexture;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):RenderTexture;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):RenderTexture;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):RenderTexture;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(x:Float, ?y:Float):RenderTexture;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):RenderTexture;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):RenderTexture;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):RenderTexture;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):RenderTexture;
	/**
		Gets the local transform matrix for this Game Object.
	**/
	function getLocalTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
	/**
		Gets the world transform matrix for this Game Object, factoring in any parent Containers.
	**/
	function getWorldTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix, ?parentMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
	/**
		Takes the given `x` and `y` coordinates and converts them into local space for this
		Game Object, taking into account parent and local transforms, and the Display Origin.
		
		The returned Vector2 contains the translated point in its properties.
		
		A Camera needs to be provided in order to handle modified scroll factors. If no
		camera is specified, it will use the `main` camera from the Scene to which this
		Game Object belongs.
	**/
	function getLocalPoint(x:Float, y:Float, ?point:global.phaser.math.Vector2, ?camera:global.phaser.cameras.scene2d.Camera):global.phaser.math.Vector2;
	/**
		Gets the sum total rotation of all of this Game Objects parent Containers.
		
		The returned value is in radians and will be zero if this Game Object has no parent container.
	**/
	function getParentRotation():Float;
	/**
		The visible state of the Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	var visible : Bool;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):RenderTexture;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):RenderTexture;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):RenderTexture;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):RenderTexture;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():RenderTexture;
	/**
		Allows you to store a key value pair within this Game Objects Data Manager.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		```javascript
		sprite.setData('name', 'Red Gem Stone');
		```
		
		You can also pass in an object of key value pairs as the first argument:
		
		```javascript
		sprite.setData({ name: 'Red Gem Stone', level: 2, owner: 'Link', gold: 50 });
		```
		
		To get a value back again you can call `getData`:
		
		```javascript
		sprite.getData('gold');
		```
		
		Or you can access the value directly via the `values` property, where it works like any other variable:
		
		```javascript
		sprite.data.values.gold += 50;
		```
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
		
		If the key already exists, a `changedata` event is emitted instead, along an event named after the key.
		For example, if you updated an existing key called `PlayerLives` then it would emit the event `changedata-PlayerLives`.
		These events will be emitted regardless if you use this method to set the value, or the direct `values` setter.
		
		Please note that the data keys are case-sensitive and must be valid JavaScript Object property strings.
		This means the keys `gold` and `Gold` are treated as two unique values within the Data Manager.
	**/
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):RenderTexture;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):RenderTexture;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):RenderTexture;
	/**
		Pass this Game Object to the Input Manager to enable it for Input.
		
		Input works by using hit areas, these are nearly always geometric shapes, such as rectangles or circles, that act as the hit area
		for the Game Object. However, you can provide your own hit area shape and callback, should you wish to handle some more advanced
		input detection.
		
		If no arguments are provided it will try and create a rectangle hit area based on the texture frame the Game Object is using. If
		this isn't a texture-bound object, such as a Graphics or BitmapText object, this will fail, and you'll need to provide a specific
		shape for it to use.
		
		You can also provide an Input Configuration Object as the only argument to this method.
	**/
	function setInteractive(?hitArea:Dynamic, ?callback:global.phaser.types.input.HitAreaCallback, ?dropZone:Bool):RenderTexture;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():RenderTexture;
	/**
		If this Game Object has previously been enabled for input, this will queue it
		for removal, causing it to no longer be interactive. The removal happens on
		the next game step, it is not immediate.
		
		The Interactive Object that was assigned to this Game Object will be destroyed,
		removed from the Input Manager and cleared from this Game Object.
		
		If you wish to re-enable this Game Object at a later date you will need to
		re-create its InteractiveObject by calling `setInteractive` again.
		
		If you wish to only temporarily stop an object from receiving input then use
		`disableInteractive` instead, as that toggles the interactive state, where-as
		this erases it completely.
		
		If you wish to resize a hit area, don't remove and then set it as being
		interactive. Instead, access the hitarea object directly and resize the shape
		being used. I.e.: `sprite.input.hitArea.setSize(width, height)` (assuming the
		shape is a Rectangle, which it is by default.)
	**/
	function removeInteractive():RenderTexture;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):RenderTexture;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):RenderTexture;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):RenderTexture;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):RenderTexture;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):RenderTexture;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):RenderTexture;
	static var prototype : RenderTexture;
}