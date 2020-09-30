package global.phaser.physics.matter;

@:native("Phaser.Physics.Matter.Events") @valueModuleOnly extern class Events {
	/**
		The Matter Physics After Add Event.
		
		This event is dispatched by a Matter Physics World instance at the end of the process when a new Body
		or Constraint has just been added to the world.
		
		Listen to it from a Scene using: `this.matter.world.on('afteradd', listener)`.
	**/
	static final AFTER_ADD : Dynamic;
	/**
		The Matter Physics After Remove Event.
		
		This event is dispatched by a Matter Physics World instance at the end of the process when a 
		Body or Constraint was removed from the world.
		
		Listen to it from a Scene using: `this.matter.world.on('afterremove', listener)`.
	**/
	static final AFTER_REMOVE : Dynamic;
	/**
		The Matter Physics After Update Event.
		
		This event is dispatched by a Matter Physics World instance after the engine has updated and all collision events have resolved.
		
		Listen to it from a Scene using: `this.matter.world.on('afterupdate', listener)`.
	**/
	static final AFTER_UPDATE : Dynamic;
	/**
		The Matter Physics Before Add Event.
		
		This event is dispatched by a Matter Physics World instance at the start of the process when a new Body
		or Constraint is being added to the world.
		
		Listen to it from a Scene using: `this.matter.world.on('beforeadd', listener)`.
	**/
	static final BEFORE_ADD : Dynamic;
	/**
		The Matter Physics Before Remove Event.
		
		This event is dispatched by a Matter Physics World instance at the start of the process when a 
		Body or Constraint is being removed from the world.
		
		Listen to it from a Scene using: `this.matter.world.on('beforeremove', listener)`.
	**/
	static final BEFORE_REMOVE : Dynamic;
	/**
		The Matter Physics Before Update Event.
		
		This event is dispatched by a Matter Physics World instance right before all the collision processing takes place.
		
		Listen to it from a Scene using: `this.matter.world.on('beforeupdate', listener)`.
	**/
	static final BEFORE_UPDATE : Dynamic;
	/**
		The Matter Physics Collision Active Event.
		
		This event is dispatched by a Matter Physics World instance after the engine has updated.
		It provides a list of all pairs that are colliding in the current tick (if any).
		
		Listen to it from a Scene using: `this.matter.world.on('collisionactive', listener)`.
	**/
	static final COLLISION_ACTIVE : Dynamic;
	/**
		The Matter Physics Collision End Event.
		
		This event is dispatched by a Matter Physics World instance after the engine has updated.
		It provides a list of all pairs that have finished colliding in the current tick (if any).
		
		Listen to it from a Scene using: `this.matter.world.on('collisionend', listener)`.
	**/
	static final COLLISION_END : Dynamic;
	/**
		The Matter Physics Collision Start Event.
		
		This event is dispatched by a Matter Physics World instance after the engine has updated.
		It provides a list of all pairs that have started to collide in the current tick (if any).
		
		Listen to it from a Scene using: `this.matter.world.on('collisionstart', listener)`.
	**/
	static final COLLISION_START : Dynamic;
	/**
		The Matter Physics Drag End Event.
		
		This event is dispatched by a Matter Physics World instance when a Pointer Constraint
		stops dragging a body.
		
		Listen to it from a Scene using: `this.matter.world.on('dragend', listener)`.
	**/
	static final DRAG_END : Dynamic;
	/**
		The Matter Physics Drag Event.
		
		This event is dispatched by a Matter Physics World instance when a Pointer Constraint
		is actively dragging a body. It is emitted each time the pointer moves.
		
		Listen to it from a Scene using: `this.matter.world.on('drag', listener)`.
	**/
	static final DRAG : Dynamic;
	/**
		The Matter Physics Drag Start Event.
		
		This event is dispatched by a Matter Physics World instance when a Pointer Constraint
		starts dragging a body.
		
		Listen to it from a Scene using: `this.matter.world.on('dragstart', listener)`.
	**/
	static final DRAG_START : Dynamic;
	/**
		The Matter Physics World Pause Event.
		
		This event is dispatched by an Matter Physics World instance when it is paused.
		
		Listen to it from a Scene using: `this.matter.world.on('pause', listener)`.
	**/
	static final PAUSE : Dynamic;
	/**
		The Matter Physics World Resume Event.
		
		This event is dispatched by an Matter Physics World instance when it resumes from a paused state.
		
		Listen to it from a Scene using: `this.matter.world.on('resume', listener)`.
	**/
	static final RESUME : Dynamic;
	/**
		The Matter Physics Sleep End Event.
		
		This event is dispatched by a Matter Physics World instance when a Body stop sleeping.
		
		Listen to it from a Scene using: `this.matter.world.on('sleepend', listener)`.
	**/
	static final SLEEP_END : Dynamic;
	/**
		The Matter Physics Sleep Start Event.
		
		This event is dispatched by a Matter Physics World instance when a Body goes to sleep.
		
		Listen to it from a Scene using: `this.matter.world.on('sleepstart', listener)`.
	**/
	static final SLEEP_START : Dynamic;
}