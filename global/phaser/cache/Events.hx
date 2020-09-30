package global.phaser.cache;

@:native("Phaser.Cache.Events") @valueModuleOnly extern class Events {
	/**
		The Cache Add Event.
		
		This event is dispatched by any Cache that extends the BaseCache each time a new object is added to it.
	**/
	static final ADD : Dynamic;
	/**
		The Cache Remove Event.
		
		This event is dispatched by any Cache that extends the BaseCache each time an object is removed from it.
	**/
	static final REMOVE : Dynamic;
}