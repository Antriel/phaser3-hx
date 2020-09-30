package global.phaser.physics.matter.components;

/**
	Enables a Matter-enabled Game Object to be able to go to sleep. Should be used as a mixin and not directly.
**/
typedef Sleep = {
	/**
		Sets this Body to sleep.
	**/
	function setToSleep():Sleep;
	/**
		Wakes this Body if asleep.
	**/
	function setAwake():Sleep;
	/**
		Sets the number of updates in which this body must have near-zero velocity before it is set as sleeping (if sleeping is enabled by the engine).
	**/
	function setSleepThreshold(?value:Float):Sleep;
	/**
		Enable sleep and wake events for this body.
		
		By default when a body goes to sleep, or wakes up, it will not emit any events.
		
		The events are emitted by the Matter World instance and can be listened to via
		the `SLEEP_START` and `SLEEP_END` events.
	**/
	function setSleepEvents(start:Bool, end:Bool):Sleep;
	/**
		Enables or disables the Sleep Start event for this body.
	**/
	function setSleepStartEvent(value:Bool):Sleep;
	/**
		Enables or disables the Sleep End event for this body.
	**/
	function setSleepEndEvent(value:Bool):Sleep;
};