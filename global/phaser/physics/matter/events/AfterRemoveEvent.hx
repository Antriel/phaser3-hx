package global.phaser.physics.matter.events;

typedef AfterRemoveEvent = {
	/**
		An array of the object(s) that were removed. May be a single body, constraint, composite or a mixture of these.
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