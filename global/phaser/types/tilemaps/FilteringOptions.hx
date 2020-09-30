package global.phaser.types.tilemaps;

typedef FilteringOptions = {
	/**
		If true, only return tiles that don't have -1 for an index.
	**/
	@:optional
	var isNotEmpty : Bool;
	/**
		If true, only return tiles that collide on at least one side.
	**/
	@:optional
	var isColliding : Bool;
	/**
		If true, only return tiles that have at least one interesting face.
	**/
	@:optional
	var hasInterestingFace : Bool;
};