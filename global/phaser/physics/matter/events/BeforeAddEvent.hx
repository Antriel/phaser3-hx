package global.phaser.physics.matter.events;

typedef BeforeAddEvent = {
	/**
		An array of the object(s) to be added. May be a single body, constraint, composite or a mixture of these.
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