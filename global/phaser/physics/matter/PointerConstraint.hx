package global.phaser.physics.matter;

/**
	A Pointer Constraint is a special type of constraint that allows you to click
	and drag bodies in a Matter World. It monitors the active Pointers in a Scene,
	and when one is pressed down it checks to see if that hit any part of any active
	body in the world. If it did, and the body has input enabled, it will begin to
	drag it until either released, or you stop it via the `stopDrag` method.
	
	You can adjust the stiffness, length and other properties of the constraint via
	the `options` object on creation.
**/
@:native("Phaser.Physics.Matter.PointerConstraint") extern class PointerConstraint {
	function new(scene:global.phaser.Scene, world:World, ?options:Dynamic);
	/**
		A reference to the Scene to which this Pointer Constraint belongs.
		This is the same Scene as the Matter World instance.
	**/
	var scene : global.phaser.Scene;
	/**
		A reference to the Matter World instance to which this Constraint belongs.
	**/
	var world : World;
	/**
		The Camera the Pointer was interacting with when the input
		down event was processed.
	**/
	var camera : global.phaser.cameras.scene2d.Camera;
	/**
		A reference to the Input Pointer that activated this Constraint.
		This is set in the `onDown` handler.
	**/
	var pointer : global.phaser.input.Pointer;
	/**
		Is this Constraint active or not?
		
		An active constraint will be processed each update. An inactive one will be skipped.
		Use this to toggle a Pointer Constraint on and off.
	**/
	var active : Bool;
	/**
		The internal transformed position.
	**/
	var position : global.phaser.math.Vector2;
	/**
		The body that is currently being dragged, if any.
	**/
	var body : global.matterjs.BodyType;
	/**
		The part of the body that was clicked on to start the drag.
	**/
	var part : global.matterjs.BodyType;
	/**
		The native Matter Constraint that is used to attach to bodies.
	**/
	var constraint : global.matterjs.ConstraintType;
	/**
		A Pointer has been pressed down onto the Scene.
		
		If this Constraint doesn't have an active Pointer then a hit test is set to
		run against all active bodies in the world during the _next_ call to `update`.
		If a body is found, it is bound to this constraint and the drag begins.
	**/
	function onDown(pointer:global.phaser.input.Pointer):Void;
	/**
		A Pointer has been released from the Scene. If it was the one this constraint was using, it's cleared.
	**/
	function onUp(pointer:global.phaser.input.Pointer):Void;
	/**
		Scans all active bodies in the current Matter World to see if any of them
		are hit by the Pointer. The _first one_ found to hit is set as the active contraint
		body.
	**/
	function getBody():Bool;
	/**
		Scans the current body to determine if a part of it was clicked on.
		If a part is found the body is set as the `constraint.bodyB` property,
		as well as the `body` property of this class. The part is also set.
	**/
	function hitTestBody(body:global.matterjs.BodyType, position:global.phaser.math.Vector2):Bool;
	/**
		Internal update handler. Called in the Matter BEFORE_UPDATE step.
	**/
	function update():Void;
	/**
		Stops the Pointer Constraint from dragging the body any further.
		
		This is called automatically if the Pointer is released while actively
		dragging a body. Or, you can call it manually to release a body from a
		constraint without having to first release the pointer.
	**/
	function stopDrag():Void;
	/**
		Destroys this Pointer Constraint instance and all of its references.
	**/
	function destroy():Void;
	static var prototype : PointerConstraint;
}