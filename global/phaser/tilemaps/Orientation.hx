package global.phaser.tilemaps;

/**
	Phaser Tilemap constants for orientation.
**/
@:native("Phaser.Tilemaps.Orientation") @:enum extern abstract Orientation(Int) from Int to Int {
	/**
		Orthogonal Tilemap orientation constant.
	**/
	var ORTHOGONAL;
	/**
		Isometric Tilemap orientation constant.
	**/
	var ISOMETRIC;
	/**
		Staggered Tilemap orientation constant.
	**/
	var STAGGERED;
	/**
		Hexagonal Tilemap orientation constant.
	**/
	var HEXAGONAL;
}