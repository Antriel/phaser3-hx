package global.phaser.structs;

@:native("Phaser.Structs.Events") @valueModuleOnly extern class Events {
	/**
		The Process Queue Add Event.
		
		This event is dispatched by a Process Queue when a new item is successfully moved to its active list.
		
		You will most commonly see this used by a Scene's Update List when a new Game Object has been added.
		
		In that instance, listen to this event from within a Scene using: `this.sys.updateList.on('add', listener)`.
	**/
	static final PROCESS_QUEUE_ADD : Dynamic;
	/**
		The Process Queue Remove Event.
		
		This event is dispatched by a Process Queue when a new item is successfully removed from its active list.
		
		You will most commonly see this used by a Scene's Update List when a Game Object has been removed.
		
		In that instance, listen to this event from within a Scene using: `this.sys.updateList.on('remove', listener)`.
	**/
	static final PROCESS_QUEUE_REMOVE : Dynamic;
}