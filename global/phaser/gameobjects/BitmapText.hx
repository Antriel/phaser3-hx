package global.phaser.gameobjects;

/**
	BitmapText objects work by taking a texture file and an XML or JSON file that describes the font structure.
	
	During rendering for each letter of the text is rendered to the display, proportionally spaced out and aligned to
	match the font structure.
	
	BitmapText objects are less flexible than Text objects, in that they have less features such as shadows, fills and the ability
	to use Web Fonts, however you trade this flexibility for rendering speed. You can also create visually compelling BitmapTexts by
	processing the font texture in an image editor, applying fills and any other effects required.
	
	To create multi-line text insert \r, \n or \r\n escape codes into the text string.
	
	To create a BitmapText data files you need a 3rd party app such as:
	
	BMFont (Windows, free): {@link http://www.angelcode.com/products/bmfont/|http://www.angelcode.com/products/bmfont/}
	Glyph Designer (OS X, commercial): {@link http://www.71squared.com/en/glyphdesigner|http://www.71squared.com/en/glyphdesigner}
	Littera (Web-based, free): {@link http://kvazars.com/littera/|http://kvazars.com/littera/}
	
	For most use cases it is recommended to use XML. If you wish to use JSON, the formatting should be equal to the result of
	converting a valid XML file through the popular X2JS library. An online tool for conversion can be found here: {@link http://codebeautify.org/xmltojson|http://codebeautify.org/xmltojson}
**/
@:native("Phaser.GameObjects.BitmapText") extern class BitmapText extends GameObject {
	function new(scene:global.phaser.Scene, x:Float, y:Float, font:String, ?text:ts.AnyOf2<String, Array<String>>, ?size:Float, ?align:Float);
	/**
		The key of the Bitmap Font used by this Bitmap Text.
		To change the font after creation please use `setFont`.
	**/
	final font : String;
	/**
		The data of the Bitmap Font used by this Bitmap Text.
	**/
	final fontData : global.phaser.types.gameobjects.bitmaptext.BitmapFontData;
	/**
		The character code used to detect for word wrapping.
		Defaults to 32 (a space character).
	**/
	var wordWrapCharCode : Float;
	/**
		The horizontal offset of the drop shadow.
		
		You can set this directly, or use `Phaser.GameObjects.BitmapText#setDropShadow`.
	**/
	var dropShadowX : Float;
	/**
		The vertical offset of the drop shadow.
		
		You can set this directly, or use `Phaser.GameObjects.BitmapText#setDropShadow`.
	**/
	var dropShadowY : Float;
	/**
		The color of the drop shadow.
		
		You can set this directly, or use `Phaser.GameObjects.BitmapText#setDropShadow`.
	**/
	var dropShadowColor : Float;
	/**
		The alpha value of the drop shadow.
		
		You can set this directly, or use `Phaser.GameObjects.BitmapText#setDropShadow`.
	**/
	var dropShadowAlpha : Float;
	/**
		Set the lines of text in this BitmapText to be left-aligned.
		This only has any effect if this BitmapText contains more than one line of text.
	**/
	function setLeftAlign():BitmapText;
	/**
		Set the lines of text in this BitmapText to be center-aligned.
		This only has any effect if this BitmapText contains more than one line of text.
	**/
	function setCenterAlign():BitmapText;
	/**
		Set the lines of text in this BitmapText to be right-aligned.
		This only has any effect if this BitmapText contains more than one line of text.
	**/
	function setRightAlign():BitmapText;
	/**
		Set the font size of this Bitmap Text.
	**/
	function setFontSize(size:Float):BitmapText;
	/**
		Sets the letter spacing between each character of this Bitmap Text.
		Can be a positive value to increase the space, or negative to reduce it.
		Spacing is applied after the kerning values have been set.
	**/
	function setLetterSpacing(?spacing:Float):BitmapText;
	/**
		Set the textual content of this BitmapText.
		
		An array of strings will be converted into multi-line text. Use the align methods to change multi-line alignment.
	**/
	function setText(value:ts.AnyOf2<String, Array<String>>):BitmapText;
	/**
		Sets a drop shadow effect on this Bitmap Text.
		
		This is a WebGL only feature and only works with Static Bitmap Text, not Dynamic.
		
		You can set the vertical and horizontal offset of the shadow, as well as the color and alpha.
		
		Once a shadow has been enabled you can modify the `dropShadowX` and `dropShadowY` properties of this
		Bitmap Text directly to adjust the position of the shadow in real-time.
		
		If you wish to clear the shadow, call this method with no parameters specified.
	**/
	function setDropShadow(?x:Float, ?y:Float, ?color:Float, ?alpha:Float):BitmapText;
	/**
		Sets a tint on a range of characters in this Bitmap Text, starting from the `start` parameter index
		and running for `length` quantity of characters.
		
		The `start` parameter can be negative. In this case, it starts at the end of the text and counts
		backwards `start` places.
		
		You can also pass in -1 as the `length` and it will tint all characters from `start`
		up until the end of the string.
		Remember that spaces and punctuation count as characters.
		
		This is a WebGL only feature and only works with Static Bitmap Text, not Dynamic.
		
		The tint works by taking the pixel color values from the Bitmap Text texture, and then
		multiplying it by the color value of the tint. You can provide either one color value,
		in which case the whole character will be tinted in that color. Or you can provide a color
		per corner. The colors are blended together across the extent of the character range.
		
		To swap this from being an additive tint to a fill based tint, set the `tintFill` parameter to `true`.
		
		To modify the tint color once set, call this method again with new color values.
		
		Using `setWordTint` can override tints set by this function, and vice versa.
		
		To remove a tint call this method with just the `start`, and optionally, the `length` parameters defined.
	**/
	function setCharacterTint(?start:Float, ?length:Float, ?tintFill:Bool, ?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):BitmapText;
	/**
		Sets a tint on a matching word within this Bitmap Text.
		
		The `word` parameter can be either a string or a number.
		
		If a string, it will run a string comparison against the text contents, and if matching,
		it will tint the whole word.
		
		If a number, if till that word, based on its offset within the text contents.
		
		The `count` parameter controls how many words are replaced. Pass in -1 to replace them all.
		
		This parameter is ignored if you pass a number as the `word` to be searched for.
		
		This is a WebGL only feature and only works with Static Bitmap Text, not Dynamic.
		
		The tint works by taking the pixel color values from the Bitmap Text texture, and then
		multiplying it by the color value of the tint. You can provide either one color value,
		in which case the whole character will be tinted in that color. Or you can provide a color
		per corner. The colors are blended together across the extent of the character range.
		
		To swap this from being an additive tint to a fill based tint, set the `tintFill` parameter to `true`.
		
		To modify the tint color once set, call this method again with new color values.
		
		Using `setCharacterTint` can override tints set by this function, and vice versa.
	**/
	function setWordTint(word:ts.AnyOf2<String, Float>, ?count:Float, ?tintFill:Bool, ?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):BitmapText;
	/**
		Calculate the bounds of this Bitmap Text.
		
		An object is returned that contains the position, width and height of the Bitmap Text in local and global
		contexts.
		
		Local size is based on just the font size and a [0, 0] position.
		
		Global size takes into account the Game Object's scale, world position and display origin.
		
		Also in the object is data regarding the length of each line, should this be a multi-line BitmapText.
	**/
	function getTextBounds(?round:Bool):global.phaser.types.gameobjects.bitmaptext.BitmapTextSize;
	/**
		Gets the character located at the given x/y coordinate within this Bitmap Text.
		
		The coordinates you pass in are translated into the local space of the
		Bitmap Text, however, it is up to you to first translate the input coordinates to world space.
		
		If you wish to use this in combination with an input event, be sure
		to pass in `Pointer.worldX` and `worldY` so they are in world space.
		
		In some cases, based on kerning, characters can overlap. When this happens,
		the first character in the word is returned.
		
		Note that this does not work for DynamicBitmapText if you have changed the
		character positions during render. It will only scan characters in their un-translated state.
	**/
	function getCharacterAt(x:Float, y:Float, ?camera:global.phaser.cameras.scene2d.Camera):global.phaser.types.gameobjects.bitmaptext.BitmapTextCharacter;
	/**
		Updates the Display Origin cached values internally stored on this Game Object.
		You don't usually call this directly, but it is exposed for edge-cases where you may.
	**/
	function updateDisplayOrigin():BitmapText;
	/**
		Changes the font this BitmapText is using to render.
		
		The new texture is loaded and applied to the BitmapText. The existing test, size and alignment are preserved,
		unless overridden via the arguments.
	**/
	function setFont(font:String, ?size:Float, ?align:Float):BitmapText;
	/**
		Sets the maximum display width of this BitmapText in pixels.
		
		If `BitmapText.text` is longer than `maxWidth` then the lines will be automatically wrapped
		based on the previous whitespace character found in the line.
		
		If no whitespace was found then no wrapping will take place and consequently the `maxWidth` value will not be honored.
		
		Disable maxWidth by setting the value to 0.
		
		You can set the whitespace character to be searched for by setting the `wordWrapCharCode` parameter or property.
	**/
	function setMaxWidth(value:Float, ?wordWrapCharCode:Float):BitmapText;
	/**
		Controls the alignment of each line of text in this BitmapText object.
		
		Only has any effect when this BitmapText contains multiple lines of text, split with carriage-returns.
		Has no effect with single-lines of text.
		
		See the methods `setLeftAlign`, `setCenterAlign` and `setRightAlign`.
		
		0 = Left aligned (default)
		1 = Middle aligned
		2 = Right aligned
		
		The alignment position is based on the longest line of text.
	**/
	var align : Float;
	/**
		The text that this Bitmap Text object displays.
		
		You can also use the method `setText` if you want a chainable way to change the text content.
	**/
	var text : String;
	/**
		The font size of this Bitmap Text.
		
		You can also use the method `setFontSize` if you want a chainable way to change the font size.
	**/
	var fontSize : Float;
	/**
		Adds / Removes spacing between characters.
		
		Can be a negative or positive number.
		
		You can also use the method `setLetterSpacing` if you want a chainable way to change the letter spacing.
	**/
	var letterSpacing : Float;
	/**
		The maximum display width of this BitmapText in pixels.
		
		If BitmapText.text is longer than maxWidth then the lines will be automatically wrapped
		based on the last whitespace character found in the line.
		
		If no whitespace was found then no wrapping will take place and consequently the maxWidth value will not be honored.
		
		Disable maxWidth by setting the value to 0.
	**/
	var maxWidth : Float;
	/**
		The width of this Bitmap Text.
	**/
	final width : Float;
	/**
		The height of this bitmap text.
	**/
	final height : Float;
	/**
		Build a JSON representation of this Bitmap Text.
	**/
	function toJSON():global.phaser.types.gameobjects.bitmaptext.JSONBitmapText;
	/**
		Internal destroy handler, called as part of the destroy process.
	**/
	private function preDestroy():Void;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():BitmapText;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
		
		If your game is running under WebGL you can optionally specify four different alpha values, each of which
		correspond to the four corners of the Game Object. Under Canvas only the `topLeft` value given is used.
	**/
	function setAlpha(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):BitmapText;
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
	function setBlendMode(value:ts.AnyOf2<String, global.phaser.BlendModes>):BitmapText;
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
	function setDepth(value:Float):BitmapText;
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
	function setMask(mask:ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>):BitmapText;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):BitmapText;
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
	function setOrigin(?x:Float, ?y:Float):BitmapText;
	/**
		Sets the origin of this Game Object based on the Pivot values in its Frame.
	**/
	function setOriginFromFrame():BitmapText;
	/**
		Sets the display origin of this Game Object.
		The difference between this and setting the origin is that you can use pixel values for setting the display origin.
	**/
	function setDisplayOrigin(?x:Float, ?y:Float):BitmapText;
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
	function setPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):BitmapText;
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
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<haxe.Constraints.Function>, Array<String>, global.phaser.renderer.webgl.pipelines.PostFXPipeline, Array<global.phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):BitmapText;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
		
		Both the pipeline and post pipelines share the pipeline data object together.
	**/
	function setPipelineData(key:String, ?value:Dynamic):BitmapText;
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
	function removePostPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.pipelines.PostFXPipeline>):BitmapText;
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
	function setScrollFactor(x:Float, ?y:Float):BitmapText;
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
	function setTexture(key:ts.AnyOf2<String, global.phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>):BitmapText;
	/**
		Sets the frame this Game Object will use to render with.
		
		The Frame has to belong to the current Texture being used.
		
		It can be either a string or an index.
		
		Calling `setFrame` will modify the `width` and `height` properties of your Game Object.
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setFrame(frame:ts.AnyOf2<String, Float>, ?updateSize:Bool, ?updateOrigin:Bool):BitmapText;
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
	function clearTint():BitmapText;
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
	function setTint(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):BitmapText;
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
	function setTintFill(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):BitmapText;
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
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):BitmapText;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<global.phaser.types.math.Vector2Like, global.phaser.types.math.Vector3Like, global.phaser.types.math.Vector4Like>):BitmapText;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):BitmapText;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):BitmapText;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):BitmapText;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(x:Float, ?y:Float):BitmapText;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):BitmapText;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):BitmapText;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):BitmapText;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):BitmapText;
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
	function setVisible(value:Bool):BitmapText;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):BitmapText;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):BitmapText;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):BitmapText;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():BitmapText;
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
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):BitmapText;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):BitmapText;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):BitmapText;
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
	function setInteractive(?hitArea:Dynamic, ?callback:global.phaser.types.input.HitAreaCallback, ?dropZone:Bool):BitmapText;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():BitmapText;
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
	function removeInteractive():BitmapText;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BitmapText;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BitmapText;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):BitmapText;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):BitmapText;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):BitmapText;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):BitmapText;
	static var prototype : BitmapText;
	/**
		Left align the text characters in a multi-line BitmapText object.
	**/
	static var ALIGN_LEFT : Float;
	/**
		Center align the text characters in a multi-line BitmapText object.
	**/
	static var ALIGN_CENTER : Float;
	/**
		Right align the text characters in a multi-line BitmapText object.
	**/
	static var ALIGN_RIGHT : Float;
	/**
		Parse an XML Bitmap Font from an Atlas.
		
		Adds the parsed Bitmap Font data to the cache with the `fontName` key.
	**/
	static function ParseFromAtlas(scene:global.phaser.Scene, fontName:String, textureKey:String, frameKey:String, xmlKey:String, ?xSpacing:Float, ?ySpacing:Float):Bool;
	/**
		Parse an XML font to Bitmap Font data for the Bitmap Font cache.
	**/
	static function ParseXMLBitmapFont(xml:js.html.XMLDocument, frame:global.phaser.textures.Frame, ?xSpacing:Float, ?ySpacing:Float):global.phaser.types.gameobjects.bitmaptext.BitmapFontData;
}