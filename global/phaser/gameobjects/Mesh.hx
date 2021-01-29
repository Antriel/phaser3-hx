package global.phaser.gameobjects;

/**
	A Mesh Game Object.
	
	The Mesh Game Object allows you to render a group of textured vertices and manipulate
	the view of those vertices, such as rotation, translation or scaling.
	
	Support for generating mesh data from grids, model data or Wavefront OBJ Files is included.
	
	Although you can use this to render 3D objects, its primary use is for displaying more complex
	Sprites, or Sprites where you need fine-grained control over the vertex positions in order to
	achieve special effects in your games. Note that rendering still takes place using Phaser's
	orthographic camera (after being transformed via `projectionMesh`, see `setPerspective`,
	`setOrtho`, and `panZ` methods). As a result, all depth and face tests are done in an eventually
	orthographic space.
	
	The rendering process will iterate through the faces of this Mesh and render out each face
	that is considered as being in view of the camera. No depth buffer is used, and because of this,
	you should be careful not to use model data with too many vertices, or overlapping geometry,
	or you'll probably encounter z-depth fighting. The Mesh was designed to allow for more advanced
	2D layouts, rather than displaying 3D objects, even though it can do this to a degree.
	
	In short, if you want to remake Crysis, use a 3D engine, not a Mesh. However, if you want
	to easily add some small fun 3D elements into your game, or create some special effects involving
	vertex warping, this is the right object for you. Mesh data becomes part of the WebGL batch,
	just like standard Sprites, so doesn't introduce any additional shader overhead. Because
	the Mesh just generates vertices into the WebGL batch, like any other Sprite, you can use all of
	the common Game Object components on a Mesh too, such as a custom pipeline, mask, blend mode
	or texture.
	
	Note that the Mesh object is WebGL only and does not have a Canvas counterpart.
	
	The Mesh origin is always 0.5 x 0.5 and cannot be changed.
**/
@:native("Phaser.GameObjects.Mesh") extern class Mesh extends GameObject {
	function new(scene:global.phaser.Scene, ?x:Float, ?y:Float, ?texture:ts.AnyOf2<String, global.phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>, ?vertices:Array<Float>, ?uvs:Array<Float>, ?indicies:Array<Float>, ?containsZ:Bool, ?normals:Array<Float>, ?colors:ts.AnyOf2<Float, Array<Float>>, ?alphas:ts.AnyOf2<Float, Array<Float>>);
	/**
		An array containing the Face instances belonging to this Mesh.
		
		A Face consists of 3 Vertex objects.
		
		This array is populated during calls such as `addVertices` or `addOBJ`.
	**/
	var faces : Array<global.phaser.geom.mesh.Face>;
	/**
		An array containing Vertex instances. One instance per vertex in this Mesh.
		
		This array is populated during calls such as `addVertex` or `addOBJ`.
	**/
	var vertices : Array<global.phaser.geom.mesh.Vertex>;
	/**
		The tint fill mode.
		
		`false` = An additive tint (the default), where vertices colors are blended with the texture.
		`true` = A fill tint, where the vertex colors replace the texture, but respects texture alpha.
	**/
	var tintFill : Bool;
	/**
		You can optionally choose to render the vertices of this Mesh to a Graphics instance.
		
		Achieve this by setting the `debugCallback` and the `debugGraphic` properties.
		
		You can do this in a single call via the `Mesh.setDebug` method, which will use the
		built-in debug function. You can also set it to your own callback. The callback
		will be invoked _once per render_ and sent the following parameters:
		
		`debugCallback(src, meshLength, verts)`
		
		`src` is the Mesh instance being debugged.
		`meshLength` is the number of mesh vertices in total.
		`verts` is an array of the translated vertex coordinates.
		
		To disable rendering, set this property back to `null`.
		
		Please note that high vertex count Meshes will struggle to debug properly.
	**/
	var debugCallback : haxe.Constraints.Function;
	/**
		The Graphics instance that the debug vertices will be drawn to, if `setDebug` has
		been called.
	**/
	var debugGraphic : Graphics;
	/**
		When rendering, skip any Face that isn't counter clockwise?
		
		Enable this to hide backward-facing Faces during rendering.
		
		Disable it to render all Faces.
	**/
	var hideCCW : Bool;
	/**
		A Vector3 containing the 3D position of the vertices in this Mesh.
		
		Modifying the components of this property will allow you to reposition where
		the vertices are rendered within the Mesh. This happens in the `preUpdate` phase,
		where each vertex is transformed using the view and projection matrices.
		
		Changing this property will impact all vertices being rendered by this Mesh.
		
		You can also adjust the 'view' by using the `pan` methods.
	**/
	var modelPosition : global.phaser.math.Vector3;
	/**
		A Vector3 containing the 3D scale of the vertices in this Mesh.
		
		Modifying the components of this property will allow you to scale
		the vertices within the Mesh. This happens in the `preUpdate` phase,
		where each vertex is transformed using the view and projection matrices.
		
		Changing this property will impact all vertices being rendered by this Mesh.
	**/
	var modelScale : global.phaser.math.Vector3;
	/**
		A Vector3 containing the 3D rotation of the vertices in this Mesh.
		
		The values should be given in radians, i.e. to rotate the vertices by 90
		degrees you can use `modelRotation.x = Phaser.Math.DegToRad(90)`.
		
		Modifying the components of this property will allow you to rotate
		the vertices within the Mesh. This happens in the `preUpdate` phase,
		where each vertex is transformed using the view and projection matrices.
		
		Changing this property will impact all vertices being rendered by this Mesh.
	**/
	var modelRotation : global.phaser.math.Vector3;
	/**
		The transformation matrix for this Mesh.
	**/
	var transformMatrix : global.phaser.math.Matrix4;
	/**
		The view position for this Mesh.
		
		Use the methods`panX`, `panY` and `panZ` to adjust the view.
	**/
	var viewPosition : global.phaser.math.Vector3;
	/**
		The view matrix for this Mesh.
	**/
	var viewMatrix : global.phaser.math.Matrix4;
	/**
		The projection matrix for this Mesh.
		
		Update it with the `setPerspective` or `setOrtho` methods.
	**/
	var projectionMatrix : global.phaser.math.Matrix4;
	/**
		How many faces were rendered by this Mesh Game Object in the last
		draw? This is reset in the `preUpdate` method and then incremented
		each time a face is drawn. Note that in multi-camera Scenes this
		value may exceed that found in `Mesh.getFaceCount` due to
		cameras drawing the same faces more than once.
	**/
	final totalRendered : Float;
	/**
		By default, the Mesh will check to see if its model or view transform has
		changed each frame and only recalculate the vertex positions if they have.
		
		This avoids lots of additional math in the `preUpdate` step when not required.
		
		However, if you are performing per-Face or per-Vertex manipulation on this Mesh,
		such as tweening a Face, or moving it without moving the rest of the Mesh,
		then you may need to disable the dirty cache in order for the Mesh to re-render
		correctly. You can toggle this property to do that. Please note that leaving
		this set to `true` will cause the Mesh to recalculate the position of every single
		vertex in it, every single frame. So only really do this if you know you
		need it.
	**/
	var ignoreDirtyCache : Bool;
	/**
		Translates the view position of this Mesh on the x axis by the given amount.
	**/
	function panX(v:Float):Void;
	/**
		Translates the view position of this Mesh on the y axis by the given amount.
	**/
	function panY(v:Float):Void;
	/**
		Translates the view position of this Mesh on the z axis by the given amount.
		
		As the default `panZ` value is 0, vertices with `z=0` (the default) need special care or else they will not display as they are behind the camera.
		Consider using `mesh.panZ(mesh.height / (2 * Math.tan(Math.PI / 16)))`, which will interpret vertex geometry 1:1 with pixel geometry (or see `setOrtho`).
	**/
	function panZ(v:Float):Void;
	/**
		Builds a new perspective projection matrix from the given values.
		
		These are also the initial projection matrix & parameters for `Mesh` (and see `panZ` for more discussion).
		
		See also `setOrtho`.
	**/
	function setPerspective(width:Float, height:Float, ?fov:Float, ?near:Float, ?far:Float):Void;
	/**
		Builds a new orthographic projection matrix from the given values.
		
		If using this mode you will often need to set `Mesh.hideCCW` to `false` as well.
		
		By default, calling this method with no parameters will set the scaleX value to
		match the renderer's aspect ratio. If you would like to render vertex positions 1:1
		to pixel positions, consider calling as `mesh.setOrtho(mesh.width, mesh.height)`.
		
		See also `setPerspective`.
	**/
	function setOrtho(?scaleX:Float, ?scaleY:Float, ?near:Float, ?far:Float):Void;
	/**
		Iterates and destroys all current Faces in this Mesh, then resets the
		`faces` and `vertices` arrays.
	**/
	function clear():Mesh;
	/**
		This method will add the data from a triangulated Wavefront OBJ model file to this Mesh.
		
		The data should have been loaded via the OBJFile:
		
		```javascript
		this.load.obj(key, url);
		```
		
		Then use the same `key` as the first parameter to this method.
		
		Multiple Mesh Game Objects can use the same model data without impacting on each other.
		
		Make sure your 3D package has triangulated the model data prior to exporting it.
		
		You can add multiple models to a single Mesh, although they will act as one when
		moved or rotated. You can scale the model data, should it be too small, or too large, to see.
		You can also offset the vertices of the model via the `x`, `y` and `z` parameters.
	**/
	function addVerticesFromObj(key:String, ?scale:Float, ?x:Float, ?y:Float, ?z:Float, ?rotateX:Float, ?rotateY:Float, ?rotateZ:Float, ?zIsUp:Bool):Mesh;
	/**
		Compare the depth of two Faces.
	**/
	function sortByDepth(faceA:global.phaser.geom.mesh.Face, faceB:global.phaser.geom.mesh.Face):Float;
	/**
		Runs a depth sort across all Faces in this Mesh, comparing their averaged depth.
		
		This is called automatically if you use any of the `rotate` methods, but you can
		also invoke it to sort the Faces should you manually position them.
	**/
	function depthSort():Mesh;
	/**
		Adds a new Vertex into the vertices array of this Mesh.
		
		Just adding a vertex isn't enough to render it. You need to also
		make it part of a Face, with 3 Vertex instances per Face.
	**/
	function addVertex(x:Float, y:Float, z:Float, u:Float, v:Float, ?color:Float, ?alpha:Float):Mesh;
	/**
		Adds a new Face into the faces array of this Mesh.
		
		A Face consists of references to 3 Vertex instances, which must be provided.
	**/
	function addFace(vertex1:global.phaser.geom.mesh.Vertex, vertex2:global.phaser.geom.mesh.Vertex, vertex3:global.phaser.geom.mesh.Vertex):Mesh;
	/**
		Adds new vertices to this Mesh by parsing the given data.
		
		This method will take vertex data in one of two formats, based on the `containsZ` parameter.
		
		If your vertex data are `x`, `y` pairs, then `containsZ` should be `false` (this is the default, and will result in `z=0` for each vertex).
		
		If your vertex data is groups of `x`, `y` and `z` values, then the `containsZ` parameter must be true.
		
		The `uvs` parameter is a numeric array consisting of `u` and `v` pairs.
		
		The `normals` parameter is a numeric array consisting of `x`, `y` vertex normal values and, if `containsZ` is true, `z` values as well.
		
		The `indicies` parameter is an optional array that, if given, is an indexed list of vertices to be added.
		
		The `colors` parameter is an optional array, or single value, that if given sets the color of each vertex created.
		
		The `alphas` parameter is an optional array, or single value, that if given sets the alpha of each vertex created.
		
		When providing indexed data it is assumed that _all_ of the arrays are indexed, not just the vertices.
		
		The following example will create a 256 x 256 sized quad using an index array:
		
		```javascript
		let mesh = new Mesh(this);  // Assuming `this` is a scene!
		const vertices = [
		   -128, 128,
		   128, 128,
		   -128, -128,
		   128, -128
		];
		
		const uvs = [
		   0, 1,
		   1, 1,
		   0, 0,
		   1, 0
		];
		
		const indices = [ 0, 2, 1, 2, 3, 1 ];
		
		mesh.addVertices(vertices, uvs, indicies);
		// Note: Otherwise the added points will be "behind" the camera! This value will project vertex `x` & `y` values 1:1 to pixel values.
		mesh.hideCCW = false;
		mesh.setOrtho(mesh.width, mesh.height);
		```
		
		If the data is not indexed, it's assumed that the arrays all contain sequential data.
	**/
	function addVertices(vertices:Array<Float>, uvs:Array<Float>, ?indicies:Array<Float>, ?containsZ:Bool, ?normals:Array<Float>, ?colors:ts.AnyOf2<Float, Array<Float>>, ?alphas:ts.AnyOf2<Float, Array<Float>>):Mesh;
	/**
		Returns the total number of Faces in this Mesh Game Object.
	**/
	function getFaceCount():Float;
	/**
		Returns the total number of Vertices in this Mesh Game Object.
	**/
	function getVertexCount():Float;
	/**
		Returns the Face at the given index in this Mesh Game Object.
	**/
	function getFace(index:Float):global.phaser.geom.mesh.Face;
	/**
		Return an array of Face objects from this Mesh that intersect with the given coordinates.
		
		The given position is translated through the matrix of this Mesh and the given Camera,
		before being compared against the vertices.
		
		If more than one Face intersects, they will all be returned in the array, but the array will
		be depth sorted first, so the first element will always be that closest to the camera.
	**/
	function getFaceAt(x:Float, y:Float, ?camera:global.phaser.cameras.scene2d.Camera):Array<global.phaser.geom.mesh.Face>;
	/**
		This method enables rendering of the Mesh vertices to the given Graphics instance.
		
		If you enable this feature, you **must** call `Graphics.clear()` in your Scene `update`,
		otherwise the Graphics instance you provide to debug will fill-up with draw calls,
		eventually crashing the browser. This is not done automatically to allow you to debug
		draw multiple Mesh objects to a single Graphics instance.
		
		The Mesh class has a built-in debug rendering callback `Mesh.renderDebug`, however
		you can also provide your own callback to be used instead. Do this by setting the `callback` parameter.
		
		The callback is invoked _once per render_ and sent the following parameters:
		
		`callback(src, faces)`
		
		`src` is the Mesh instance being debugged.
		`faces` is an array of the Faces that were rendered.
		
		You can get the final drawn vertex position from a Face object like this:
		
		```javascript
		let face = faces[i];
		
		let x0 = face.vertex1.tx;
		let y0 = face.vertex1.ty;
		let x1 = face.vertex2.tx;
		let y1 = face.vertex2.ty;
		let x2 = face.vertex3.tx;
		let y2 = face.vertex3.ty;
		
		graphic.strokeTriangle(x0, y0, x1, y1, x2, y2);
		```
		
		If using your own callback you do not have to provide a Graphics instance to this method.
		
		To disable debug rendering, to either your own callback or the built-in one, call this method
		with no arguments.
	**/
	function setDebug(?graphic:Graphics, ?callback:haxe.Constraints.Function):Mesh;
	/**
		Checks if the transformation data in this mesh is dirty.
		
		This is used internally by the `preUpdate` step to determine if the vertices should
		be recalculated or not.
	**/
	function isDirty():Bool;
	/**
		The Mesh update loop. The following takes place in this method:
		
		First, the `totalRendered` and `totalFrame` properties are set.
		
		If the view matrix of this Mesh isn't dirty, and the model position, rotate or scale properties are
		all clean, then the method returns at this point.
		
		Otherwise, if the viewPosition is dirty (i.e. from calling a method like `panZ`), then it will
		refresh the viewMatrix.
		
		After this, a new transformMatrix is built and it then iterates through all Faces in this
		Mesh, calling `transformCoordinatesLocal` on all of them. Internally, this updates every
		vertex, calculating its new transformed position, based on the new transform matrix.
		
		Finally, the faces are depth sorted.
	**/
	private function preUpdate(time:Float, delta:Float):Void;
	/**
		The built-in Mesh debug rendering method.
		
		See `Mesh.setDebug` for more details.
	**/
	function renderDebug(src:Mesh, faces:Array<global.phaser.geom.mesh.Face>):Void;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():Mesh;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
	**/
	function setAlpha(?value:Float):Mesh;
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
	function setBlendMode(value:ts.AnyOf2<String, global.phaser.BlendModes>):Mesh;
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
	function setDepth(value:Float):Mesh;
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
	function setMask(mask:ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>):Mesh;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):Mesh;
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
	function setPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):Mesh;
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
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<haxe.Constraints.Function>, Array<String>, global.phaser.renderer.webgl.pipelines.PostFXPipeline, Array<global.phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):Mesh;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
		
		Both the pipeline and post pipelines share the pipeline data object together.
	**/
	function setPipelineData(key:String, ?value:Dynamic):Mesh;
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
	function removePostPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.pipelines.PostFXPipeline>):Mesh;
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
	function setSizeToFrame(frame:global.phaser.textures.Frame):Mesh;
	/**
		Sets the internal size of this Game Object, as used for frame or physics body creation.
		
		This will not change the size that the Game Object is rendered in-game.
		For that you need to either set the scale of the Game Object (`setScale`) or call the
		`setDisplaySize` method, which is the same thing as changing the scale but allows you
		to do so by giving pixel values.
		
		If you have enabled this Game Object for input, changing the size will _not_ change the
		size of the hit area. To do this you should adjust the `input.hitArea` object directly.
	**/
	function setSize(width:Float, height:Float):Mesh;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):Mesh;
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
	function setTexture(key:ts.AnyOf2<String, global.phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>):Mesh;
	/**
		Sets the frame this Game Object will use to render with.
		
		The Frame has to belong to the current Texture being used.
		
		It can be either a string or an index.
		
		Calling `setFrame` will modify the `width` and `height` properties of your Game Object.
		It will also change the `origin` if the Frame has a custom pivot point, as exported from packages like Texture Packer.
	**/
	function setFrame(frame:ts.AnyOf2<String, Float>, ?updateSize:Bool, ?updateOrigin:Bool):Mesh;
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
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):Mesh;
	/**
		Copies an object's coordinates to this Game Object's position.
	**/
	function copyPosition(source:ts.AnyOf3<global.phaser.types.math.Vector2Like, global.phaser.types.math.Vector3Like, global.phaser.types.math.Vector4Like>):Mesh;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):Mesh;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):Mesh;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):Mesh;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(x:Float, ?y:Float):Mesh;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):Mesh;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):Mesh;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):Mesh;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):Mesh;
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
	function setVisible(value:Bool):Mesh;
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
	function setScrollFactor(x:Float, ?y:Float):Mesh;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):Mesh;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Mesh;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):Mesh;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():Mesh;
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
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Mesh;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Mesh;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):Mesh;
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
	function setInteractive(?hitArea:Dynamic, ?callback:global.phaser.types.input.HitAreaCallback, ?dropZone:Bool):Mesh;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():Mesh;
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
	function removeInteractive():Mesh;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Mesh;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Mesh;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Mesh;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Mesh;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Mesh;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Mesh;
	static var prototype : Mesh;
}