package global.phaser.types.gameobjects.pathfollower;

/**
	Settings for a PathFollower.
**/
typedef PathConfig = {
	/**
		The duration of the path follow in ms. Must be `> 0`.
	**/
	@:optional
	var duration : Float;
	/**
		The start position of the path follow, between 0 and 1. Must be less than `to`.
	**/
	@:optional
	var from : Float;
	/**
		The end position of the path follow, between 0 and 1. Must be more than `from`.
	**/
	@:optional
	var to : Float;
	/**
		Whether to position the PathFollower on the Path using its path offset.
	**/
	@:optional
	var positionOnPath : Bool;
	/**
		Should the PathFollower automatically rotate to point in the direction of the Path?
	**/
	@:optional
	var rotateToPath : Bool;
	/**
		If the PathFollower is rotating to match the Path, this value is added to the rotation value. This allows you to rotate objects to a path but control the angle of the rotation as well.
	**/
	@:optional
	var rotationOffset : Float;
	/**
		Current start position of the path follow, must be between `from` and `to`.
	**/
	@:optional
	var startAt : Float;
};