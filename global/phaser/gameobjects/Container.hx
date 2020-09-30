package global.phaser.gameobjects;

/**
	A Container Game Object.
	
	A Container, as the name implies, can 'contain' other types of Game Object.
	When a Game Object is added to a Container, the Container becomes responsible for the rendering of it.
	By default it will be removed from the Display List and instead added to the Containers own internal list.
	
	The position of the Game Object automatically becomes relative to the position of the Container.
	
	The origin of a Container is 0x0 (in local space) and that cannot be changed. The children you add to the
	Container should be positioned with this value in mind. I.e. you should treat 0x0 as being the center of
	the Container, and position children positively and negative around it as required.
	
	When the Container is rendered, all of its children are rendered as well, in the order in which they exist
	within the Container. Container children can be repositioned using methods such as `MoveUp`, `MoveDown` and `SendToBack`.
	
	If you modify a transform property of the Container, such as `Container.x` or `Container.rotation` then it will
	automatically influence all children as well.
	
	Containers can include other Containers for deeply nested transforms.
	
	Containers can have masks set on them and can be used as a mask too. However, Container children cannot be masked.
	The masks do not 'stack up'. Only a Container on the root of the display list will use its mask.
	
	Containers can be enabled for input. Because they do not have a texture you need to provide a shape for them
	to use as their hit area. Container children can also be enabled for input, independent of the Container.
	
	Containers can be given a physics body for either Arcade Physics, Impact Physics or Matter Physics. However,
	if Container _children_ are enabled for physics you may get unexpected results, such as offset bodies,
	if the Container itself, or any of its ancestors, is positioned anywhere other than at 0 x 0. Container children
	with physics do not factor in the Container due to the excessive extra calculations needed. Please structure
	your game to work around this.
	
	It's important to understand the impact of using Containers. They add additional processing overhead into
	every one of their children. The deeper you nest them, the more the cost escalates. This is especially true
	for input events. You also loose the ability to set the display depth of Container children in the same
	flexible manner as those not within them. In short, don't use them for the sake of it. You pay a small cost
	every time you create one, try to structure your game around avoiding that where possible.
**/
@:native("Phaser.GameObjects.Container") extern class Container extends GameObject {
	function new(scene:global.phaser.Scene, ?x:Float, ?y:Float, ?children:Array<GameObject>);
	/**
		An array holding the children of this Container.
	**/
	var list : Array<GameObject>;
	/**
		Does this Container exclusively manage its children?
		
		The default is `true` which means a child added to this Container cannot
		belong in another Container, which includes the Scene display list.
		
		If you disable this then this Container will no longer exclusively manage its children.
		This allows you to create all kinds of interesting graphical effects, such as replicating
		Game Objects without reparenting them all over the Scene.
		However, doing so will prevent children from receiving any kind of input event or have
		their physics bodies work by default, as they're no longer a single entity on the
		display list, but are being replicated where-ever this Container is.
	**/
	var exclusive : Bool;
	/**
		Containers can have an optional maximum size. If set to anything above 0 it
		will constrict the addition of new Game Objects into the Container, capping off
		the maximum limit the Container can grow in size to.
	**/
	var maxSize : Float;
	/**
		The cursor position.
	**/
	var position : Float;
	/**
		Internal Transform Matrix used for local space conversion.
	**/
	var localTransform : global.phaser.gameobjects.components.TransformMatrix;
	/**
		The horizontal scroll factor of this Container.
		
		The scroll factor controls the influence of the movement of a Camera upon this Container.
		
		When a camera scrolls it will change the location at which this Container is rendered on-screen.
		It does not change the Containers actual position values.
		
		For a Container, setting this value will only update the Container itself, not its children.
		If you wish to change the scrollFactor of the children as well, use the `setScrollFactor` method.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Container.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorX : Float;
	/**
		The vertical scroll factor of this Container.
		
		The scroll factor controls the influence of the movement of a Camera upon this Container.
		
		When a camera scrolls it will change the location at which this Container is rendered on-screen.
		It does not change the Containers actual position values.
		
		For a Container, setting this value will only update the Container itself, not its children.
		If you wish to change the scrollFactor of the children as well, use the `setScrollFactor` method.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Container.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorY : Float;
	/**
		Internal value to allow Containers to be used for input and physics.
		Do not change this value. It has no effect other than to break things.
	**/
	final originX : Float;
	/**
		Internal value to allow Containers to be used for input and physics.
		Do not change this value. It has no effect other than to break things.
	**/
	final originY : Float;
	/**
		Internal value to allow Containers to be used for input and physics.
		Do not change this value. It has no effect other than to break things.
	**/
	final displayOriginX : Float;
	/**
		Internal value to allow Containers to be used for input and physics.
		Do not change this value. It has no effect other than to break things.
	**/
	final displayOriginY : Float;
	/**
		Does this Container exclusively manage its children?
		
		The default is `true` which means a child added to this Container cannot
		belong in another Container, which includes the Scene display list.
		
		If you disable this then this Container will no longer exclusively manage its children.
		This allows you to create all kinds of interesting graphical effects, such as replicating
		Game Objects without reparenting them all over the Scene.
		However, doing so will prevent children from receiving any kind of input event or have
		their physics bodies work by default, as they're no longer a single entity on the
		display list, but are being replicated where-ever this Container is.
	**/
	function setExclusive(?value:Bool):Container;
	/**
		Gets the bounds of this Container. It works by iterating all children of the Container,
		getting their respective bounds, and then working out a min-max rectangle from that.
		It does not factor in if the children render or not, all are included.
		
		Some children are unable to return their bounds, such as Graphics objects, in which case
		they are skipped.
		
		Depending on the quantity of children in this Container it could be a really expensive call,
		so cache it and only poll it as needed.
		
		The values are stored and returned in a Rectangle object.
	**/
	function getBounds(?output:global.phaser.geom.Rectangle):global.phaser.geom.Rectangle;
	/**
		Takes a Point-like object, such as a Vector2, Geom.Point or object with public x and y properties,
		and transforms it into the space of this Container, then returns it in the output object.
	**/
	function pointToContainer(source:ts.AnyOf3<Dynamic, global.phaser.math.Vector2, global.phaser.geom.Point>, ?output:ts.AnyOf3<Dynamic, global.phaser.math.Vector2, global.phaser.geom.Point>):ts.AnyOf3<Dynamic, global.phaser.math.Vector2, global.phaser.geom.Point>;
	/**
		Returns the world transform matrix as used for Bounds checks.
		
		The returned matrix is temporal and shouldn't be stored.
	**/
	function getBoundsTransformMatrix():global.phaser.gameobjects.components.TransformMatrix;
	/**
		Adds the given Game Object, or array of Game Objects, to this Container.
		
		Each Game Object must be unique within the Container.
	**/
	function add(child:ts.AnyOf2<GameObject, Array<GameObject>>):Container;
	/**
		Adds the given Game Object, or array of Game Objects, to this Container at the specified position.
		
		Existing Game Objects in the Container are shifted up.
		
		Each Game Object must be unique within the Container.
	**/
	function addAt(child:ts.AnyOf2<GameObject, Array<GameObject>>, ?index:Float):Container;
	/**
		Returns the Game Object at the given position in this Container.
	**/
	function getAt(index:Float):GameObject;
	/**
		Returns the index of the given Game Object in this Container.
	**/
	function getIndex(child:GameObject):Float;
	/**
		Sort the contents of this Container so the items are in order based on the given property.
		For example: `sort('alpha')` would sort the elements based on the value of their `alpha` property.
	**/
	function sort(property:String, ?handler:haxe.Constraints.Function):Container;
	/**
		Searches for the first instance of a child with its `name` property matching the given argument.
		Should more than one child have the same name only the first is returned.
	**/
	function getByName(name:String):GameObject;
	/**
		Returns a random Game Object from this Container.
	**/
	function getRandom(?startIndex:Float, ?length:Float):GameObject;
	/**
		Gets the first Game Object in this Container.
		
		You can also specify a property and value to search for, in which case it will return the first
		Game Object in this Container with a matching property and / or value.
		
		For example: `getFirst('visible', true)` would return the first Game Object that had its `visible` property set.
		
		You can limit the search to the `startIndex` - `endIndex` range.
	**/
	function getFirst(property:String, value:Dynamic, ?startIndex:Float, ?endIndex:Float):GameObject;
	/**
		Returns all Game Objects in this Container.
		
		You can optionally specify a matching criteria using the `property` and `value` arguments.
		
		For example: `getAll('body')` would return only Game Objects that have a body property.
		
		You can also specify a value to compare the property to:
		
		`getAll('visible', true)` would return only Game Objects that have their visible property set to `true`.
		
		Optionally you can specify a start and end index. For example if this Container had 100 Game Objects,
		and you set `startIndex` to 0 and `endIndex` to 50, it would return matches from only
		the first 50 Game Objects.
	**/
	function getAll(?property:String, ?value:Dynamic, ?startIndex:Float, ?endIndex:Float):Array<GameObject>;
	/**
		Returns the total number of Game Objects in this Container that have a property
		matching the given value.
		
		For example: `count('visible', true)` would count all the elements that have their visible property set.
		
		You can optionally limit the operation to the `startIndex` - `endIndex` range.
	**/
	function count(property:String, value:Dynamic, ?startIndex:Float, ?endIndex:Float):Float;
	/**
		Swaps the position of two Game Objects in this Container.
		Both Game Objects must belong to this Container.
	**/
	function swap(child1:GameObject, child2:GameObject):Container;
	/**
		Moves a Game Object to a new position within this Container.
		
		The Game Object must already be a child of this Container.
		
		The Game Object is removed from its old position and inserted into the new one.
		Therefore the Container size does not change. Other children will change position accordingly.
	**/
	function moveTo(child:GameObject, index:Float):Container;
	/**
		Removes the given Game Object, or array of Game Objects, from this Container.
		
		The Game Objects must already be children of this Container.
		
		You can also optionally call `destroy` on each Game Object that is removed from the Container.
	**/
	function remove(child:ts.AnyOf2<GameObject, Array<GameObject>>, ?destroyChild:Bool):Container;
	/**
		Removes the Game Object at the given position in this Container.
		
		You can also optionally call `destroy` on the Game Object, if one is found.
	**/
	function removeAt(index:Float, ?destroyChild:Bool):Container;
	/**
		Removes the Game Objects between the given positions in this Container.
		
		You can also optionally call `destroy` on each Game Object that is removed from the Container.
	**/
	function removeBetween(?startIndex:Float, ?endIndex:Float, ?destroyChild:Bool):Container;
	/**
		Removes all Game Objects from this Container.
		
		You can also optionally call `destroy` on each Game Object that is removed from the Container.
	**/
	function removeAll(?destroyChild:Bool):Container;
	/**
		Brings the given Game Object to the top of this Container.
		This will cause it to render on-top of any other objects in the Container.
	**/
	function bringToTop(child:GameObject):Container;
	/**
		Sends the given Game Object to the bottom of this Container.
		This will cause it to render below any other objects in the Container.
	**/
	function sendToBack(child:GameObject):Container;
	/**
		Moves the given Game Object up one place in this Container, unless it's already at the top.
	**/
	function moveUp(child:GameObject):Container;
	/**
		Moves the given Game Object down one place in this Container, unless it's already at the bottom.
	**/
	function moveDown(child:GameObject):Container;
	/**
		Reverses the order of all Game Objects in this Container.
	**/
	function reverse():Container;
	/**
		Shuffles the all Game Objects in this Container using the Fisher-Yates implementation.
	**/
	function shuffle():Container;
	/**
		Replaces a Game Object in this Container with the new Game Object.
		The new Game Object cannot already be a child of this Container.
	**/
	function replace(oldChild:GameObject, newChild:GameObject, ?destroyChild:Bool):Container;
	/**
		Returns `true` if the given Game Object is a direct child of this Container.
		
		This check does not scan nested Containers.
	**/
	function exists(child:GameObject):Bool;
	/**
		Sets the property to the given value on all Game Objects in this Container.
		
		Optionally you can specify a start and end index. For example if this Container had 100 Game Objects,
		and you set `startIndex` to 0 and `endIndex` to 50, it would return matches from only
		the first 50 Game Objects.
	**/
	function setAll(property:String, value:Dynamic, ?startIndex:Float, ?endIndex:Float):Container;
	/**
		Passes all Game Objects in this Container to the given callback.
		
		A copy of the Container is made before passing each entry to your callback.
		This protects against the callback itself modifying the Container.
		
		If you know for sure that the callback will not change the size of this Container
		then you can use the more performant `Container.iterate` method instead.
	**/
	function each(callback:haxe.Constraints.Function, ?context:Dynamic, args:haxe.extern.Rest<Dynamic>):Container;
	/**
		Passes all Game Objects in this Container to the given callback.
		
		Only use this method when you absolutely know that the Container will not be modified during
		the iteration, i.e. by removing or adding to its contents.
	**/
	function iterate(callback:haxe.Constraints.Function, ?context:Dynamic, args:haxe.extern.Rest<Dynamic>):Container;
	/**
		Sets the scroll factor of this Container and optionally all of its children.
		
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
	function setScrollFactor(x:Float, ?y:Float, ?updateChildren:Bool):Container;
	/**
		The number of Game Objects inside this Container.
	**/
	final length : Float;
	/**
		Returns the first Game Object within the Container, or `null` if it is empty.
		
		You can move the cursor by calling `Container.next` and `Container.previous`.
	**/
	final first : GameObject;
	/**
		Returns the last Game Object within the Container, or `null` if it is empty.
		
		You can move the cursor by calling `Container.next` and `Container.previous`.
	**/
	final last : GameObject;
	/**
		Returns the next Game Object within the Container, or `null` if it is empty.
		
		You can move the cursor by calling `Container.next` and `Container.previous`.
	**/
	final next : GameObject;
	/**
		Returns the previous Game Object within the Container, or `null` if it is empty.
		
		You can move the cursor by calling `Container.next` and `Container.previous`.
	**/
	final previous : GameObject;
	/**
		Internal destroy handler, called as part of the destroy process.
	**/
	private function preDestroy():Void;
	/**
		Clears all alpha values associated with this Game Object.
		
		Immediately sets the alpha levels back to 1 (fully opaque).
	**/
	function clearAlpha():Container;
	/**
		Set the Alpha level of this Game Object. The alpha controls the opacity of the Game Object as it renders.
		Alpha values are provided as a float between 0, fully transparent, and 1, fully opaque.
	**/
	function setAlpha(?value:Float):Container;
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
	function setBlendMode(value:ts.AnyOf2<String, global.phaser.BlendModes>):Container;
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
	function setSize(width:Float, height:Float):Container;
	/**
		Sets the display size of this Game Object.
		
		Calling this will adjust the scale.
	**/
	function setDisplaySize(width:Float, height:Float):Container;
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
	function setDepth(value:Float):Container;
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
	function setMask(mask:ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>):Container;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):Container;
	/**
		Creates and returns a Bitmap Mask. This mask can be used by any Game Object,
		including this one.
		
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
	function setPosition(?x:Float, ?y:Float, ?z:Float, ?w:Float):Container;
	/**
		Sets the position of this Game Object to be a random position within the confines of
		the given area.
		
		If no area is specified a random position between 0 x 0 and the game width x height is used instead.
		
		The position does not factor in the size of this Game Object, meaning that only the origin is
		guaranteed to be within the area.
	**/
	function setRandomPosition(?x:Float, ?y:Float, ?width:Float, ?height:Float):Container;
	/**
		Sets the rotation of this Game Object.
	**/
	function setRotation(?radians:Float):Container;
	/**
		Sets the angle of this Game Object.
	**/
	function setAngle(?degrees:Float):Container;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(x:Float, ?y:Float):Container;
	/**
		Sets the x position of this Game Object.
	**/
	function setX(?value:Float):Container;
	/**
		Sets the y position of this Game Object.
	**/
	function setY(?value:Float):Container;
	/**
		Sets the z position of this Game Object.
		
		Note: The z position does not control the rendering order of 2D Game Objects. Use
		{@link Phaser.GameObjects.Components.Depth#setDepth} instead.
	**/
	function setZ(?value:Float):Container;
	/**
		Sets the w position of this Game Object.
	**/
	function setW(?value:Float):Container;
	/**
		Gets the local transform matrix for this Game Object.
	**/
	function getLocalTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
	/**
		Gets the world transform matrix for this Game Object, factoring in any parent Containers.
	**/
	function getWorldTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix, ?parentMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
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
	function setVisible(value:Bool):Container;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):Container;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Container;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):Container;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():Container;
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
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Container;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Container;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):Container;
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
	function setInteractive(?shape:Dynamic, ?callback:global.phaser.types.input.HitAreaCallback, ?dropZone:Bool):Container;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():Container;
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
	function removeInteractive():Container;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Container;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Container;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Container;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Container;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Container;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Container;
	static var prototype : Container;
}