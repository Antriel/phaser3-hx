package global.phaser.physics.arcade;

/**
	An Arcade Physics Image is an Image with an Arcade Physics body and related components.
	The body can be dynamic or static.
	
	The main difference between an Arcade Image and an Arcade Sprite is that you cannot animate an Arcade Image.
**/
@:native("Phaser.Physics.Arcade.Image") extern class Image extends global.phaser.gameobjects.Image {
	function new(scene:global.phaser.Scene, x:Float, y:Float, texture:ts.AnyOf2<String, global.phaser.textures.Texture>, ?frame:ts.AnyOf2<String, Float>);
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
		Sets the body's horizontal and vertical acceleration. If the vertical acceleration value is not provided, the vertical acceleration is set to the same value as the horizontal acceleration.
	**/
	function setAcceleration(x:Float, ?y:Float):Image;
	/**
		Sets the body's horizontal acceleration.
	**/
	function setAccelerationX(value:Float):Image;
	/**
		Sets the body's vertical acceleration.
	**/
	function setAccelerationY(value:Float):Image;
	/**
		Sets the angular velocity of the body.
		
		In Arcade Physics, bodies cannot rotate. They are always axis-aligned.
		However, they can have angular motion, which is passed on to the Game Object bound to the body,
		causing them to visually rotate, even though the body remains axis-aligned.
	**/
	function setAngularVelocity(value:Float):Image;
	/**
		Sets the angular acceleration of the body.
		
		In Arcade Physics, bodies cannot rotate. They are always axis-aligned.
		However, they can have angular motion, which is passed on to the Game Object bound to the body,
		causing them to visually rotate, even though the body remains axis-aligned.
	**/
	function setAngularAcceleration(value:Float):Image;
	/**
		Sets the angular drag of the body. Drag is applied to the current velocity, providing a form of deceleration.
	**/
	function setAngularDrag(value:Float):Image;
	/**
		Sets the bounce values of this body.
		
		Bounce is the amount of restitution, or elasticity, the body has when it collides with another object.
		A value of 1 means that it will retain its full velocity after the rebound. A value of 0 means it will not rebound at all.
	**/
	function setBounce(x:Float, ?y:Float):Image;
	/**
		Sets the horizontal bounce value for this body.
	**/
	function setBounceX(value:Float):Image;
	/**
		Sets the vertical bounce value for this body.
	**/
	function setBounceY(value:Float):Image;
	/**
		Sets whether this Body collides with the world boundary.
		
		Optionally also sets the World Bounce values. If the `Body.worldBounce` is null, it's set to a new Phaser.Math.Vector2 first.
	**/
	function setCollideWorldBounds(?value:Bool, ?bounceX:Float, ?bounceY:Float):Image;
	/**
		Sets the debug values of this body.
		
		Bodies will only draw their debug if debug has been enabled for Arcade Physics as a whole.
		Note that there is a performance cost in drawing debug displays. It should never be used in production.
	**/
	function setDebug(showBody:Bool, showVelocity:Bool, bodyColor:Float):Image;
	/**
		Sets the color of the body outline when it renders to the debug display.
	**/
	function setDebugBodyColor(value:Float):Image;
	/**
		Set to `true` to have this body render its outline to the debug display.
	**/
	var debugShowBody : Bool;
	/**
		Set to `true` to have this body render a velocity marker to the debug display.
	**/
	var debugShowVelocity : Bool;
	/**
		The color of the body outline when it renders to the debug display.
	**/
	var debugBodyColor : Float;
	/**
		Sets the body's horizontal and vertical drag. If the vertical drag value is not provided, the vertical drag is set to the same value as the horizontal drag.
		
		Drag can be considered as a form of deceleration that will return the velocity of a body back to zero over time.
		It is the absolute loss of velocity due to movement, in pixels per second squared.
		The x and y components are applied separately.
		
		When `useDamping` is true, this is 1 minus the damping factor.
		A value of 1 means the Body loses no velocity.
		A value of 0.95 means the Body loses 5% of its velocity per step.
		A value of 0.5 means the Body loses 50% of its velocity per step.
		
		Drag is applied only when `acceleration` is zero.
	**/
	function setDrag(x:Float, ?y:Float):Image;
	/**
		Sets the body's horizontal drag.
		
		Drag can be considered as a form of deceleration that will return the velocity of a body back to zero over time.
		It is the absolute loss of velocity due to movement, in pixels per second squared.
		The x and y components are applied separately.
		
		When `useDamping` is true, this is 1 minus the damping factor.
		A value of 1 means the Body loses no velocity.
		A value of 0.95 means the Body loses 5% of its velocity per step.
		A value of 0.5 means the Body loses 50% of its velocity per step.
		
		Drag is applied only when `acceleration` is zero.
	**/
	function setDragX(value:Float):Image;
	/**
		Sets the body's vertical drag.
		
		Drag can be considered as a form of deceleration that will return the velocity of a body back to zero over time.
		It is the absolute loss of velocity due to movement, in pixels per second squared.
		The x and y components are applied separately.
		
		When `useDamping` is true, this is 1 minus the damping factor.
		A value of 1 means the Body loses no velocity.
		A value of 0.95 means the Body loses 5% of its velocity per step.
		A value of 0.5 means the Body loses 50% of its velocity per step.
		
		Drag is applied only when `acceleration` is zero.
	**/
	function setDragY(value:Float):Image;
	/**
		If this Body is using `drag` for deceleration this function controls how the drag is applied.
		If set to `true` drag will use a damping effect rather than a linear approach. If you are
		creating a game where the Body moves freely at any angle (i.e. like the way the ship moves in
		the game Asteroids) then you will get a far smoother and more visually correct deceleration
		by using damping, avoiding the axis-drift that is prone with linear deceleration.
		
		If you enable this property then you should use far smaller `drag` values than with linear, as
		they are used as a multiplier on the velocity. Values such as 0.95 will give a nice slow
		deceleration, where-as smaller values, such as 0.5 will stop an object almost immediately.
	**/
	function setDamping(value:Bool):Image;
	/**
		Enables this Game Object's Body.
	**/
	function enableBody(reset:Bool, x:Float, y:Float, enableGameObject:Bool, showGameObject:Bool):Image;
	/**
		Stops and disables this Game Object's Body.
	**/
	function disableBody(?disableGameObject:Bool, ?hideGameObject:Bool):Image;
	/**
		Syncs the Body's position and size with its parent Game Object.
		You don't need to call this for Dynamic Bodies, as it happens automatically.
		But for Static bodies it's a useful way of modifying the position of a Static Body
		in the Physics World, based on its Game Object.
	**/
	function refreshBody():Image;
	/**
		Sets the friction of this game object's physics body.
		In Arcade Physics, friction is a special case of motion transfer from an "immovable" body to a riding body.
	**/
	function setFriction(x:Float, ?y:Float):Image;
	/**
		Sets the horizontal friction of this game object's physics body.
		This can move a riding body horizontally when it collides with this one on the vertical axis.
	**/
	function setFrictionX(x:Float):Image;
	/**
		Sets the vertical friction of this game object's physics body.
		This can move a riding body vertically when it collides with this one on the horizontal axis.
	**/
	function setFrictionY(y:Float):Image;
	/**
		Set the X and Y values of the gravitational pull to act upon this Arcade Physics Game Object. Values can be positive or negative. Larger values result in a stronger effect.
		
		If only one value is provided, this value will be used for both the X and Y axis.
	**/
	function setGravity(x:Float, ?y:Float):Image;
	/**
		Set the gravitational force to be applied to the X axis. Value can be positive or negative. Larger values result in a stronger effect.
	**/
	function setGravityX(x:Float):Image;
	/**
		Set the gravitational force to be applied to the Y axis. Value can be positive or negative. Larger values result in a stronger effect.
	**/
	function setGravityY(y:Float):Image;
	/**
		Sets if this Body can be separated during collisions with other bodies.
		
		When a body is immovable it means it won't move at all, not even to separate it from collision
		overlap. If you just wish to prevent a body from being knocked around by other bodies, see
		the `setPushable` method instead.
	**/
	function setImmovable(?value:Bool):Image;
	/**
		Sets the mass of the physics body
	**/
	function setMass(value:Float):Image;
	/**
		Sets if this Body can be pushed by another Body.
		
		A body that cannot be pushed will reflect back all of the velocity it is given to the
		colliding body. If that body is also not pushable, then the separation will be split
		between them evenly.
		
		If you want your body to never move or seperate at all, see the `setImmovable` method.
	**/
	function setPushable(?value:Bool):Image;
	/**
		Sets the body offset. This allows you to adjust the difference between the center of the body
		and the x and y coordinates of the parent Game Object.
	**/
	function setOffset(x:Float, ?y:Float):Image;
	/**
		Sets the size of this physics body. Setting the size does not adjust the dimensions of the parent Game Object.
	**/
	function setBodySize(width:Float, height:Float, ?center:Bool):Image;
	/**
		Sets this physics body to use a circle for collision instead of a rectangle.
	**/
	function setCircle(radius:Float, ?offsetX:Float, ?offsetY:Float):Image;
	/**
		Sets the velocity of the Body.
	**/
	function setVelocity(x:Float, ?y:Float):Image;
	/**
		Sets the horizontal component of the body's velocity.
		
		Positive values move the body to the right, while negative values move it to the left.
	**/
	function setVelocityX(x:Float):Image;
	/**
		Sets the vertical component of the body's velocity.
		
		Positive values move the body down, while negative values move it up.
	**/
	function setVelocityY(y:Float):Image;
	/**
		Sets the maximum velocity of the body.
	**/
	function setMaxVelocity(x:Float, ?y:Float):Image;
	/**
		Sets the `active` property of this Game Object and returns this Game Object for further chaining.
		A Game Object with its `active` property set to `true` will be updated by the Scenes UpdateList.
	**/
	function setActive(value:Bool):Image;
	/**
		Sets the `name` property of this Game Object and returns this Game Object for further chaining.
		The `name` property is not populated by Phaser and is presented for your own use.
	**/
	function setName(value:String):Image;
	/**
		Sets the current state of this Game Object.
		
		Phaser itself will never modify the State of a Game Object, although plugins may do so.
		
		For example, a Game Object could change from a state of 'moving', to 'attacking', to 'dead'.
		The state value should typically be an integer (ideally mapped to a constant
		in your game code), but could also be a string. It is recommended to keep it light and simple.
		If you need to store complex data about your Game Object, look at using the Data Component instead.
	**/
	function setState(value:ts.AnyOf2<String, Float>):Image;
	/**
		Adds a Data Manager component to this Game Object.
	**/
	function setDataEnabled():Image;
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
	function setData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Image;
	/**
		Increase a value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is increased from 0.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function incData(key:ts.AnyOf2<String, Dynamic>, ?data:Dynamic):Image;
	/**
		Toggle a boolean value for the given key within this Game Objects Data Manager. If the key doesn't already exist in the Data Manager then it is toggled from false.
		
		If the Game Object has not been enabled for data (via `setDataEnabled`) then it will be enabled
		before setting the value.
		
		If the key doesn't already exist in the Data Manager then it is created.
		
		When the value is first set, a `setdata` event is emitted from this Game Object.
	**/
	function toggleData(key:ts.AnyOf2<String, Dynamic>):Image;
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
	function setInteractive(?hitArea:Dynamic, ?callback:global.phaser.types.input.HitAreaCallback, ?dropZone:Bool):Image;
	/**
		If this Game Object has previously been enabled for input, this will disable it.
		
		An object that is disabled for input stops processing or being considered for
		input events, but can be turned back on again at any time by simply calling
		`setInteractive()` with no arguments provided.
		
		If want to completely remove interaction from this Game Object then use `removeInteractive` instead.
	**/
	function disableInteractive():Image;
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
	function removeInteractive():Image;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Image;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Image;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Image;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Image;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Image;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Image;
	static var prototype : Image;
}