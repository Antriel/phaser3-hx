package global.phaser.physics.matter;

/**
	A Matter Physics Sprite Game Object.
	
	A Sprite Game Object is used for the display of both static and animated images in your game.
	Sprites can have input events and physics bodies. They can also be tweened, tinted, scrolled
	and animated.
	
	The main difference between a Sprite and an Image Game Object is that you cannot animate Images.
	As such, Sprites take a fraction longer to process and have a larger API footprint due to the Animation
	Component. If you do not require animation then you can safely use Images to replace Sprites in all cases.
**/
@:native("Phaser.Physics.Matter.Sprite") extern class Sprite extends global.phaser.gameobjects.Sprite {
	function new(world:World, x:Float, y:Float, texture:ts.AnyOf2<String, global.phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>, ?options:global.phaser.types.physics.matter.MatterBodyConfig);
	/**
		A reference to the Matter.World instance that this body belongs to.
	**/
	var world : World;
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
	function createBitmapMask(?renderable:global.phaser.gameobjects.GameObject):global.phaser.display.masks.BitmapMask;
	/**
		Creates and returns a Geometry Mask. This mask can be used by any Game Object,
		including this one.
		
		To create the mask you need to pass in a reference to a Graphics Game Object.
		
		If you do not provide a graphics object, and this Game Object is an instance
		of a Graphics object, then it will use itself to create the mask.
		
		This means you can call this method to create a Geometry Mask from any Graphics Game Object.
	**/
	function createGeometryMask(?graphics:global.phaser.gameobjects.Graphics):global.phaser.display.masks.GeometryMask;
	/**
		Gets the local transform matrix for this Game Object.
	**/
	function getLocalTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
	/**
		Gets the world transform matrix for this Game Object, factoring in any parent Containers.
	**/
	function getWorldTransformMatrix(?tempMatrix:global.phaser.gameobjects.components.TransformMatrix, ?parentMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.gameobjects.components.TransformMatrix;
	/**
		Sets the restitution on the physics object.
	**/
	function setBounce(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets the collision category of this Game Object's Matter Body. This number must be a power of two between 2^0 (= 1) and 2^31.
		Two bodies with different collision groups (see {@link #setCollisionGroup}) will only collide if their collision
		categories are included in their collision masks (see {@link #setCollidesWith}).
	**/
	function setCollisionCategory(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets the collision group of this Game Object's Matter Body. If this is zero or two Matter Bodies have different values,
		they will collide according to the usual rules (see {@link #setCollisionCategory} and {@link #setCollisionGroup}).
		If two Matter Bodies have the same positive value, they will always collide; if they have the same negative value,
		they will never collide.
	**/
	function setCollisionGroup(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets the collision mask for this Game Object's Matter Body. Two Matter Bodies with different collision groups will only
		collide if each one includes the other's category in its mask based on a bitwise AND, i.e. `(categoryA & maskB) !== 0`
		and `(categoryB & maskA) !== 0` are both true.
	**/
	function setCollidesWith(categories:ts.AnyOf2<Float, Array<Float>>):global.phaser.gameobjects.GameObject;
	/**
		The callback is sent a `Phaser.Types.Physics.Matter.MatterCollisionData` object.
		
		This does not change the bodies collision category, group or filter. Those must be set in addition
		to the callback.
	**/
	function setOnCollide(callback:haxe.Constraints.Function):global.phaser.gameobjects.GameObject;
	/**
		The callback is sent a `Phaser.Types.Physics.Matter.MatterCollisionData` object.
		
		This does not change the bodies collision category, group or filter. Those must be set in addition
		to the callback.
	**/
	function setOnCollideEnd(callback:haxe.Constraints.Function):global.phaser.gameobjects.GameObject;
	/**
		The callback is sent a `Phaser.Types.Physics.Matter.MatterCollisionData` object.
		
		This does not change the bodies collision category, group or filter. Those must be set in addition
		to the callback.
	**/
	function setOnCollideActive(callback:haxe.Constraints.Function):global.phaser.gameobjects.GameObject;
	/**
		The callback is sent a reference to the other body, along with a `Phaser.Types.Physics.Matter.MatterCollisionData` object.
		
		This does not change the bodies collision category, group or filter. Those must be set in addition
		to the callback.
	**/
	function setOnCollideWith(body:ts.AnyOf2<global.matterjs.Body, Array<global.matterjs.Body>>, callback:haxe.Constraints.Function):global.phaser.gameobjects.GameObject;
	/**
		Applies a force to a body.
	**/
	function applyForce(force:global.phaser.math.Vector2):global.phaser.gameobjects.GameObject;
	/**
		Applies a force to a body from a given position.
	**/
	function applyForceFrom(position:global.phaser.math.Vector2, force:global.phaser.math.Vector2):global.phaser.gameobjects.GameObject;
	/**
		Apply thrust to the forward position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrust(speed:Float):global.phaser.gameobjects.GameObject;
	/**
		Apply thrust to the left position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrustLeft(speed:Float):global.phaser.gameobjects.GameObject;
	/**
		Apply thrust to the right position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrustRight(speed:Float):global.phaser.gameobjects.GameObject;
	/**
		Apply thrust to the back position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrustBack(speed:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets new friction values for this Game Object's Matter Body.
	**/
	function setFriction(value:Float, ?air:Float, ?fstatic:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets a new air resistance for this Game Object's Matter Body.
		A value of 0 means the Body will never slow as it moves through space.
		The higher the value, the faster a Body slows when moving through space.
	**/
	function setFrictionAir(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets a new static friction for this Game Object's Matter Body.
		A value of 0 means the Body will never "stick" when it is nearly stationary.
		The higher the value (e.g. 10), the more force it will take to initially get the Body moving when it is nearly stationary.
	**/
	function setFrictionStatic(value:Float):global.phaser.gameobjects.GameObject;
	/**
		A togglable function for ignoring world gravity in real-time on the current body.
	**/
	function setIgnoreGravity(value:Bool):global.phaser.gameobjects.GameObject;
	/**
		Sets the mass of the Game Object's Matter Body.
	**/
	function setMass(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets density of the body.
	**/
	function setDensity(value:Float):global.phaser.gameobjects.GameObject;
	/**
		The body's center of mass.
		
		Calling this creates a new `Vector2 each time to avoid mutation.
		
		If you only need to read the value and won't change it, you can get it from `GameObject.body.centerOfMass`.
	**/
	final centerOfMass : global.phaser.math.Vector2;
	/**
		Set the body belonging to this Game Object to be a sensor.
		Sensors trigger collision events, but don't react with colliding body physically.
	**/
	function setSensor(value:Bool):global.phaser.gameobjects.GameObject;
	/**
		Is the body belonging to this Game Object a sensor or not?
	**/
	function isSensor():Bool;
	/**
		Set the body on a Game Object to a rectangle.
		
		Calling this methods resets previous properties you may have set on the body, including
		plugins, mass, friction, etc. So be sure to re-apply these in the options object if needed.
	**/
	function setRectangle(width:Float, height:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.phaser.gameobjects.GameObject;
	/**
		Set the body on a Game Object to a circle.
		
		Calling this methods resets previous properties you may have set on the body, including
		plugins, mass, friction, etc. So be sure to re-apply these in the options object if needed.
	**/
	function setCircle(radius:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.phaser.gameobjects.GameObject;
	/**
		Set the body on the Game Object to a polygon shape.
		
		Calling this methods resets previous properties you may have set on the body, including
		plugins, mass, friction, etc. So be sure to re-apply these in the options object if needed.
	**/
	function setPolygon(sides:Float, radius:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.phaser.gameobjects.GameObject;
	/**
		Set the body on the Game Object to a trapezoid shape.
		
		Calling this methods resets previous properties you may have set on the body, including
		plugins, mass, friction, etc. So be sure to re-apply these in the options object if needed.
	**/
	function setTrapezoid(width:Float, height:Float, slope:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.phaser.gameobjects.GameObject;
	/**
		Set this Game Object to use the given existing Matter Body.
		
		The body is first removed from the world before being added to this Game Object.
	**/
	function setExistingBody(body:global.matterjs.BodyType, ?addToWorld:Bool):global.phaser.gameobjects.GameObject;
	/**
		Set this Game Object to create and use a new Body based on the configuration object given.
		
		Calling this method resets previous properties you may have set on the body, including
		plugins, mass, friction, etc. So be sure to re-apply these in the options object if needed.
	**/
	function setBody(config:ts.AnyOf2<String, global.phaser.types.physics.matter.MatterSetBodyConfig>, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.phaser.gameobjects.GameObject;
	/**
		Sets this Body to sleep.
	**/
	function setToSleep():Sprite;
	/**
		Wakes this Body if asleep.
	**/
	function setAwake():Sprite;
	/**
		Sets the number of updates in which this body must have near-zero velocity before it is set as sleeping (if sleeping is enabled by the engine).
	**/
	function setSleepThreshold(?value:Float):Sprite;
	/**
		Enable sleep and wake events for this body.
		
		By default when a body goes to sleep, or wakes up, it will not emit any events.
		
		The events are emitted by the Matter World instance and can be listened to via
		the `SLEEP_START` and `SLEEP_END` events.
	**/
	function setSleepEvents(start:Bool, end:Bool):Sprite;
	/**
		Enables or disables the Sleep Start event for this body.
	**/
	function setSleepStartEvent(value:Bool):Sprite;
	/**
		Enables or disables the Sleep End event for this body.
	**/
	function setSleepEndEvent(value:Bool):Sprite;
	/**
		Changes the physics body to be either static `true` or dynamic `false`.
	**/
	function setStatic(value:Bool):global.phaser.gameobjects.GameObject;
	/**
		Returns `true` if the body is static, otherwise `false` for a dynamic body.
	**/
	function isStatic():Bool;
	/**
		Setting fixed rotation sets the Body inertia to Infinity, which stops it
		from being able to rotate when forces are applied to it.
	**/
	function setFixedRotation():Sprite;
	/**
		Sets the angular velocity of the body instantly.
		Position, angle, force etc. are unchanged.
	**/
	function setAngularVelocity(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets the horizontal velocity of the physics body.
	**/
	function setVelocityX(x:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets vertical velocity of the physics body.
	**/
	function setVelocityY(y:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets both the horizontal and vertical velocity of the physics body.
	**/
	function setVelocity(x:Float, ?y:Float):global.phaser.gameobjects.GameObject;
	/**
		Start playing the given animation.
	**/
	function play(key:String, ?ignoreIfPlaying:Bool, ?startFrame:Float):Sprite;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):Sprite;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Sprite;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):Sprite;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():Sprite;
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
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Sprite;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Sprite;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):Sprite;
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
	function setInteractive(?shape:Dynamic, ?callback:global.phaser.types.input.HitAreaCallback, ?dropZone:Bool):Sprite;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():Sprite;
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
	function removeInteractive():Sprite;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Sprite;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Sprite;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Sprite;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Sprite;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Sprite;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Sprite;
	static var prototype : Sprite;
}