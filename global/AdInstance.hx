package global;

typedef AdInstance = {
	/**
		Represents an instance of an ad.
	**/
	var instance : Dynamic;
	/**
		The Audience Network placement ID of this ad instance.
	**/
	var placementID : String;
	/**
		Has this ad already been shown in-game?
	**/
	var shown : Bool;
	/**
		Is this a video ad?
	**/
	var video : Bool;
};