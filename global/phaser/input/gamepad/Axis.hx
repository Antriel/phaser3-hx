package global.phaser.input.gamepad;

/**
	Contains information about a specific Gamepad Axis.
	Axis objects are created automatically by the Gamepad as they are needed.
**/
@:native("Phaser.Input.Gamepad.Axis") extern class Axis {
	function new(pad:Gamepad, index:Float);
	/**
		A reference to the Gamepad that this Axis belongs to.
	**/
	var pad : Gamepad;
	/**
		An event emitter to use to emit the axis events.
	**/
	var events : global.phaser.events.EventEmitter;
	/**
		The index of this Axis.
	**/
	var index : Float;
	/**
		The raw axis value, between -1 and 1 with 0 being dead center.
		Use the method `getValue` to get a normalized value with the threshold applied.
	**/
	var value : Float;
	/**
		Movement tolerance threshold below which axis values are ignored in `getValue`.
	**/
	var threshold : Float;
	/**
		Applies the `threshold` value to the axis and returns it.
	**/
	function getValue():Float;
	/**
		Destroys this Axis instance and releases external references it holds.
	**/
	function destroy():Void;
	static var prototype : Axis;
}