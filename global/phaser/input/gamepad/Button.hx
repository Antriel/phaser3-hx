package global.phaser.input.gamepad;

/**
	Contains information about a specific button on a Gamepad.
	Button objects are created automatically by the Gamepad as they are needed.
**/
@:native("Phaser.Input.Gamepad.Button") extern class Button {
	function new(pad:Gamepad, index:Float);
	/**
		A reference to the Gamepad that this Button belongs to.
	**/
	var pad : Gamepad;
	/**
		An event emitter to use to emit the button events.
	**/
	var events : global.phaser.events.EventEmitter;
	/**
		The index of this Button.
	**/
	var index : Float;
	/**
		Between 0 and 1.
	**/
	var value : Float;
	/**
		Can be set for analogue buttons to enable a 'pressure' threshold,
		before a button is considered as being 'pressed'.
	**/
	var threshold : Float;
	/**
		Is the Button being pressed down or not?
	**/
	var pressed : Bool;
	/**
		Destroys this Button instance and releases external references it holds.
	**/
	function destroy():Void;
	static var prototype : Button;
}