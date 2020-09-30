package global.phaser.scale;

/**
	Phaser Scale Manager constants for zoom modes.
**/
@:native("Phaser.Scale.Zoom") @:enum extern abstract Zoom(Int) from Int to Int {
	/**
		The game canvas will not be zoomed by Phaser.
	**/
	var NO_ZOOM;
	/**
		The game canvas will be 2x zoomed by Phaser.
	**/
	var ZOOM_2X;
	/**
		The game canvas will be 4x zoomed by Phaser.
	**/
	var ZOOM_4X;
	/**
		Calculate the zoom value based on the maximum multiplied game size that will
		fit into the parent, or browser window if no parent is set.
	**/
	var MAX_ZOOM;
}