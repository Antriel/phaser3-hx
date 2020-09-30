package global.phaser.physics.matter.events;

typedef BeforeUpdateEvent = {
	/**
		The Matter Engine `timing.timestamp` value for the event.
	**/
	var timestamp : Float;
	/**
		The source object of the event.
	**/
	var source : Dynamic;
	/**
		The name of the event.
	**/
	var name : String;
};