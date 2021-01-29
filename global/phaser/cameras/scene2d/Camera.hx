package global.phaser.cameras.scene2d;

/**
	A Camera.
	
	The Camera is the way in which all games are rendered in Phaser. They provide a view into your game world,
	and can be positioned, rotated, zoomed and scrolled accordingly.
	
	A Camera consists of two elements: The viewport and the scroll values.
	
	The viewport is the physical position and size of the Camera within your game. Cameras, by default, are
	created the same size as your game, but their position and size can be set to anything. This means if you
	wanted to create a camera that was 320x200 in size, positioned in the bottom-right corner of your game,
	you'd adjust the viewport to do that (using methods like `setViewport` and `setSize`).
	
	If you wish to change where the Camera is looking in your game, then you scroll it. You can do this
	via the properties `scrollX` and `scrollY` or the method `setScroll`. Scrolling has no impact on the
	viewport, and changing the viewport has no impact on the scrolling.
	
	By default a Camera will render all Game Objects it can see. You can change this using the `ignore` method,
	allowing you to filter Game Objects out on a per-Camera basis.
	
	A Camera also has built-in special effects including Fade, Flash and Camera Shake.
**/
@:native("Phaser.Cameras.Scene2D.Camera") extern class Camera extends BaseCamera {
	function new(x:Float, y:Float, width:Float, height:Float);
	/**
		Does this Camera allow the Game Objects it renders to receive input events?
	**/
	var inputEnabled : Bool;
	/**
		The Camera Fade effect handler.
		To fade this camera see the `Camera.fade` methods.
	**/
	var fadeEffect : global.phaser.cameras.scene2d.effects.Fade;
	/**
		The Camera Flash effect handler.
		To flash this camera see the `Camera.flash` method.
	**/
	var flashEffect : global.phaser.cameras.scene2d.effects.Flash;
	/**
		The Camera Shake effect handler.
		To shake this camera see the `Camera.shake` method.
	**/
	var shakeEffect : global.phaser.cameras.scene2d.effects.Shake;
	/**
		The Camera Pan effect handler.
		To pan this camera see the `Camera.pan` method.
	**/
	var panEffect : global.phaser.cameras.scene2d.effects.Pan;
	/**
		The Camera Rotate To effect handler.
		To rotate this camera see the `Camera.rotateTo` method.
	**/
	var rotateToEffect : global.phaser.cameras.scene2d.effects.RotateTo;
	/**
		The Camera Zoom effect handler.
		To zoom this camera see the `Camera.zoom` method.
	**/
	var zoomEffect : global.phaser.cameras.scene2d.effects.Zoom;
	/**
		The linear interpolation value to use when following a target.
		
		Can also be set via `setLerp` or as part of the `startFollow` call.
		
		The default values of 1 means the camera will instantly snap to the target coordinates.
		A lower value, such as 0.1 means the camera will more slowly track the target, giving
		a smooth transition. You can set the horizontal and vertical values independently, and also
		adjust this value in real-time during your game.
		
		Be sure to keep the value between 0 and 1. A value of zero will disable tracking on that axis.
	**/
	var lerp : global.phaser.math.Vector2;
	/**
		The values stored in this property are subtracted from the Camera targets position, allowing you to
		offset the camera from the actual target x/y coordinates by this amount.
		Can also be set via `setFollowOffset` or as part of the `startFollow` call.
	**/
	var followOffset : global.phaser.math.Vector2;
	/**
		The Camera dead zone.
		
		The deadzone is only used when the camera is following a target.
		
		It defines a rectangular region within which if the target is present, the camera will not scroll.
		If the target moves outside of this area, the camera will begin scrolling in order to follow it.
		
		The `lerp` values that you can set for a follower target also apply when using a deadzone.
		
		You can directly set this property to be an instance of a Rectangle. Or, you can use the
		`setDeadzone` method for a chainable approach.
		
		The rectangle you provide can have its dimensions adjusted dynamically, however, please
		note that its position is updated every frame, as it is constantly re-centered on the cameras mid point.
		
		Calling `setDeadzone` with no arguments will reset an active deadzone, as will setting this property
		to `null`.
	**/
	var deadzone : global.phaser.geom.Rectangle;
	/**
		Sets the Camera dead zone.
		
		The deadzone is only used when the camera is following a target.
		
		It defines a rectangular region within which if the target is present, the camera will not scroll.
		If the target moves outside of this area, the camera will begin scrolling in order to follow it.
		
		The deadzone rectangle is re-positioned every frame so that it is centered on the mid-point
		of the camera. This allows you to use the object for additional game related checks, such as
		testing if an object is within it or not via a Rectangle.contains call.
		
		The `lerp` values that you can set for a follower target also apply when using a deadzone.
		
		Calling this method with no arguments will reset an active deadzone.
	**/
	function setDeadzone(?width:Float, ?height:Float):Camera;
	/**
		Fades the Camera in from the given color over the duration specified.
	**/
	function fadeIn(?duration:Float, ?red:Float, ?green:Float, ?blue:Float, ?callback:haxe.Constraints.Function, ?context:Dynamic):Camera;
	/**
		Fades the Camera out to the given color over the duration specified.
		This is an alias for Camera.fade that forces the fade to start, regardless of existing fades.
	**/
	function fadeOut(?duration:Float, ?red:Float, ?green:Float, ?blue:Float, ?callback:haxe.Constraints.Function, ?context:Dynamic):Camera;
	/**
		Fades the Camera from the given color to transparent over the duration specified.
	**/
	function fadeFrom(?duration:Float, ?red:Float, ?green:Float, ?blue:Float, ?force:Bool, ?callback:haxe.Constraints.Function, ?context:Dynamic):Camera;
	/**
		Fades the Camera from transparent to the given color over the duration specified.
	**/
	function fade(?duration:Float, ?red:Float, ?green:Float, ?blue:Float, ?force:Bool, ?callback:haxe.Constraints.Function, ?context:Dynamic):Camera;
	/**
		Flashes the Camera by setting it to the given color immediately and then fading it away again quickly over the duration specified.
	**/
	function flash(?duration:Float, ?red:Float, ?green:Float, ?blue:Float, ?force:Bool, ?callback:haxe.Constraints.Function, ?context:Dynamic):Camera;
	/**
		Shakes the Camera by the given intensity over the duration specified.
	**/
	function shake(?duration:Float, ?intensity:ts.AnyOf2<Float, global.phaser.math.Vector2>, ?force:Bool, ?callback:haxe.Constraints.Function, ?context:Dynamic):Camera;
	/**
		This effect will scroll the Camera so that the center of its viewport finishes at the given destination,
		over the duration and with the ease specified.
	**/
	function pan(x:Float, y:Float, ?duration:Float, ?ease:ts.AnyOf2<String, haxe.Constraints.Function>, ?force:Bool, ?callback:global.phaser.types.cameras.scene2d.CameraPanCallback, ?context:Dynamic):Camera;
	/**
		This effect will rotate the Camera so that the viewport finishes at the given angle in radians,
		over the duration and with the ease specified.
	**/
	function rotateTo(radians:Float, ?shortestPath:Bool, ?duration:Float, ?ease:ts.AnyOf2<String, haxe.Constraints.Function>, ?force:Bool, ?callback:global.CameraRotateCallback, ?context:Dynamic):Camera;
	/**
		This effect will zoom the Camera to the given scale, over the duration and with the ease specified.
	**/
	function zoomTo(zoom:Float, ?duration:Float, ?ease:ts.AnyOf2<String, haxe.Constraints.Function>, ?force:Bool, ?callback:global.phaser.types.cameras.scene2d.CameraPanCallback, ?context:Dynamic):Camera;
	/**
		Sets the linear interpolation value to use when following a target.
		
		The default values of 1 means the camera will instantly snap to the target coordinates.
		A lower value, such as 0.1 means the camera will more slowly track the target, giving
		a smooth transition. You can set the horizontal and vertical values independently, and also
		adjust this value in real-time during your game.
		
		Be sure to keep the value between 0 and 1. A value of zero will disable tracking on that axis.
	**/
	function setLerp(?x:Float, ?y:Float):Camera;
	/**
		Sets the horizontal and vertical offset of the camera from its follow target.
		The values are subtracted from the targets position during the Cameras update step.
	**/
	function setFollowOffset(?x:Float, ?y:Float):Camera;
	/**
		Sets the Camera to follow a Game Object.
		
		When enabled the Camera will automatically adjust its scroll position to keep the target Game Object
		in its center.
		
		You can set the linear interpolation value used in the follow code.
		Use low lerp values (such as 0.1) to automatically smooth the camera motion.
		
		If you find you're getting a slight "jitter" effect when following an object it's probably to do with sub-pixel
		rendering of the targets position. This can be rounded by setting the `roundPixels` argument to `true` to
		force full pixel rounding rendering. Note that this can still be broken if you have specified a non-integer zoom
		value on the camera. So be sure to keep the camera zoom to integers.
	**/
	function startFollow(target:ts.AnyOf2<Dynamic, global.phaser.gameobjects.GameObject>, ?roundPixels:Bool, ?lerpX:Float, ?lerpY:Float, ?offsetX:Float, ?offsetY:Float):Camera;
	/**
		Stops a Camera from following a Game Object, if previously set via `Camera.startFollow`.
	**/
	function stopFollow():Camera;
	/**
		Resets any active FX, such as a fade, flash or shake. Useful to call after a fade in order to
		remove the fade.
	**/
	function resetFX():Camera;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():Camera;
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
	function toggleFlipX():Camera;
	/**
		Toggles the vertical flipped state of this Game Object.
	**/
	function toggleFlipY():Camera;
	/**
		Sets the horizontal flipped state of this Game Object.
		
		A Game Object that is flipped horizontally will render inversed on the horizontal axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlipX(value:Bool):Camera;
	/**
		Sets the vertical flipped state of this Game Object.
	**/
	function setFlipY(value:Bool):Camera;
	/**
		Sets the horizontal and vertical flipped state of this Game Object.
		
		A Game Object that is flipped will render inversed on the flipped axis.
		Flipping always takes place from the middle of the texture and does not impact the scale value.
		If this Game Object has a physics body, it will not change the body. This is a rendering toggle only.
	**/
	function setFlip(x:Bool, y:Bool):Camera;
	/**
		Resets the horizontal and vertical flipped state of this Game Object back to their default un-flipped state.
	**/
	function resetFlip():Camera;
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
	function clearTint():Camera;
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
	function setTint(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):Camera;
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
	function setTintFill(?topLeft:Float, ?topRight:Float, ?bottomLeft:Float, ?bottomRight:Float):Camera;
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
	function setPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):Camera;
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
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<haxe.Constraints.Function>, Array<String>, global.phaser.renderer.webgl.pipelines.PostFXPipeline, Array<global.phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):Camera;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
		
		Both the pipeline and post pipelines share the pipeline data object together.
	**/
	function setPipelineData(key:String, ?value:Dynamic):Camera;
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
	function removePostPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.pipelines.PostFXPipeline>):Camera;
	/**
		Gets the name of the WebGL Pipeline this Game Object is currently using.
	**/
	function getPipelineName():String;
	/**
		Set the Alpha level of this Camera. The alpha controls the opacity of the Camera as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
	**/
	function setAlpha(?value:Float):Camera;
	/**
		Sets the rotation origin of this Camera.
		
		The values are given in the range 0 to 1 and are only used when calculating Camera rotation.
		
		By default the camera rotates around the center of the viewport.
		
		Changing the origin allows you to adjust the point in the viewport from which rotation happens.
		A value of 0 would rotate from the top-left of the viewport. A value of 1 from the bottom right.
	**/
	function setOrigin(?x:Float, ?y:Float):Camera;
	/**
		Moves the Camera horizontally so that it is centered on the given x coordinate, bounds allowing.
		Calling this does not change the scrollY value.
	**/
	function centerOnX(x:Float):Camera;
	/**
		Moves the Camera vertically so that it is centered on the given y coordinate, bounds allowing.
		Calling this does not change the scrollX value.
	**/
	function centerOnY(y:Float):Camera;
	/**
		Moves the Camera so that it is centered on the given coordinates, bounds allowing.
	**/
	function centerOn(x:Float, y:Float):Camera;
	/**
		Moves the Camera so that it is looking at the center of the Camera Bounds, if enabled.
	**/
	function centerToBounds():Camera;
	/**
		Moves the Camera so that it is re-centered based on its viewport size.
	**/
	function centerToSize():Camera;
	/**
		Given a Game Object, or an array of Game Objects, it will update all of their camera filter settings
		so that they are ignored by this Camera. This means they will not be rendered by this Camera.
	**/
	function ignore(entries:ts.AnyOf3<global.phaser.gameobjects.GameObject, Array<global.phaser.gameobjects.GameObject>, global.phaser.gameobjects.Group>):Camera;
	/**
		If this Camera has previously had movement bounds set on it, this will remove them.
	**/
	function removeBounds():Camera;
	/**
		Set the rotation of this Camera. This causes everything it renders to appear rotated.
		
		Rotating a camera does not rotate the viewport itself, it is applied during rendering.
	**/
	function setAngle(?value:Float):Camera;
	/**
		Sets the background color for this Camera.
		
		By default a Camera has a transparent background but it can be given a solid color, with any level
		of transparency, via this method.
		
		The color value can be specified using CSS color notation, hex or numbers.
	**/
	function setBackgroundColor(?color:ts.AnyOf3<String, Float, global.phaser.types.display.InputColorObject>):Camera;
	/**
		Set the bounds of the Camera. The bounds are an axis-aligned rectangle.
		
		The Camera bounds controls where the Camera can scroll to, stopping it from scrolling off the
		edges and into blank space. It does not limit the placement of Game Objects, or where
		the Camera viewport can be positioned.
		
		Temporarily disable the bounds by changing the boolean `Camera.useBounds`.
		
		Clear the bounds entirely by calling `Camera.removeBounds`.
		
		If you set bounds that are smaller than the viewport it will stop the Camera from being
		able to scroll. The bounds can be positioned where-ever you wish. By default they are from
		0x0 to the canvas width x height. This means that the coordinate 0x0 is the top left of
		the Camera bounds. However, you can position them anywhere. So if you wanted a game world
		that was 2048x2048 in size, with 0x0 being the center of it, you can set the bounds x/y
		to be -1024, -1024, with a width and height of 2048. Depending on your game you may find
		it easier for 0x0 to be the top-left of the bounds, or you may wish 0x0 to be the middle.
	**/
	function setBounds(x:Float, y:Float, width:Float, height:Float, ?centerOn:Bool):Camera;
	/**
		Sets the name of this Camera.
		This value is for your own use and isn't used internally.
	**/
	function setName(?value:String):Camera;
	/**
		Set the position of the Camera viewport within the game.
		
		This does not change where the camera is 'looking'. See `setScroll` to control that.
	**/
	function setPosition(x:Float, ?y:Float):Camera;
	/**
		Set the rotation of this Camera. This causes everything it renders to appear rotated.
		
		Rotating a camera does not rotate the viewport itself, it is applied during rendering.
	**/
	function setRotation(?value:Float):Camera;
	/**
		Should the Camera round pixel values to whole integers when rendering Game Objects?
		
		In some types of game, especially with pixel art, this is required to prevent sub-pixel aliasing.
	**/
	function setRoundPixels(value:Bool):Camera;
	/**
		Sets the Scene the Camera is bound to.
	**/
	function setScene(scene:global.phaser.Scene):Camera;
	/**
		Set the position of where the Camera is looking within the game.
		You can also modify the properties `Camera.scrollX` and `Camera.scrollY` directly.
		Use this method, or the scroll properties, to move your camera around the game world.
		
		This does not change where the camera viewport is placed. See `setPosition` to control that.
	**/
	function setScroll(x:Float, ?y:Float):Camera;
	/**
		Set the size of the Camera viewport.
		
		By default a Camera is the same size as the game, but can be made smaller via this method,
		allowing you to create mini-cam style effects by creating and positioning a smaller Camera
		viewport within your game.
	**/
	function setSize(width:Float, ?height:Float):Camera;
	/**
		This method sets the position and size of the Camera viewport in a single call.
		
		If you're trying to change where the Camera is looking at in your game, then see
		the method `Camera.setScroll` instead. This method is for changing the viewport
		itself, not what the camera can see.
		
		By default a Camera is the same size as the game, but can be made smaller via this method,
		allowing you to create mini-cam style effects by creating and positioning a smaller Camera
		viewport within your game.
	**/
	function setViewport(x:Float, y:Float, width:Float, ?height:Float):Camera;
	/**
		Set the zoom value of the Camera.
		
		Changing to a smaller value, such as 0.5, will cause the camera to 'zoom out'.
		Changing to a larger value, such as 2, will cause the camera to 'zoom in'.
		
		A value of 1 means 'no zoom' and is the default.
		
		Changing the zoom does not impact the Camera viewport in any way, it is only applied during rendering.
		
		As of Phaser 3.50 you can now set the horizontal and vertical zoom values independently.
	**/
	function setZoom(?x:Float, ?y:Float):Camera;
	/**
		Sets the mask to be applied to this Camera during rendering.
		
		The mask must have been previously created and can be either a GeometryMask or a BitmapMask.
		
		Bitmap Masks only work on WebGL. Geometry Masks work on both WebGL and Canvas.
		
		If a mask is already set on this Camera it will be immediately replaced.
		
		Masks have no impact on physics or input detection. They are purely a rendering component
		that allows you to limit what is visible during the render pass.
	**/
	function setMask(mask:ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>, ?fixedPosition:Bool):Camera;
	/**
		Clears the mask that this Camera was using.
	**/
	function clearMask(?destroyMask:Bool):Camera;
	/**
		Sets the visibility of this Camera.
		
		An invisible Camera will skip rendering and input tests of everything it can see.
	**/
	function setVisible(value:Bool):Camera;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Camera;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Camera;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Camera;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Camera;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Camera;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Camera;
	static var prototype : Camera;
}