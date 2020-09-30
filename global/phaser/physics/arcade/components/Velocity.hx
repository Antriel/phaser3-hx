package global.phaser.physics.arcade.components;

/**
	Provides methods for modifying the velocity of an Arcade Physics body.
	
	Should be applied as a mixin and not used directly.
**/
typedef Velocity = {
	/**
		Sets the velocity of the Body.
	**/
	function setVelocity(x:Float, ?y:Float):Velocity;
	/**
		Sets the horizontal component of the body's velocity.
		
		Positive values move the body to the right, while negative values move it to the left.
	**/
	function setVelocityX(x:Float):Velocity;
	/**
		Sets the vertical component of the body's velocity.
		
		Positive values move the body down, while negative values move it up.
	**/
	function setVelocityY(y:Float):Velocity;
	/**
		Sets the maximum velocity of the body.
	**/
	function setMaxVelocity(x:Float, ?y:Float):Velocity;
};