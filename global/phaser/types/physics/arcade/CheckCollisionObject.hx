package global.phaser.types.physics.arcade;

typedef CheckCollisionObject = {
	/**
		Will bodies collide with the top side of the world bounds?
	**/
	var up : Bool;
	/**
		Will bodies collide with the bottom side of the world bounds?
	**/
	var down : Bool;
	/**
		Will bodies collide with the left side of the world bounds?
	**/
	var left : Bool;
	/**
		Will bodies collide with the right side of the world bounds?
	**/
	var right : Bool;
};