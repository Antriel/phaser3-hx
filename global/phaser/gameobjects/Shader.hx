package global.phaser.gameobjects;

/**
	A Shader Game Object.
	
	This Game Object allows you to easily add a quad with its own shader into the display list, and manipulate it
	as you would any other Game Object, including scaling, rotating, positioning and adding to Containers. Shaders
	can be masked with either Bitmap or Geometry masks and can also be used as a Bitmap Mask for a Camera or other
	Game Object. They can also be made interactive and used for input events.
	
	It works by taking a reference to a `Phaser.Display.BaseShader` instance, as found in the Shader Cache. These can
	be created dynamically at runtime, or loaded in via the GLSL File Loader:
	
	```javascript
	function preload ()
	{
	     this.load.glsl('fire', 'shaders/fire.glsl.js');
	}
	
	function create ()
	{
	     this.add.shader('fire', 400, 300, 512, 512);
	}
	```
	
	Please see the Phaser 3 Examples GitHub repo for examples of loading and creating shaders dynamically.
	
	Due to the way in which they work, you cannot directly change the alpha or blend mode of a Shader. This should
	be handled via exposed uniforms in the shader code itself.
	
	By default a Shader will be created with a standard set of uniforms. These were added to match those
	found on sites such as ShaderToy or GLSLSandbox, and provide common functionality a shader may need,
	such as the timestamp, resolution or pointer position. You can replace them by specifying your own uniforms
	in the Base Shader.
	
	These Shaders work by halting the current pipeline during rendering, creating a viewport matched to the
	size of this Game Object and then renders a quad using the bound shader. At the end, the pipeline is restored.
	
	Because it blocks the pipeline it means it will interrupt any batching that is currently going on, so you should
	use these Game Objects sparingly. If you need to have a fully batched custom shader, then please look at using
	a custom pipeline instead. However, for background or special masking effects, they are extremely effective.
**/
@:native("Phaser.GameObjects.Shader") extern class Shader extends GameObject {
	function new(scene:global.phaser.Scene, key:ts.AnyOf2<String, global.phaser.display.BaseShader>, ?x:Float, ?y:Float, ?width:Float, ?height:Float, ?textures:Array<String>, ?textureData:Dynamic);
	/**
		The underlying shader object being used.
		Empty by default and set during a call to the `setShader` method.
	**/
	var shader : global.phaser.display.BaseShader;
	/**
		A reference to the current renderer.
		Shaders only work with the WebGL Renderer.
	**/
	var renderer : ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>;
	/**
		The WebGL context belonging to the renderer.
	**/
	var gl : js.html.webgl.RenderingContext;
	/**
		Raw byte buffer of vertices this Shader uses.
	**/
	var vertexData : js.lib.ArrayBuffer;
	/**
		The WebGL vertex buffer object this shader uses.
	**/
	var vertexBuffer : js.html.webgl.Buffer;
	/**
		The WebGL shader program this shader uses.
	**/
	var program : js.html.webgl.Program;
	/**
		Uint8 view to the vertex raw buffer. Used for uploading vertex buffer resources to the GPU.
	**/
	var bytes : js.lib.Uint8Array;
	/**
		Float32 view of the array buffer containing the shaders vertices.
	**/
	var vertexViewF32 : js.lib.Float32Array;
	/**
		The view matrix the shader uses during rendering.
	**/
	final viewMatrix : js.lib.Float32Array;
	/**
		The projection matrix the shader uses during rendering.
	**/
	final projectionMatrix : js.lib.Float32Array;
	/**
		The default uniform mappings. These can be added to (or replaced) by specifying your own uniforms when
		creating this shader game object. The uniforms are updated automatically during the render step.
		
		The defaults are:
		
		`resolution` (2f) - Set to the size of this shader.
		`time` (1f) - The elapsed game time, in seconds.
		`mouse` (2f) - If a pointer has been bound (with `setPointer`), this uniform contains its position each frame.
		`date` (4fv) - A vec4 containing the year, month, day and time in seconds.
		`sampleRate` (1f) - Sound sample rate. 44100 by default.
		`iChannel0...3` (sampler2D) - Input channels 0 to 3. `null` by default.
	**/
	var uniforms : Dynamic;
	/**
		The pointer bound to this shader, if any.
		Set via the chainable `setPointer` method, or by modifying this property directly.
	**/
	var pointer : global.phaser.input.Pointer;
	/**
		A reference to the GL Frame Buffer this Shader is drawing to.
		This property is only set if you have called `Shader.setRenderToTexture`.
	**/
	var framebuffer : js.html.webgl.Framebuffer;
	/**
		A reference to the WebGLTexture this Shader is rendering to.
		This property is only set if you have called `Shader.setRenderToTexture`.
	**/
	var glTexture : js.html.webgl.Texture;
	/**
		A flag that indicates if this Shader has been set to render to a texture instead of the display list.
		
		This property is `true` if you have called `Shader.setRenderToTexture`, otherwise it's `false`.
		
		A Shader that is rendering to a texture _does not_ appear on the display list.
	**/
	final renderToTexture : Bool;
	/**
		A reference to the Phaser.Textures.Texture that has been stored in the Texture Manager for this Shader.
		
		This property is only set if you have called `Shader.setRenderToTexture`, otherwise it is `null`.
	**/
	var texture : global.phaser.textures.Texture;
	/**
		Changes this Shader so instead of rendering to the display list it renders to a
		WebGL Framebuffer and WebGL Texture instead. This allows you to use the output
		of this shader as an input for another shader, by mapping a sampler2D uniform
		to it.
		
		After calling this method the `Shader.framebuffer` and `Shader.glTexture` properties
		are populated.
		
		Additionally, you can provide a key to this method. Doing so will create a Phaser Texture
		from this Shader and save it into the Texture Manager, allowing you to then use it for
		any texture-based Game Object, such as a Sprite or Image:
		
		```javascript
		var shader = this.add.shader('myShader', x, y, width, height);
		
		shader.setRenderToTexture('doodle');
		
		this.add.image(400, 300, 'doodle');
		```
		
		Note that it stores an active reference to this Shader. That means as this shader updates,
		so does the texture and any object using it to render with. Also, if you destroy this
		shader, be sure to clear any objects that may have been using it as a texture too.
		
		You can access the Phaser Texture that is created via the `Shader.texture` property.
		
		By default it will create a single base texture. You can add frames to the texture
		by using the `Texture.add` method. After doing this, you can then allow Game Objects
		to use a specific frame from a Render Texture.
	**/
	function setRenderToTexture(?key:String, ?flipY:Bool):Shader;
	/**
		Sets the fragment and, optionally, the vertex shader source code that this Shader will use.
		This will immediately delete the active shader program, if set, and then create a new one
		with the given source. Finally, the shader uniforms are initialized.
	**/
	function setShader(key:ts.AnyOf2<String, global.phaser.display.BaseShader>, ?textures:Array<String>, ?textureData:Dynamic):Shader;
	/**
		Binds a Phaser Pointer object to this Shader.
		
		The screen position of the pointer will be set in to the shaders `mouse` uniform
		automatically every frame. Call this method with no arguments to unbind the pointer.
	**/
	function setPointer(?pointer:global.phaser.input.Pointer):Shader;
	/**
		Sets this shader to use an orthographic projection matrix.
		This matrix is stored locally in the `projectionMatrix` property,
		as well as being bound to the `uProjectionMatrix` uniform.
	**/
	function projOrtho(left:Float, right:Float, bottom:Float, top:Float):Void;
	/**
		Sets a sampler2D uniform on this shader where the source texture is a WebGLTexture.
		
		This allows you to feed the output from one Shader into another:
		
		```javascript
		let shader1 = this.add.shader(baseShader1, 0, 0, 512, 512).setRenderToTexture();
		let shader2 = this.add.shader(baseShader2, 0, 0, 512, 512).setRenderToTexture('output');
		
		shader1.setSampler2DBuffer('iChannel0', shader2.glTexture, 512, 512);
		shader2.setSampler2DBuffer('iChannel0', shader1.glTexture, 512, 512);
		```
		
		In the above code, the result of baseShader1 is fed into Shader2 as the `iChannel0` sampler2D uniform.
		The result of baseShader2 is then fed back into shader1 again, creating a feedback loop.
		
		If you wish to use an image from the Texture Manager as a sampler2D input for this shader,
		see the `Shader.setSampler2D` method.
	**/
	function setSampler2DBuffer(uniformKey:String, texture:js.html.webgl.Texture, width:Float, height:Float, ?textureIndex:Float, ?textureData:Dynamic):Shader;
	/**
		Sets a sampler2D uniform on this shader.
		
		The textureKey given is the key from the Texture Manager cache. You cannot use a single frame
		from a texture, only the full image. Also, lots of shaders expect textures to be power-of-two sized.
		
		If you wish to use another Shader as a sampler2D input for this shader, see the `Shader.setSampler2DBuffer` method.
	**/
	function setSampler2D(uniformKey:String, textureKey:String, ?textureIndex:Float, ?textureData:Dynamic):Shader;
	/**
		Sets a property of a uniform already present on this shader.
		
		To modify the value of a uniform such as a 1f or 1i use the `value` property directly:
		
		```javascript
		shader.setUniform('size.value', 16);
		```
		
		You can use dot notation to access deeper values, for example:
		
		```javascript
		shader.setUniform('resolution.value.x', 512);
		```
		
		The change to the uniform will take effect the next time the shader is rendered.
	**/
	function setUniform(key:String, value:Dynamic):Shader;
	/**
		Returns the uniform object for the given key, or `null` if the uniform couldn't be found.
	**/
	function getUniform(key:String):Dynamic;
	/**
		A short-cut method that will directly set the texture being used by the `iChannel0` sampler2D uniform.
		
		The textureKey given is the key from the Texture Manager cache. You cannot use a single frame
		from a texture, only the full image. Also, lots of shaders expect textures to be power-of-two sized.
	**/
	function setChannel0(textureKey:String, ?textureData:Dynamic):Shader;
	/**
		A short-cut method that will directly set the texture being used by the `iChannel1` sampler2D uniform.
		
		The textureKey given is the key from the Texture Manager cache. You cannot use a single frame
		from a texture, only the full image. Also, lots of shaders expect textures to be power-of-two sized.
	**/
	function setChannel1(textureKey:String, ?textureData:Dynamic):Shader;
	/**
		A short-cut method that will directly set the texture being used by the `iChannel2` sampler2D uniform.
		
		The textureKey given is the key from the Texture Manager cache. You cannot use a single frame
		from a texture, only the full image. Also, lots of shaders expect textures to be power-of-two sized.
	**/
	function setChannel2(textureKey:String, ?textureData:Dynamic):Shader;
	/**
		A short-cut method that will directly set the texture being used by the `iChannel3` sampler2D uniform.
		
		The textureKey given is the key from the Texture Manager cache. You cannot use a single frame
		from a texture, only the full image. Also, lots of shaders expect textures to be power-of-two sized.
	**/
	function setChannel3(textureKey:String, ?textureData:Dynamic):Shader;
	/**
		Called automatically during render.
		
		This method performs matrix ITRS and then stores the resulting value in the `uViewMatrix` uniform.
		It then sets up the vertex buffer and shader, updates and syncs the uniforms ready
		for flush to be called.
	**/
	function load(?matrix2D:global.phaser.gameobjects.components.TransformMatrix):Void;
	/**
		Called automatically during render.
		
		Sets the active shader, loads the vertex buffer and then draws.
	**/
	function flush():Void;
	/**
		Internal destroy handler, called as part of the destroy process.
	**/
	private function preDestroy():Void;
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
		Sets the internal size of this Game Object, as used for frame or physics body creation.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSize(width:Float, height:Float):Shader;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):Shader;
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
	function setDepth(value:Float):Shader;
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
	function setMask(mask:ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>):Shader;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):Shader;
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
	function setOrigin(?x:Float, ?y:Float):Shader;
	/**
		Sets the origin of this Game Object based on the Pivot values in its Frame.
	**/
	function setOriginFromFrame():Shader;
	/**
		Sets the display origin of this Game Object.
		The difference between this and setting the origin is that you can use pixel values for setting the display origin.
	**/
	function setDisplayOrigin(?x:Float, ?y:Float):Shader;
	/**
		Updates the Display Origin cached values internally stored on this Game Object.
		You don't usually call this directly, but it is exposed for edge-cases where you may.
	**/
	function updateDisplayOrigin():Shader;
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
	function setScrollFactor(x:Float, ?y:Float):Shader;
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
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):Shader;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<global.phaser.types.math.Vector2Like, global.phaser.types.math.Vector3Like, global.phaser.types.math.Vector4Like>):Shader;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):Shader;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):Shader;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):Shader;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(x:Float, ?y:Float):Shader;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):Shader;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):Shader;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):Shader;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):Shader;
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
	function setVisible(value:Bool):Shader;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):Shader;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Shader;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):Shader;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():Shader;
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
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Shader;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Shader;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):Shader;
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
	function setInteractive(?hitArea:Dynamic, ?callback:global.phaser.types.input.HitAreaCallback, ?dropZone:Bool):Shader;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():Shader;
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
	function removeInteractive():Shader;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Shader;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Shader;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Shader;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Shader;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Shader;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Shader;
	static var prototype : Shader;
}