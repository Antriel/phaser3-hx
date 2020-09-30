package global.phaser.types.tilemaps;

typedef GIDData = {
	/**
		The Tiled GID.
	**/
	var gid : Float;
	/**
		Horizontal flip flag.
	**/
	var flippedHorizontal : Bool;
	/**
		Vertical flip flag.
	**/
	var flippedVertical : Bool;
	/**
		Diagonal flip flag.
	**/
	var flippedAntiDiagonal : Bool;
	/**
		Amount of rotation.
	**/
	var rotation : Float;
	/**
		Is flipped?
	**/
	var flipped : Bool;
};