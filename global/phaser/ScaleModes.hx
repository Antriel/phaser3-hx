package global.phaser;

/**
	Phaser Scale Modes.
**/
@:native("Phaser.ScaleModes") @:enum extern abstract ScaleModes(Int) from Int to Int {
	/**
		Default Scale Mode (Linear).
	**/
	var DEFAULT;
	/**
		Linear Scale Mode.
	**/
	var LINEAR;
	/**
		Nearest Scale Mode.
	**/
	var NEAREST;
}