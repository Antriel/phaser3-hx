package global.phaser.physics.matter.events;

typedef BeforeRemoveEvent = {
	/**
		An array of the object(s) to be removed. May be a single body, constraint, composite or a mixture of these.
	**/
	var object : Array<Dynamic>;
	/**
		The source object of the event.
	**/
	var source : Dynamic;
	/**
		The name of the event.
	**/
	var name : String;
};