package global.phaser.input;

/**
	A Pointer object encapsulates both mouse and touch input within Phaser.
	
	By default, Phaser will create 2 pointers for your game to use. If you require more, i.e. for a multi-touch
	game, then use the `InputPlugin.addPointer` method to do so, rather than instantiating this class directly,
	otherwise it won't be managed by the input system.
	
	You can reference the current active pointer via `InputPlugin.activePointer`. You can also use the properties
	`InputPlugin.pointer1` through to `pointer10`, for each pointer you have enabled in your game.
	
	The properties of this object are set by the Input Plugin during processing. This object is then sent in all
	input related events that the Input Plugin emits, so you can reference properties from it directly in your
	callbacks.
**/
@:native("Phaser.Input.Pointer") extern class Pointer {
	function new(manager:InputManager, id:Float);
	/**
		A reference to the Input Manager.
	**/
	var manager : InputManager;
	/**
		The internal ID of this Pointer.
	**/
	final id : Float;
	/**
		The most recent native DOM Event this Pointer has processed.
	**/
	var event : ts.AnyOf2<js.html.TouchEvent, js.html.MouseEvent>;
	/**
		The DOM element the Pointer was pressed down on, taken from the DOM event.
		In a default set-up this will be the Canvas that Phaser is rendering to, or the Window element.
	**/
	final downElement : Dynamic;
	/**
		The DOM element the Pointer was released on, taken from the DOM event.
		In a default set-up this will be the Canvas that Phaser is rendering to, or the Window element.
	**/
	final upElement : Dynamic;
	/**
		The camera the Pointer interacted with during its last update.
		
		A Pointer can only ever interact with one camera at once, which will be the top-most camera
		in the list should multiple cameras be positioned on-top of each other.
	**/
	var camera : global.phaser.cameras.scene2d.Camera;
	/**
		A read-only property that indicates which button was pressed, or released, on the pointer
		during the most recent event. It is only set during `up` and `down` events.
		
		On Touch devices the value is always 0.
		
		Users may change the configuration of buttons on their pointing device so that if an event's button property
		is zero, it may not have been caused by the button that is physically left–most on the pointing device;
		however, it should behave as if the left button was clicked in the standard button layout.
	**/
	final button : Float;
	/**
		0: No button or un-initialized
		1: Left button
		2: Right button
		4: Wheel button or middle button
		8: 4th button (typically the "Browser Back" button)
		16: 5th button (typically the "Browser Forward" button)
		
		For a mouse configured for left-handed use, the button actions are reversed.
		In this case, the values are read from right to left.
	**/
	var buttons : Float;
	/**
		The position of the Pointer in screen space.
	**/
	final position : global.phaser.math.Vector2;
	/**
		The previous position of the Pointer in screen space.
		
		The old x and y values are stored in here during the InputManager.transformPointer call.
		
		Use the properties `velocity`, `angle` and `distance` to create your own gesture recognition.
	**/
	final prevPosition : global.phaser.math.Vector2;
	/**
		The current velocity of the Pointer, based on its current and previous positions.
		
		This value is smoothed out each frame, according to the `motionFactor` property.
		
		This property is updated whenever the Pointer moves, regardless of any button states. In other words,
		it changes based on movement alone - a button doesn't have to be pressed first.
	**/
	final velocity : global.phaser.math.Vector2;
	/**
		The current angle the Pointer is moving, in radians, based on its previous and current position.
		
		The angle is based on the old position facing to the current position.
		
		This property is updated whenever the Pointer moves, regardless of any button states. In other words,
		it changes based on movement alone - a button doesn't have to be pressed first.
	**/
	final angle : Float;
	/**
		The distance the Pointer has moved, based on its previous and current position.
		
		This value is smoothed out each frame, according to the `motionFactor` property.
		
		This property is updated whenever the Pointer moves, regardless of any button states. In other words,
		it changes based on movement alone - a button doesn't have to be pressed first.
		
		If you need the total distance travelled since the primary buttons was pressed down,
		then use the `Pointer.getDistance` method.
	**/
	final distance : Float;
	/**
		The smoothing factor to apply to the Pointer position.
		
		Due to their nature, pointer positions are inherently noisy. While this is fine for lots of games, if you need cleaner positions
		then you can set this value to apply an automatic smoothing to the positions as they are recorded.
		
		The default value of zero means 'no smoothing'.
		Set to a small value, such as 0.2, to apply an average level of smoothing between positions. You can do this by changing this
		value directly, or by setting the `input.smoothFactor` property in the Game Config.
		
		Positions are only smoothed when the pointer moves. If the primary button on this Pointer enters an Up or Down state, then the position
		is always precise, and not smoothed.
	**/
	var smoothFactor : Float;
	/**
		The factor applied to the motion smoothing each frame.
		
		This value is passed to the Smooth Step Interpolation that is used to calculate the velocity,
		angle and distance of the Pointer. It's applied every frame, until the midPoint reaches the current
		position of the Pointer. 0.2 provides a good average but can be increased if you need a
		quicker update and are working in a high performance environment. Never set this value to
		zero.
	**/
	var motionFactor : Float;
	/**
		The x position of this Pointer, translated into the coordinate space of the most recent Camera it interacted with.
		
		If you wish to use this value _outside_ of an input event handler then you should update it first by calling
		the `Pointer.updateWorldPoint` method.
	**/
	var worldX : Float;
	/**
		The y position of this Pointer, translated into the coordinate space of the most recent Camera it interacted with.
		
		If you wish to use this value _outside_ of an input event handler then you should update it first by calling
		the `Pointer.updateWorldPoint` method.
	**/
	var worldY : Float;
	/**
		Time when this Pointer was most recently moved (regardless of the state of its buttons, if any)
	**/
	var moveTime : Float;
	/**
		X coordinate of the Pointer when Button 1 (left button), or Touch, was pressed, used for dragging objects.
	**/
	var downX : Float;
	/**
		Y coordinate of the Pointer when Button 1 (left button), or Touch, was pressed, used for dragging objects.
	**/
	var downY : Float;
	/**
		Time when Button 1 (left button), or Touch, was pressed, used for dragging objects.
	**/
	var downTime : Float;
	/**
		X coordinate of the Pointer when Button 1 (left button), or Touch, was released, used for dragging objects.
	**/
	var upX : Float;
	/**
		Y coordinate of the Pointer when Button 1 (left button), or Touch, was released, used for dragging objects.
	**/
	var upY : Float;
	/**
		Time when Button 1 (left button), or Touch, was released, used for dragging objects.
	**/
	var upTime : Float;
	/**
		Is the primary button down? (usually button 0, the left mouse button)
	**/
	var primaryDown : Bool;
	/**
		Is _any_ button on this pointer considered as being down?
	**/
	var isDown : Bool;
	/**
		Did the previous input event come from a Touch input (true) or Mouse? (false)
	**/
	var wasTouch : Bool;
	/**
		Did this Pointer get canceled by a touchcancel event?
		
		Note: "canceled" is the American-English spelling of "cancelled". Please don't submit PRs correcting it!
	**/
	var wasCanceled : Bool;
	/**
		If the mouse is locked, the horizontal relative movement of the Pointer in pixels since last frame.
	**/
	var movementX : Float;
	/**
		If the mouse is locked, the vertical relative movement of the Pointer in pixels since last frame.
	**/
	var movementY : Float;
	/**
		The identifier property of the Pointer as set by the DOM event when this Pointer is started.
	**/
	var identifier : Float;
	/**
		The pointerId property of the Pointer as set by the DOM event when this Pointer is started.
		The browser can and will recycle this value.
	**/
	var pointerId : Float;
	/**
		An active Pointer is one that is currently pressed down on the display.
		A Mouse is always considered as active.
	**/
	var active : Bool;
	/**
		Is this pointer Pointer Locked?
		
		Only a mouse pointer can be locked and it only becomes locked when requested via
		the browsers Pointer Lock API.
		
		You can request this by calling the `this.input.mouse.requestPointerLock()` method from
		a `pointerdown` or `pointerup` event handler.
	**/
	final locked : Bool;
	/**
		The horizontal scroll amount that occurred due to the user moving a mouse wheel or similar input device.
	**/
	var deltaX : Float;
	/**
		The vertical scroll amount that occurred due to the user moving a mouse wheel or similar input device.
		This value will typically be less than 0 if the user scrolls up and greater than zero if scrolling down.
	**/
	var deltaY : Float;
	/**
		The z-axis scroll amount that occurred due to the user moving a mouse wheel or similar input device.
	**/
	var deltaZ : Float;
	/**
		Takes a Camera and updates this Pointer's `worldX` and `worldY` values so they are
		the result of a translation through the given Camera.
		
		Note that the values will be automatically replaced the moment the Pointer is
		updated by an input event, such as a mouse move, so should be used immediately.
	**/
	function updateWorldPoint(camera:global.phaser.cameras.scene2d.Camera):Pointer;
	/**
		Takes a Camera and returns a Vector2 containing the translated position of this Pointer
		within that Camera. This can be used to convert this Pointers position into camera space.
	**/
	function positionToCamera(camera:global.phaser.cameras.scene2d.Camera, ?output:ts.AnyOf2<Dynamic, global.phaser.math.Vector2>):ts.AnyOf2<Dynamic, global.phaser.math.Vector2>;
	/**
		Checks to see if any buttons are being held down on this Pointer.
	**/
	function noButtonDown():Bool;
	/**
		Checks to see if the left button is being held down on this Pointer.
	**/
	function leftButtonDown():Bool;
	/**
		Checks to see if the right button is being held down on this Pointer.
	**/
	function rightButtonDown():Bool;
	/**
		Checks to see if the middle button is being held down on this Pointer.
	**/
	function middleButtonDown():Bool;
	/**
		Checks to see if the back button is being held down on this Pointer.
	**/
	function backButtonDown():Bool;
	/**
		Checks to see if the forward button is being held down on this Pointer.
	**/
	function forwardButtonDown():Bool;
	/**
		Checks to see if the left button was just released on this Pointer.
	**/
	function leftButtonReleased():Bool;
	/**
		Checks to see if the right button was just released on this Pointer.
	**/
	function rightButtonReleased():Bool;
	/**
		Checks to see if the middle button was just released on this Pointer.
	**/
	function middleButtonReleased():Bool;
	/**
		Checks to see if the back button was just released on this Pointer.
	**/
	function backButtonReleased():Bool;
	/**
		Checks to see if the forward button was just released on this Pointer.
	**/
	function forwardButtonReleased():Bool;
	/**
		If the Pointer has a button pressed down at the time this method is called, it will return the
		distance between the Pointer's `downX` and `downY` values and the current position.
		
		If no button is held down, it will return the last recorded distance, based on where
		the Pointer was when the button was released.
		
		If you wish to get the distance being travelled currently, based on the velocity of the Pointer,
		then see the `Pointer.distance` property.
	**/
	function getDistance():Float;
	/**
		If the Pointer has a button pressed down at the time this method is called, it will return the
		horizontal distance between the Pointer's `downX` and `downY` values and the current position.
		
		If no button is held down, it will return the last recorded horizontal distance, based on where
		the Pointer was when the button was released.
	**/
	function getDistanceX():Float;
	/**
		If the Pointer has a button pressed down at the time this method is called, it will return the
		vertical distance between the Pointer's `downX` and `downY` values and the current position.
		
		If no button is held down, it will return the last recorded vertical distance, based on where
		the Pointer was when the button was released.
	**/
	function getDistanceY():Float;
	/**
		If the Pointer has a button pressed down at the time this method is called, it will return the
		duration since the button was pressed down.
		
		If no button is held down, it will return the last recorded duration, based on the time
		the Pointer button was released.
	**/
	function getDuration():Float;
	/**
		If the Pointer has a button pressed down at the time this method is called, it will return the
		angle between the Pointer's `downX` and `downY` values and the current position.
		
		If no button is held down, it will return the last recorded angle, based on where
		the Pointer was when the button was released.
		
		The angle is based on the old position facing to the current position.
		
		If you wish to get the current angle, based on the velocity of the Pointer, then
		see the `Pointer.angle` property.
	**/
	function getAngle():Float;
	/**
		Takes the previous and current Pointer positions and then generates an array of interpolated values between
		the two. The array will be populated up to the size of the `steps` argument.
		
		```javaScript
		var points = pointer.getInterpolatedPosition(4);
		
		// points[0] = { x: 0, y: 0 }
		// points[1] = { x: 2, y: 1 }
		// points[2] = { x: 3, y: 2 }
		// points[3] = { x: 6, y: 3 }
		```
		
		Use this if you need to get smoothed values between the previous and current pointer positions. DOM pointer
		events can often fire faster than the main browser loop, and this will help you avoid janky movement
		especially if you have an object following a Pointer.
		
		Note that if you provide an output array it will only be populated up to the number of steps provided.
		It will not clear any previous data that may have existed beyond the range of the steps count.
		
		Internally it uses the Smooth Step interpolation calculation.
	**/
	function getInterpolatedPosition(?steps:Float, ?out:Array<Dynamic>):Array<Dynamic>;
	/**
		Destroys this Pointer instance and resets its external references.
	**/
	function destroy():Void;
	/**
		The x position of this Pointer.
		The value is in screen space.
		See `worldX` to get a camera converted position.
	**/
	var x : Float;
	/**
		The y position of this Pointer.
		The value is in screen space.
		See `worldY` to get a camera converted position.
	**/
	var y : Float;
	/**
		Time when this Pointer was most recently updated by a DOM Event.
		This comes directly from the `event.timeStamp` property.
		If no event has yet taken place, it will return zero.
	**/
	final time : Float;
	static var prototype : Pointer;
}