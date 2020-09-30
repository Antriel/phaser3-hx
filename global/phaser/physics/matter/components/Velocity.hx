package global.phaser.physics.matter.components;

/**
	Contains methods for changing the velocity of a Matter Body. Should be used as a mixin and not called directly.
**/
typedef Velocity = {
	/**
		Sets the angular velocity of the body instantly.
		Position, angle, force etc. are unchanged.
	**/
	function setAngularVelocity(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets the horizontal velocity of the physics body.
	**/
	function setVelocityX(x:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets vertical velocity of the physics body.
	**/
	function setVelocityY(y:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets both the horizontal and vertical velocity of the physics body.
	**/
	function setVelocity(x:Float, ?y:Float):global.phaser.gameobjects.GameObject;
};