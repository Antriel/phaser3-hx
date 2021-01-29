package global.phaser.gameobjects;

/**
	A Layer Game Object.
	
	A Layer is a special type of Game Object that acts as a Display List. You can add any type of Game Object
	to a Layer, just as you would to a Scene. Layers can be used to visually group together 'layers' of Game
	Objects:
	
	```javascript
	const spaceman = this.add.sprite(150, 300, 'spaceman');
	const bunny = this.add.sprite(400, 300, 'bunny');
	const elephant = this.add.sprite(650, 300, 'elephant');
	
	const layer = this.add.layer();
	
	layer.add([ spaceman, bunny, elephant ]);
	```
	
	The 3 sprites in the example above will now be managed by the Layer they were added to. Therefore,
	if you then set `layer.setVisible(false)` they would all vanish from the display.
	
	You can also control the depth of the Game Objects within the Layer. For example, calling the
	`setDepth` method of a child of a Layer will allow you to adjust the depth of that child _within the
	Layer itself_, rather than the whole Scene. The Layer, too, can have its depth set as well.
	
	The Layer class also offers many different methods for manipulating the list, such as the
	methods `moveUp`, `moveDown`, `sendToBack`, `bringToTop` and so on. These allow you to change the
	display list position of the Layers children, causing it to adjust the order in which they are
	rendered. Using `setDepth` on a child allows you to override this.
	
	Layers can have Post FX Pipelines set, which allows you to easily enable a post pipeline across
	a whole range of children, which, depending on the effect, can often be far more efficient that doing so
	on a per-child basis.
	
	Layers have no position or size within the Scene. This means you cannot enable a Layer for
	physics or input, or change the position, rotation or scale of a Layer. They also have no scroll
	factor, texture, tint, origin, crop or bounds.
	
	If you need those kind of features then you should use a Container instead. Containers can be added
	to Layers, but Layers cannot be added to Containers.
	
	However, you can set the Alpha, Blend Mode, Depth, Mask and Visible state of a Layer. These settings
	will impact all children being rendered by the Layer.
**/
@:native("Phaser.GameObjects.Layer") extern class Layer extends global.phaser.structs.List_<GameObject> {
	function new(scene:global.phaser.Scene, ?children:Array<GameObject>);
	/**
		A reference to the Scene to which this Game Object belongs.
		
		Game Objects can only belong to one Scene.
		
		You should consider this property as being read-only. You cannot move a
		Game Object to another Scene by simply changing it.
	**/
	var scene : global.phaser.Scene;
	/**
		Holds a reference to the Display List that contains this Game Object.
		
		This is set automatically when this Game Object is added to a Scene or Layer.
		
		You should treat this property as being read-only.
	**/
	var displayList : ts.AnyOf2<DisplayList, Layer>;
	/**
		A textual representation of this Game Object, i.e. `sprite`.
		Used internally by Phaser but is available for your own custom classes to populate.
	**/
	var type : String;
	/**
		The current state of this Game Object.
		
		Phaser itself will never modify this value, although plugins may do so.
		
		Use this property to track the state of a Game Object during its lifetime. For example, it could change from
		a state of 'moving', to 'attacking', to 'dead'. The state value should be an integer (ideally mapped to a constant
		in your game code), or a string. These are recommended to keep it light and simple, with fast comparisons.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	var state : ts.AnyOf2<String, Float>;
	/**
		A Layer cannot be placed inside a Container.
		
		This property is kept purely so a Layer has the same
		shape as a Game Object.
	**/
	var parentContainer : Container;
	/**
		The name of this Game Object.
		Empty by default and never populated by Phaser, this is left for developers to use.
	**/
	var name : String;
	/**
		The active state of this Game Object.
		A Game Object with an active state of `true` is processed by the Scenes UpdateList, if added to it.
		An active object is one which is having its logic and internal systems updated.
	**/
	var active : Bool;
	/**
		The Tab Index of the Game Object.
		Reserved for future use by plugins and the Input Manager.
	**/
	var tabIndex : Float;
	/**
		A Data Manager.
		It allows you to store, query and get key/value paired information specific to this Game Object.
		`null` by default. Automatically created if you use `getData` or `setData` or `setDataEnabled`.
	**/
	var data : global.phaser.data.DataManager;
	/**
		The flags that are compared against `RENDER_MASK` to determine if this Game Object will render or not.
		The bits are 0001 | 0010 | 0100 | 1000 set by the components Visible, Alpha, Transform and Texture respectively.
		If those components are not used by your custom class then you can use this bitmask as you wish.
	**/
	var renderFlags : Float;
	/**
		A bitmask that controls if this Game Object is drawn by a Camera or not.
		Not usually set directly, instead call `Camera.ignore`, however you can
		set this property directly using the Camera.id property:
	**/
	var cameraFilter : Float;
	/**
		This property is kept purely so a Layer has the same
		shape as a Game Object. You cannot input enable a Layer.
	**/
	var input : global.phaser.types.input.InteractiveObject;
	/**
		This property is kept purely so a Layer has the same
		shape as a Game Object. You cannot give a Layer a physics body.
	**/
	var body : ts.AnyOf3<global.phaser.physics.arcade.Body, global.phaser.physics.arcade.StaticBody, global.matterjs.BodyType>;
	/**
		This Game Object will ignore all calls made to its destroy method if this flag is set to `true`.
		This includes calls that may come from a Group, Container or the Scene itself.
		While it allows you to persist a Game Object across Scenes, please understand you are entirely
		responsible for managing references to and from this Game Object.
	**/
	var ignoreDestroy : Bool;
	/**
		A reference to the Scene Systems.
	**/
	var systems : global.phaser.scenes.Systems;
	/**
		A reference to the Scene Event Emitter.
	**/
	var events : global.phaser.events.EventEmitter;
	/**
		The flag the determines whether Game Objects should be sorted when `depthSort()` is called.
	**/
	var sortChildrenFlag : Bool;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):Layer;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Layer;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):Layer;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():Layer;
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
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Layer;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Layer;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):Layer;
	/**
		Retrieves the value for the given key in this Game Objects Data Manager, or undefined if it doesn't exist.
		
		You can also access values via the `values` object. For example, if you had a key called `gold` you can do either:
		
		```javascript
		sprite.getData('gold');
		```
		
		Or access the value directly:
		
		```javascript
		sprite.data.values.gold;
		```
		
		You can also pass in an array of keys, in which case an array of values will be returned:
		
		```javascript
		sprite.getData([ 'gold', 'armor', 'health' ]);
		```
		
		This approach is useful for destructuring arrays in ES6.
	**/
	function getData(key:ts.AnyOf2<String, Array<String>>):Dynamic;
	/**
		A Layer cannot be enabled for input.
		
		This method does nothing and is kept to ensure
		the Layer has the same shape as a Game Object.
	**/
	function setInteractive():Layer;
	/**
		A Layer cannot be enabled for input.
		
		This method does nothing and is kept to ensure
		the Layer has the same shape as a Game Object.
	**/
	function disableInteractive():Layer;
	/**
		A Layer cannot be enabled for input.
		
		This method does nothing and is kept to ensure
		the Layer has the same shape as a Game Object.
	**/
	function removeInteractive():Layer;
	/**
		This callback is invoked when this Game Object is added to a Scene.
		
		Can be overriden by custom Game Objects, but be aware of some Game Objects that
		will use this, such as Sprites, to add themselves into the Update List.
		
		You can also listen for the `ADDED_TO_SCENE` event from this Game Object.
	**/
	function addedToScene():Void;
	/**
		This callback is invoked when this Game Object is removed from a Scene.
		
		Can be overriden by custom Game Objects, but be aware of some Game Objects that
		will use this, such as Sprites, to removed themselves from the Update List.
		
		You can also listen for the `REMOVED_FROM_SCENE` event from this Game Object.
	**/
	function removedFromScene():Void;
	/**
		To be overridden by custom GameObjects. Allows base objects to be used in a Pool.
	**/
	function update(args:haxe.extern.Rest<Dynamic>):Void;
	/**
		Returns a JSON representation of the Game Object.
	**/
	function toJSON():global.phaser.types.gameobjects.JSONGameObject;
	/**
		Compares the renderMask with the renderFlags to see if this Game Object will render or not.
		Also checks the Game Object against the given Cameras exclusion list.
	**/
	function willRender(camera:global.phaser.cameras.scene2d.Camera):Bool;
	/**
		Returns an array containing the display list index of either this Game Object, or if it has one,
		its parent Container. It then iterates up through all of the parent containers until it hits the
		root of the display list (which is index 0 in the returned array).
		
		Used internally by the InputPlugin but also useful if you wish to find out the display depth of
		this Game Object and all of its ancestors.
	**/
	function getIndexList():Array<Float>;
	/**
		Force a sort of the display list on the next call to depthSort.
	**/
	function queueDepthSort():Void;
	/**
		Immediately sorts the display list if the flag is set.
	**/
	function depthSort():Void;
	/**
		Compare the depth of two Game Objects.
	**/
	function sortByDepth(childA:GameObject, childB:GameObject):Float;
	/**
		Returns an array which contains all Game Objects within this Layer.
		
		This is a reference to the main list array, not a copy of it, so be careful not to modify it.
	**/
	function getChildren():Array<GameObject>;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():Layer;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
	**/
	function setAlpha(?value:Float):Layer;
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
	function setBlendMode(value:ts.AnyOf2<String, global.phaser.BlendModes>):Layer;
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
	function setDepth(value:Float):Layer;
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
	function setMask(mask:ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>):Layer;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):Layer;
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
	function setPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.WebGLPipeline>, ?pipelineData:Dynamic, ?copyData:Bool):Layer;
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
	function setPostPipeline(pipelines:ts.AnyOf6<String, haxe.Constraints.Function, Array<haxe.Constraints.Function>, Array<String>, global.phaser.renderer.webgl.pipelines.PostFXPipeline, Array<global.phaser.renderer.webgl.pipelines.PostFXPipeline>>, ?pipelineData:Dynamic, ?copyData:Bool):Layer;
	/**
		Adds an entry to the `pipelineData` object belonging to this Game Object.
		
		If the 'key' already exists, its value is updated. If it doesn't exist, it is created.
		
		If `value` is undefined, and `key` exists, `key` is removed from the data object.
		
		Both the pipeline and post pipelines share the pipeline data object together.
	**/
	function setPipelineData(key:String, ?value:Dynamic):Layer;
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
	function removePostPipeline(pipeline:ts.AnyOf2<String, global.phaser.renderer.webgl.pipelines.PostFXPipeline>):Layer;
	/**
		Gets the name of the WebGL Pipeline this Game Object is currently using.
	**/
	function getPipelineName():String;
	/**
		The visible state of the Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	var visible : Bool;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):Layer;
	static var prototype : Layer;
}