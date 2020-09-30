package global.phaser.types.physics.matter;

typedef MatterBodyTileOptions = {
	/**
		Whether or not the newly created body should be made static. This defaults to true since typically tiles should not be moved.
	**/
	@:optional
	var isStatic : Bool;
	/**
		Whether or not to add the newly created body (or existing body if options.body is used) to the Matter world.
	**/
	@:optional
	var addToWorld : Bool;
};