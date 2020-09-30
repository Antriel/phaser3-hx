package global.phaser.dom;

/**
	Abstracts away the use of RAF or setTimeOut for the core game update loop.
	This is invoked automatically by the Phaser.Game instance.
**/
@:native("Phaser.DOM.RequestAnimationFrame") extern class RequestAnimationFrame {
	function new();
	/**
		True if RequestAnimationFrame is running, otherwise false.
	**/
	var isRunning : Bool;
	/**
		The callback to be invoked each step.
	**/
	dynamic function callback(time:Float):Void;
	/**
		The most recent timestamp. Either a DOMHighResTimeStamp under RAF or `Date.now` under SetTimeout.
	**/
	var tick : Float;
	/**
		True if the step is using setTimeout instead of RAF.
	**/
	var isSetTimeOut : Bool;
	/**
		The setTimeout or RAF callback ID used when canceling them.
	**/
	var timeOutID : Float;
	/**
		The previous time the step was called.
	**/
	var lastTime : Float;
	/**
		The target FPS rate in ms.
		Only used when setTimeout is used instead of RAF.
	**/
	var target : Float;
	/**
		The RAF step function.
		Updates the local tick value, invokes the callback and schedules another call to requestAnimationFrame.
	**/
	dynamic function step(time:Float):Void;
	/**
		The SetTimeout step function.
		Updates the local tick value, invokes the callback and schedules another call to setTimeout.
	**/
	var stepTimeout : haxe.Constraints.Function;
	/**
		Starts the requestAnimationFrame or setTimeout process running.
	**/
	function start(callback:js.html.FrameRequestCallback, forceSetTimeOut:Bool, targetFPS:Float):Void;
	/**
		Stops the requestAnimationFrame or setTimeout from running.
	**/
	function stop():Void;
	/**
		Stops the step from running and clears the callback reference.
	**/
	function destroy():Void;
	static var prototype : RequestAnimationFrame;
}