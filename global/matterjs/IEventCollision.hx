package global.matterjs;

typedef IEventCollision<T> = {
	/**
		The collision pair
	**/
	var pairs : Array<IPair>;
	/**
		The engine.timing.timestamp of the event
	**/
	var timestamp : Float;
	/**
		The name of the event
	**/
	var name : String;
	/**
		The source object of the event
	**/
	var source : T;
};