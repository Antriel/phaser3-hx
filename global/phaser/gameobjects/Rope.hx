package global.phaser.gameobjects;

/**
	A Rope Game Object.
	
	The Rope object is WebGL only and does not have a Canvas counterpart.
	
	A Rope is a special kind of Game Object that has a texture that repeats along its entire length.
	Unlike a Sprite, it isn't restricted to using just a quad and can have as many vertices as you define
	when creating it. The vertices can be arranged in a horizontal or vertical strip and have their own
	color and alpha values as well.
	
	A Ropes origin is always 0.5 x 0.5 and cannot be changed.
**/
@:native("Phaser.GameObjects.Rope") extern class Rope extends GameObject {
	function new(scene:global.phaser.Scene, ?x:Float, ?y:Float, ?texture:String, ?frame:ts.AnyOf2<String, Float>, ?points:ts.AnyOf2<Float, Array<global.phaser.types.math.Vector2Like>>, ?horizontal:Bool, ?colors:Array<Float>, ?alphas:Array<Float>);
	/**
		The Animation State of this Rope.
	**/
	var anims : global.phaser.animations.AnimationState;
	/**
		An array containing the points data for this Rope.
		
		Each point should be given as a Vector2Like object (i.e. a Vector2, Geom.Point or object with public x/y properties).
		
		The point coordinates are given in local space, where 0 x 0 is the start of the Rope strip.
		
		You can modify the contents of this array directly in real-time to create interesting effects.
		If you do so, be sure to call `setDirty` _after_ modifying this array, so that the vertices data is
		updated before the next render. Alternatively, you can use the `setPoints` method instead.
		
		Should you need to change the _size_ of this array, then you should always use the `setPoints` method.
	**/
	var points : Array<global.phaser.types.math.Vector2Like>;
	/**
		An array containing the vertices data for this Rope.
		
		This data is calculated automatically in the `updateVertices` method, based on the points provided.
	**/
	var vertices : js.lib.Float32Array;
	/**
		An array containing the uv data for this Rope.
		
		This data is calculated automatically in the `setPoints` method, based on the points provided.
	**/
	var uv : js.lib.Float32Array;
	/**
		An array containing the color data for this Rope.
		
		Colors should be given as numeric RGB values, such as 0xff0000.
		You should provide _two_ color values for every point in the Rope, one for the top and one for the bottom of each quad.
		
		You can modify the contents of this array directly in real-time, however, should you need to change the _size_
		of the array, then you should use the `setColors` method instead.
	**/
	var colors : js.lib.Uint32Array;
	/**
		An array containing the alpha data for this Rope.
		
		Alphas should be given as float values, such as 0.5.
		You should provide _two_ alpha values for every point in the Rope, one for the top and one for the bottom of each quad.
		
		You can modify the contents of this array directly in real-time, however, should you need to change the _size_
		of the array, then you should use the `setAlphas` method instead.
	**/
	var alphas : js.lib.Float32Array;
	/**
		The tint fill mode.
		
		`false` = An additive tint (the default), where vertices colors are blended with the texture.
		`true` = A fill tint, where the vertices colors replace the texture, but respects texture alpha.
	**/
	var tintFill : Bool;
	/**
		If the Rope is marked as `dirty` it will automatically recalculate its vertices
		the next time it renders. You can also force this by calling `updateVertices`.
	**/
	var dirty : Bool;
	/**
		Are the Rope vertices aligned horizontally, in a strip, or vertically, in a column?
		
		This property is set during instantiation and cannot be changed directly.
		See the `setVertical` and `setHorizontal` methods.
	**/
	final horizontal : Bool;
	/**
		You can optionally choose to render the vertices of this Rope to a Graphics instance.
		
		Achieve this by setting the `debugCallback` and the `debugGraphic` properties.
		
		You can do this in a single call via the `Rope.setDebug` method, which will use the
		built-in debug function. You can also set it to your own callback. The callback
		will be invoked _once per render_ and sent the following parameters:
		
		`debugCallback(src, meshLength, verts)`
		
		`src` is the Rope instance being debugged.
		`meshLength` is the number of mesh vertices in total.
		`verts` is an array of the translated vertex coordinates.
		
		To disable rendering, set this property back to `null`.
	**/
	var debugCallback : haxe.Constraints.Function;
	/**
		The Graphics instance that the debug vertices will be drawn to, if `setDebug` has
		been called.
	**/
	var debugGraphic : Graphics;
	/**
		The Rope update loop.
	**/
	private function preUpdate(time:Float, delta:Float):Void;
	/**
		Start playing the given animation.
	**/
	function play(key:String, ?ignoreIfPlaying:Bool, ?startFrame:Float):Rope;
	/**
		Flags this Rope as being dirty. A dirty rope will recalculate all of its vertices data
		the _next_ time it renders. You should set this rope as dirty if you update the points
		array directly.
	**/
	function setDirty():Rope;
	/**
		Sets the alignment of the points in this Rope to be horizontal, in a strip format.
		
		Calling this method will reset this Rope. The current points, vertices, colors and alpha
		values will be reset to thoes values given as parameters.
	**/
	function setHorizontal(?points:ts.AnyOf2<Float, Array<global.phaser.types.math.Vector2Like>>, ?colors:ts.AnyOf2<Float, Array<Float>>, ?alphas:ts.AnyOf2<Float, Array<Float>>):Rope;
	/**
		Sets the alignment of the points in this Rope to be vertical, in a column format.
		
		Calling this method will reset this Rope. The current points, vertices, colors and alpha
		values will be reset to thoes values given as parameters.
	**/
	function setVertical(?points:ts.AnyOf2<Float, Array<global.phaser.types.math.Vector2Like>>, ?colors:ts.AnyOf2<Float, Array<Float>>, ?alphas:ts.AnyOf2<Float, Array<Float>>):Rope;
	/**
		Sets the tint fill mode.
		
		Mode 0 (`false`) is an additive tint, the default, which blends the vertices colors with the texture.
		This mode respects the texture alpha.
		
		Mode 1 (`true`) is a fill tint. Unlike an additive tint, a fill-tint literally replaces the pixel colors
		from the texture with those in the tint. You can use this for effects such as making a player flash 'white'
		if hit by something. This mode respects the texture alpha.
		
		See the `setColors` method for details of how to color each of the vertices.
	**/
	function setTintFill(?value:Bool):Rope;
	/**
		Set the alpha values used by the Rope during rendering.
		
		You can provide the values in a number of ways:
		
		1) One single numeric value: `setAlphas(0.5)` - This will set a single alpha for the whole Rope.
		2) Two numeric value: `setAlphas(1, 0.5)` - This will set a 'top' and 'bottom' alpha value across the whole Rope.
		3) An array of values: `setAlphas([ 1, 0.5, 0.2 ])`
		
		If you provide an array of values and the array has exactly the same number of values as `points` in the Rope, it
		will use each alpha value per rope segment.
		
		If the provided array has a different number of values than `points` then it will use the values in order, from
		the first Rope segment and on, until it runs out of values. This allows you to control the alpha values at all
		vertices in the Rope.
		
		Note this method is called `setAlphas` (plural) and not `setAlpha`.
	**/
	function setAlphas(?alphas:ts.AnyOf2<Float, Array<Float>>, ?bottomAlpha:Float):Rope;
	/**
		Set the color values used by the Rope during rendering.
		
		Colors are used to control the level of tint applied across the Rope texture.
		
		You can provide the values in a number of ways:
		
		* One single numeric value: `setColors(0xff0000)` - This will set a single color tint for the whole Rope.
		* An array of values: `setColors([ 0xff0000, 0x00ff00, 0x0000ff ])`
		
		If you provide an array of values and the array has exactly the same number of values as `points` in the Rope, it
		will use each color per rope segment.
		
		If the provided array has a different number of values than `points` then it will use the values in order, from
		the first Rope segment and on, until it runs out of values. This allows you to control the color values at all
		vertices in the Rope.
	**/
	function setColors(?colors:ts.AnyOf2<Float, Array<Float>>):Rope;
	/**
		Sets the points used by this Rope.
		
		The points should be provided as an array of Vector2, or vector2-like objects (i.e. those with public x/y properties).
		
		Each point corresponds to one segment of the Rope. The more points in the array, the more segments the rope has.
		
		Point coordinates are given in local-space, not world-space, and are directly related to the size of the texture
		this Rope object is using.
		
		For example, a Rope using a 512 px wide texture, split into 4 segments (128px each) would use the following points:
		
		```javascript
		rope.setPoints([
		   { x: 0, y: 0 },
		   { x: 128, y: 0 },
		   { x: 256, y: 0 },
		   { x: 384, y: 0 }
		]);
		```
		
		Or, you can provide an integer to do the same thing:
		
		```javascript
		rope.setPoints(4);
		```
		
		Which will divide the Rope into 4 equally sized segments based on the frame width.
		
		Note that calling this method with a different number of points than the Rope has currently will
		_reset_ the color and alpha values, unless you provide them as arguments to this method.
	**/
	function setPoints(?points:ts.AnyOf2<Float, Array<global.phaser.types.math.Vector2Like>>, ?colors:ts.AnyOf2<Float, Array<Float>>, ?alphas:ts.AnyOf2<Float, Array<Float>>):Rope;
	/**
		Updates all of the UVs based on the Rope.points and `flipX` and `flipY` settings.
	**/
	function updateUVs():Rope;
	/**
		Resizes all of the internal arrays: `vertices`, `uv`, `colors` and `alphas` to the new
		given Rope segment total.
	**/
	function resizeArrays(newSize:Float):Rope;
	/**
		Updates the vertices based on the Rope points.
		
		This method is called automatically during rendering if `Rope.dirty` is `true`, which is set
		by the `setPoints` and `setDirty` methods. You should flag the Rope as being dirty if you modify
		the Rope points directly.
	**/
	function updateVertices():Rope;
	/**
		This method enables rendering of the Rope vertices to the given Graphics instance.
		
		If you enable this feature, you **must** call `Graphics.clear()` in your Scene `update`,
		otherwise the Graphics instance you provide to debug will fill-up with draw calls,
		eventually crashing the browser. This is not done automatically to allow you to debug
		draw multiple Rope objects to a single Graphics instance.
		
		The Rope class has a built-in debug rendering callback `Rope.renderDebugVerts`, however
		you can also provide your own callback to be used instead. Do this by setting the `callback` parameter.
		
		The callback is invoked _once per render_ and sent the following parameters:
		
		`callback(src, meshLength, verts)`
		
		`src` is the Rope instance being debugged.
		`meshLength` is the number of mesh vertices in total.
		`verts` is an array of the translated vertex coordinates.
		
		If using your own callback you do not have to provide a Graphics instance to this method.
		
		To disable debug rendering, to either your own callback or the built-in one, call this method
		with no arguments.
	**/
	function setDebug(?graphic:Graphics, ?callback:haxe.Constraints.Function):Rope;
	/**
		The built-in Rope vertices debug rendering method.
		
		See `Rope.setDebug` for more details.
	**/
	function renderDebugVerts(src:Rope, meshLength:Float, verts:Array<Float>):Void;
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
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():Rope;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
	**/
	function setAlpha(?value:Float):Rope;
	/**
		The alpha value of the Game Object.
		
		This is a global value, impacting the entire Game Object, not just a region of it.
	**/
	var alpha : Float;
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
	function setBlendMode(value:ts.AnyOf2<String, global.phaser.BlendModes>):Rope;
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
	function setDepth(value:Float):Rope;
	/**
		Toggles the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function toggleFlipX():Rope;
	/**
		Toggles the vertical flipped state of this Game Object.
	**/
	function toggleFlipY():Rope;
	/**
		Sets the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlipX(value:Bool):Rope;
	/**
		Sets the vertical flipped state of this Game Object.
	**/
	function setFlipY(value:Bool):Rope;
	/**
		Sets the horizontal and vertical flipped state of this Game Object.
		
		A Game Object that is flipped will render inversed on the flipped axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlip(x:Bool, y:Bool):Rope;
	/**
		Resets the horizontal and vertical flipped state of this Game Object back to their default un-flipped state.
	**/
	function resetFlip():Rope;
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
	function setMask(mask:ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>):Rope;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):Rope;
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
	function setPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):Rope;
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
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<haxe.Constraints.Function>, Array<String>, global.phaser.renderer.webgl.pipelines.PostFXPipeline, Array<global.phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):Rope;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
		
		Both the pipeline and post pipelines share the pipeline data object together.
	**/
	function setPipelineData(key:String, ?value:Dynamic):Rope;
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
	function removePostPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.pipelines.PostFXPipeline>):Rope;
	/**
		Gets the name of the WebGL Pipeline this Game Object is currently using.
	**/
	function getPipelineName():String;
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
		Sets the size of this Game Object to be that of the given Frame.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSizeToFrame(frame:global.phaser.textures.Frame):Rope;
	/**
		Sets the internal size of this Game Object, as used for frame or physics body creation.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSize(width:Float, height:Float):Rope;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):Rope;
	/**
		The Texture this Game Object is using to render with.
	**/
	var texture : ts.AnyOf2<global.phaser.textures.Texture, global.phaser.textures.CanvasTexture>;
	/**
		The Texture Frame this Game Object is using to render with.
	**/
	var frame : global.phaser.textures.Frame;
	/**
		Sets the texture and frame this Game Object will use to render with.
		
		Textures are referenced by their string-based keys, as stored in the Texture Manager.
	**/
	function setTexture(key:ts.AnyOf2<String, global.phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>):Rope;
	/**
		Sets the frame this Game Object will use to render with.
		
		The Frame has to belong to the current Texture being used.
		
		It can be either a string or an index.
		
		Calling `setFrame` will modify the `width` and `height` properties of your Game Object.
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setFrame(frame:ts.AnyOf2<String, Float>, ?updateSize:Bool, ?updateOrigin:Bool):Rope;
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
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):Rope;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<global.phaser.types.math.Vector2Like, global.phaser.types.math.Vector3Like, global.phaser.types.math.Vector4Like>):Rope;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):Rope;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):Rope;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):Rope;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(x:Float, ?y:Float):Rope;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):Rope;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):Rope;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):Rope;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):Rope;
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
	function setVisible(value:Bool):Rope;
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
	function setScrollFactor(x:Float, ?y:Float):Rope;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):Rope;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Rope;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):Rope;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():Rope;
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
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Rope;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Rope;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):Rope;
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
	function setInteractive(?hitArea:Dynamic, ?callback:global.phaser.types.input.HitAreaCallback, ?dropZone:Bool):Rope;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():Rope;
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
	function removeInteractive():Rope;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Rope;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Rope;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Rope;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Rope;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Rope;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Rope;
	static var prototype : Rope;
}