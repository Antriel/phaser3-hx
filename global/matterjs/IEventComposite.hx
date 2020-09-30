package global.matterjs;

typedef IEventComposite<T> = {
	/**
		EventObjects (may be a single body, constraint, composite or a mixed array of these)
	**/
	var object : Dynamic;
	/**
		The name of the event
	**/
	var name : String;
	/**
		The source object of the event
	**/
	var source : T;
};