package global.phaser.scale;

/**
	Phaser Scale Manager constants for orientation.
**/
@:native("Phaser.Scale.Orientation") @:enum extern abstract Orientation(Int) from Int to Int {
	/**
		A landscape orientation.
	**/
	var LANDSCAPE;
	/**
		A portrait orientation.
	**/
	var PORTRAIT;
}