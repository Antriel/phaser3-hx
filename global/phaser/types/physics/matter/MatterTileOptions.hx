package global.phaser.types.physics.matter;

typedef MatterTileOptions = {
	/**
		An existing Matter body to be used instead of creating a new one.
	**/
	@:optional
	var body : global.matterjs.BodyType;
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