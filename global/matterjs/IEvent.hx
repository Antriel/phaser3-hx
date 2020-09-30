package global.matterjs;

typedef IEvent<T> = {
	/**
		The name of the event
	**/
	var name : String;
	/**
		The source object of the event
	**/
	var source : T;
};