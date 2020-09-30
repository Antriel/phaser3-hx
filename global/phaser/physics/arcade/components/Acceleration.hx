package global.phaser.physics.arcade.components;

/**
	Provides methods used for setting the acceleration properties of an Arcade Physics Body.
**/
typedef Acceleration = {
	/**
		Sets the body's horizontal and vertical acceleration. If the vertical acceleration value is not provided, the vertical acceleration is set to the same value as the horizontal acceleration.
	**/
	function setAcceleration(x:Float, ?y:Float):Acceleration;
	/**
		Sets the body's horizontal acceleration.
	**/
	function setAccelerationX(value:Float):Acceleration;
	/**
		Sets the body's vertical acceleration.
	**/
	function setAccelerationY(value:Float):Acceleration;
};