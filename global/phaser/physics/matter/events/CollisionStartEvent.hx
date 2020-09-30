package global.phaser.physics.matter.events;

typedef CollisionStartEvent = {
	/**
		A list of all affected pairs in the collision.
	**/
	var pairs : Array<global.phaser.types.physics.matter.MatterCollisionData>;
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