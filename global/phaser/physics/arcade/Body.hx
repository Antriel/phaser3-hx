package global.phaser.physics.arcade;

/**
	A Dynamic Arcade Body.
	
	Its static counterpart is {@link Phaser.Physics.Arcade.StaticBody}.
**/
@:native("Phaser.Physics.Arcade.Body") extern class Body {
	function new(world:World, gameObject:global.phaser.gameobjects.GameObject);
	/**
		The Arcade Physics simulation this Body belongs to.
	**/
	var world : World;
	/**
		The Game Object this Body belongs to.
	**/
	var gameObject : global.phaser.gameobjects.GameObject;
	/**
		Transformations applied to this Body.
	**/
	var transform : Dynamic;
	/**
		Whether the Body is drawn to the debug display.
	**/
	var debugShowBody : Bool;
	/**
		Whether the Body's velocity is drawn to the debug display.
	**/
	var debugShowVelocity : Bool;
	/**
		The color of this Body on the debug display.
	**/
	var debugBodyColor : Float;
	/**
		Whether this Body is updated by the physics simulation.
	**/
	var enable : Bool;
	/**
		Whether this Body is circular (true) or rectangular (false).
	**/
	var isCircle : Bool;
	/**
		If this Body is circular, this is the unscaled radius of the Body, as set by setCircle(), in source pixels.
		The true radius is equal to `halfWidth`.
	**/
	var radius : Float;
	/**
		The offset of this Body's position from its Game Object's position, in source pixels.
	**/
	var offset : global.phaser.math.Vector2;
	/**
		The position of this Body within the simulation.
	**/
	var position : global.phaser.math.Vector2;
	/**
		The position of this Body during the previous step.
	**/
	var prev : global.phaser.math.Vector2;
	/**
		The position of this Body during the previous frame.
	**/
	var prevFrame : global.phaser.math.Vector2;
	/**
		Whether this Body's `rotation` is affected by its angular acceleration and angular velocity.
	**/
	var allowRotation : Bool;
	/**
		This body's rotation, in degrees, based on its angular acceleration and angular velocity.
		The Body's rotation controls the `angle` of its Game Object.
		It doesn't rotate the Body's own geometry, which is always an axis-aligned rectangle or a circle.
	**/
	var rotation : Float;
	/**
		The Body rotation, in degrees, during the previous step.
	**/
	var preRotation : Float;
	/**
		The width of the Body, in pixels.
		If the Body is circular, this is also the diameter.
		If you wish to change the width use the `Body.setSize` method.
	**/
	final width : Float;
	/**
		The height of the Body, in pixels.
		If the Body is circular, this is also the diameter.
		If you wish to change the height use the `Body.setSize` method.
	**/
	final height : Float;
	/**
		The unscaled width of the Body, in source pixels, as set by setSize().
		The default is the width of the Body's Game Object's texture frame.
	**/
	var sourceWidth : Float;
	/**
		The unscaled height of the Body, in source pixels, as set by setSize().
		The default is the height of the Body's Game Object's texture frame.
	**/
	var sourceHeight : Float;
	/**
		Half the Body's width, in pixels.
	**/
	var halfWidth : Float;
	/**
		Half the Body's height, in pixels.
	**/
	var halfHeight : Float;
	/**
		The center of the Body.
		The midpoint of its `position` (top-left corner) and its bottom-right corner.
	**/
	var center : global.phaser.math.Vector2;
	/**
		The Body's velocity, in pixels per second.
	**/
	var velocity : global.phaser.math.Vector2;
	/**
		The Body's change in position (due to velocity) at the last step, in pixels.
		
		The size of this value depends on the simulation's step rate.
	**/
	final newVelocity : global.phaser.math.Vector2;
	/**
		The Body's absolute maximum change in position, in pixels per step.
	**/
	var deltaMax : global.phaser.math.Vector2;
	/**
		The Body's change in velocity, in pixels per second squared.
	**/
	var acceleration : global.phaser.math.Vector2;
	/**
		Whether this Body's velocity is affected by its `drag`.
	**/
	var allowDrag : Bool;
	/**
		When `useDamping` is false (the default), this is absolute loss of velocity due to movement, in pixels per second squared.
		
		When `useDamping` is true, this is 1 minus the damping factor.
		A value of 1 means the Body loses no velocity.
		A value of 0.95 means the Body loses 5% of its velocity per step.
		A value of 0.5 means the Body loses 50% of its velocity per step.
		
		The x and y components are applied separately.
		
		Drag is applied only when `acceleration` is zero.
	**/
	var drag : global.phaser.math.Vector2;
	/**
		Whether this Body's position is affected by gravity (local or world).
	**/
	var allowGravity : Bool;
	/**
		Acceleration due to gravity (specific to this Body), in pixels per second squared.
		Total gravity is the sum of this vector and the simulation's `gravity`.
	**/
	var gravity : global.phaser.math.Vector2;
	/**
		Rebound following a collision, relative to 1.
	**/
	var bounce : global.phaser.math.Vector2;
	/**
		Rebound following a collision with the world boundary, relative to 1.
		If null, `bounce` is used instead.
	**/
	var worldBounce : global.phaser.math.Vector2;
	/**
		The rectangle used for world boundary collisions.
		
		By default it is set to the world boundary rectangle. Or, if this Body was
		created by a Physics Group, then whatever rectangle that Group defined.
		
		You can also change it by using the `Body.setBoundsRectangle` method.
	**/
	var customBoundsRectangle : global.phaser.geom.Rectangle;
	/**
		Whether the simulation emits a `worldbounds` event when this Body collides with the world boundary (and `collideWorldBounds` is also true).
	**/
	var onWorldBounds : Bool;
	/**
		Whether the simulation emits a `collide` event when this Body collides with another.
	**/
	var onCollide : Bool;
	/**
		Whether the simulation emits an `overlap` event when this Body overlaps with another.
	**/
	var onOverlap : Bool;
	/**
		The Body's absolute maximum velocity, in pixels per second.
		The horizontal and vertical components are applied separately.
	**/
	var maxVelocity : global.phaser.math.Vector2;
	/**
		The maximum speed this Body is allowed to reach, in pixels per second.
		
		If not negative it limits the scalar value of speed.
		
		Any negative value means no maximum is being applied (the default).
	**/
	var maxSpeed : Float;
	/**
		If this Body is `immovable` and in motion, `friction` is the proportion of this Body's motion received by the riding Body on each axis, relative to 1.
		The horizontal component (x) is applied only when two colliding Bodies are separated vertically.
		The vertical component (y) is applied only when two colliding Bodies are separated horizontally.
		The default value (1, 0) moves the riding Body horizontally in equal proportion to this Body and vertically not at all.
	**/
	var friction : global.phaser.math.Vector2;
	/**
		If this Body is using `drag` for deceleration this property controls how the drag is applied.
		If set to `true` drag will use a damping effect rather than a linear approach. If you are
		creating a game where the Body moves freely at any angle (i.e. like the way the ship moves in
		the game Asteroids) then you will get a far smoother and more visually correct deceleration
		by using damping, avoiding the axis-drift that is prone with linear deceleration.
		
		If you enable this property then you should use far smaller `drag` values than with linear, as
		they are used as a multiplier on the velocity. Values such as 0.95 will give a nice slow
		deceleration, where-as smaller values, such as 0.5 will stop an object almost immediately.
	**/
	var useDamping : Bool;
	/**
		The rate of change of this Body's `rotation`, in degrees per second.
	**/
	var angularVelocity : Float;
	/**
		The Body's angular acceleration (change in angular velocity), in degrees per second squared.
	**/
	var angularAcceleration : Float;
	/**
		Loss of angular velocity due to angular movement, in degrees per second.
		
		Angular drag is applied only when angular acceleration is zero.
	**/
	var angularDrag : Float;
	/**
		The Body's maximum angular velocity, in degrees per second.
	**/
	var maxAngular : Float;
	/**
		The Body's inertia, relative to a default unit (1).
		With `bounce`, this affects the exchange of momentum (velocities) during collisions.
	**/
	var mass : Float;
	/**
		The calculated angle of this Body's velocity vector, in radians, during the last step.
	**/
	var angle : Float;
	/**
		The calculated magnitude of the Body's velocity, in pixels per second, during the last step.
	**/
	var speed : Float;
	/**
		The direction of the Body's velocity, as calculated during the last step.
		This is a numeric constant value (FACING_UP, FACING_DOWN, FACING_LEFT, FACING_RIGHT).
		If the Body is moving on both axes, this describes motion on the vertical axis only.
	**/
	var facing : Float;
	/**
		Whether this Body can be moved by collisions with another Body.
	**/
	var immovable : Bool;
	/**
		Whether the Body's position and rotation are affected by its velocity, acceleration, drag, and gravity.
	**/
	var moves : Bool;
	/**
		A flag disabling the default horizontal separation of colliding bodies.
		Pass your own `collideCallback` to the collider.
	**/
	var customSeparateX : Bool;
	/**
		A flag disabling the default vertical separation of colliding bodies.
		Pass your own `collideCallback` to the collider.
	**/
	var customSeparateY : Bool;
	/**
		The amount of horizontal overlap (before separation), if this Body is colliding with another.
	**/
	var overlapX : Float;
	/**
		The amount of vertical overlap (before separation), if this Body is colliding with another.
	**/
	var overlapY : Float;
	/**
		The amount of overlap (before separation), if this Body is circular and colliding with another circular body.
	**/
	var overlapR : Float;
	/**
		Whether this Body is overlapped with another and both are not moving, on at least one axis.
	**/
	var embedded : Bool;
	/**
		Whether this Body interacts with the world boundary.
	**/
	var collideWorldBounds : Bool;
	/**
		Whether this Body is checked for collisions and for which directions.
		You can set `checkCollision.none = true` to disable collision checks.
	**/
	var checkCollision : global.phaser.types.physics.arcade.ArcadeBodyCollision;
	/**
		Whether this Body is colliding with a Body or Static Body and in which direction.
		In a collision where both bodies have zero velocity, `embedded` will be set instead.
	**/
	var touching : global.phaser.types.physics.arcade.ArcadeBodyCollision;
	/**
		This Body's `touching` value during the previous step.
	**/
	var wasTouching : global.phaser.types.physics.arcade.ArcadeBodyCollision;
	/**
		Whether this Body is colliding with a Static Body, a tile, or the world boundary.
		In a collision with a Static Body, if this Body has zero velocity then `embedded` will be set instead.
	**/
	var blocked : global.phaser.types.physics.arcade.ArcadeBodyCollision;
	/**
		Whether to automatically synchronize this Body's dimensions to the dimensions of its Game Object's visual bounds.
	**/
	var syncBounds : Bool;
	/**
		The Body's physics type (dynamic or static).
	**/
	final physicsType : Float;
	/**
		Updates the Body's `transform`, `width`, `height`, and `center` from its Game Object.
		The Body's `position` isn't changed.
	**/
	function updateBounds():Void;
	/**
		Updates the Body's `center` from its `position`, `width`, and `height`.
	**/
	function updateCenter():Void;
	/**
		Updates the Body's `position`, `width`, `height`, and `center` from its Game Object and `offset`.
		
		You don't need to call this for Dynamic Bodies, as it happens automatically during the physics step.
		But you could use it if you have modified the Body offset or Game Object transform and need to immediately
		read the Body's new `position` or `center`.
		
		To resynchronize the Body with its Game Object, use `reset()` instead.
	**/
	function updateFromGameObject():Void;
	/**
		Prepares the Body for a physics step by resetting the `wasTouching`, `touching` and `blocked` states.
		
		This method is only called if the physics world is going to run a step this frame.
	**/
	function resetFlags():Void;
	/**
		Syncs the position body position with the parent Game Object.
		
		This method is called every game frame, regardless if the world steps or not.
	**/
	function preUpdate(willStep:Bool, delta:Float):Void;
	/**
		Performs a single physics step and updates the body velocity, angle, speed and other properties.
		
		This method can be called multiple times per game frame, depending on the physics step rate.
		
		The results are synced back to the Game Object in `postUpdate`.
	**/
	function update(delta:Float):Void;
	/**
		Feeds the Body results back into the parent Game Object.
		
		This method is called every game frame, regardless if the world steps or not.
	**/
	function postUpdate():Void;
	/**
		Sets a custom collision boundary rectangle. Use if you want to have a custom
		boundary instead of the world boundaries.
	**/
	function setBoundsRectangle(?bounds:global.phaser.geom.Rectangle):Body;
	/**
		Checks for collisions between this Body and the world boundary and separates them.
	**/
	function checkWorldBounds():Bool;
	/**
		Sets the offset of the Body's position from its Game Object's position.
	**/
	function setOffset(x:Float, ?y:Float):Body;
	/**
		Sizes and positions this Body, as a rectangle.
		Modifies the Body `offset` if `center` is true (the default).
		Resets the width and height to match current frame, if no width and height provided and a frame is found.
	**/
	function setSize(?width:Float, ?height:Float, ?center:Bool):Body;
	/**
		Sizes and positions this Body, as a circle.
	**/
	function setCircle(radius:Float, ?offsetX:Float, ?offsetY:Float):Body;
	/**
		Resets this Body to the given coordinates. Also positions its parent Game Object to the same coordinates.
		If the Body had any velocity or acceleration it is lost as a result of calling this.
	**/
	function reset(x:Float, y:Float):Void;
	/**
		Sets acceleration, velocity, and speed to zero.
	**/
	function stop():Body;
	/**
		Copies the coordinates of this Body's edges into an object.
	**/
	function getBounds(obj:global.phaser.types.physics.arcade.ArcadeBodyBounds):global.phaser.types.physics.arcade.ArcadeBodyBounds;
	/**
		Tests if the coordinates are within this Body.
	**/
	function hitTest(x:Float, y:Float):Bool;
	/**
		Whether this Body is touching a tile or the world boundary while moving down.
	**/
	function onFloor():Bool;
	/**
		Whether this Body is touching a tile or the world boundary while moving up.
	**/
	function onCeiling():Bool;
	/**
		Whether this Body is touching a tile or the world boundary while moving left or right.
	**/
	function onWall():Bool;
	/**
		The absolute (non-negative) change in this Body's horizontal position from the previous step.
	**/
	function deltaAbsX():Float;
	/**
		The absolute (non-negative) change in this Body's vertical position from the previous step.
	**/
	function deltaAbsY():Float;
	/**
		The change in this Body's horizontal position from the previous step.
		This value is set during the Body's update phase.
		
		As a Body can update multiple times per step this may not hold the final
		delta value for the Body. In this case, please see the `deltaXFinal` method.
	**/
	function deltaX():Float;
	/**
		The change in this Body's vertical position from the previous step.
		This value is set during the Body's update phase.
		
		As a Body can update multiple times per step this may not hold the final
		delta value for the Body. In this case, please see the `deltaYFinal` method.
	**/
	function deltaY():Float;
	/**
		The change in this Body's horizontal position from the previous game update.
		
		This value is set during the `postUpdate` phase and takes into account the
		`deltaMax` and final position of the Body.
		
		Because this value is not calculated until `postUpdate`, you must listen for it
		during a Scene `POST_UPDATE` or `RENDER` event, and not in `update`, as it will
		not be calculated by that point. If you _do_ use these values in `update` they
		will represent the delta from the _previous_ game frame.
	**/
	function deltaXFinal():Float;
	/**
		The change in this Body's vertical position from the previous game update.
		
		This value is set during the `postUpdate` phase and takes into account the
		`deltaMax` and final position of the Body.
		
		Because this value is not calculated until `postUpdate`, you must listen for it
		during a Scene `POST_UPDATE` or `RENDER` event, and not in `update`, as it will
		not be calculated by that point. If you _do_ use these values in `update` they
		will represent the delta from the _previous_ game frame.
	**/
	function deltaYFinal():Float;
	/**
		The change in this Body's rotation from the previous step, in degrees.
	**/
	function deltaZ():Float;
	/**
		Disables this Body and marks it for deletion by the simulation.
	**/
	function destroy():Void;
	/**
		Draws this Body and its velocity, if enabled.
	**/
	function drawDebug(graphic:global.phaser.gameobjects.Graphics):Void;
	/**
		Whether this Body will be drawn to the debug display.
	**/
	function willDrawDebug():Bool;
	/**
		Sets whether this Body collides with the world boundary.
		
		Optionally also sets the World Bounce values. If the `Body.worldBounce` is null, it's set to a new Phaser.Math.Vector2 first.
	**/
	function setCollideWorldBounds(?value:Bool, ?bounceX:Float, ?bounceY:Float):Body;
	/**
		Sets the Body's velocity.
	**/
	function setVelocity(x:Float, ?y:Float):Body;
	/**
		Sets the Body's horizontal velocity.
	**/
	function setVelocityX(value:Float):Body;
	/**
		Sets the Body's vertical velocity.
	**/
	function setVelocityY(value:Float):Body;
	/**
		Sets the Body's maximum velocity.
	**/
	function setMaxVelocity(x:Float, ?y:Float):Body;
	/**
		Sets the maximum speed the Body can move.
	**/
	function setMaxSpeed(value:Float):Body;
	/**
		Sets the Body's bounce.
	**/
	function setBounce(x:Float, y:Float):Body;
	/**
		Sets the Body's horizontal bounce.
	**/
	function setBounceX(value:Float):Body;
	/**
		Sets the Body's vertical bounce.
	**/
	function setBounceY(value:Float):Body;
	/**
		Sets the Body's acceleration.
	**/
	function setAcceleration(x:Float, y:Float):Body;
	/**
		Sets the Body's horizontal acceleration.
	**/
	function setAccelerationX(value:Float):Body;
	/**
		Sets the Body's vertical acceleration.
	**/
	function setAccelerationY(value:Float):Body;
	/**
		Enables or disables drag.
	**/
	function setAllowDrag(?value:Bool):Body;
	/**
		Enables or disables gravity's effect on this Body.
	**/
	function setAllowGravity(?value:Bool):Body;
	/**
		Enables or disables rotation.
	**/
	function setAllowRotation(?value:Bool):Body;
	/**
		Sets the Body's drag.
	**/
	function setDrag(x:Float, y:Float):Body;
	/**
		Sets the Body's horizontal drag.
	**/
	function setDragX(value:Float):Body;
	/**
		Sets the Body's vertical drag.
	**/
	function setDragY(value:Float):Body;
	/**
		Sets the Body's gravity.
	**/
	function setGravity(x:Float, y:Float):Body;
	/**
		Sets the Body's horizontal gravity.
	**/
	function setGravityX(value:Float):Body;
	/**
		Sets the Body's vertical gravity.
	**/
	function setGravityY(value:Float):Body;
	/**
		Sets the Body's friction.
	**/
	function setFriction(x:Float, y:Float):Body;
	/**
		Sets the Body's horizontal friction.
	**/
	function setFrictionX(value:Float):Body;
	/**
		Sets the Body's vertical friction.
	**/
	function setFrictionY(value:Float):Body;
	/**
		Sets the Body's angular velocity.
	**/
	function setAngularVelocity(value:Float):Body;
	/**
		Sets the Body's angular acceleration.
	**/
	function setAngularAcceleration(value:Float):Body;
	/**
		Sets the Body's angular drag.
	**/
	function setAngularDrag(value:Float):Body;
	/**
		Sets the Body's mass.
	**/
	function setMass(value:Float):Body;
	/**
		Sets the Body's `immovable` property.
	**/
	function setImmovable(?value:Bool):Body;
	/**
		Sets the Body's `enable` property.
	**/
	function setEnable(?value:Bool):Body;
	/**
		The Body's horizontal position (left edge).
	**/
	var x : Float;
	/**
		The Body's vertical position (top edge).
	**/
	var y : Float;
	/**
		The left edge of the Body. Identical to x.
	**/
	final left : Float;
	/**
		The right edge of the Body.
	**/
	final right : Float;
	/**
		The top edge of the Body. Identical to y.
	**/
	final top : Float;
	/**
		The bottom edge of this Body.
	**/
	final bottom : Float;
	static var prototype : Body;
}