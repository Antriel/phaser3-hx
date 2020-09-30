package global.phaser.types.physics.arcade;

typedef ArcadeBodyCollision = {
	/**
		True if the Body is not colliding.
	**/
	var none : Bool;
	/**
		True if the Body is colliding on its upper edge.
	**/
	var up : Bool;
	/**
		True if the Body is colliding on its lower edge.
	**/
	var down : Bool;
	/**
		True if the Body is colliding on its left edge.
	**/
	var left : Bool;
	/**
		True if the Body is colliding on its right edge.
	**/
	var right : Bool;
};