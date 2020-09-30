package global.phaser.types.input;

/**
	A Phaser Input Event Data object.
	
	This object is passed to the registered event listeners and allows you to stop any further propagation.
**/
typedef EventData = {
	/**
		The cancelled state of this Event.
	**/
	@:optional
	var cancelled : Bool;
	/**
		Call this method to stop this event from passing any further down the event chain.
	**/
	var stopPropagation : haxe.Constraints.Function;
};