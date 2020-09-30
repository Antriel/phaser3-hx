package global.phaser.physics.arcade.components;

/**
	Provides methods used for setting the angular acceleration properties of an Arcade Physics Body.
**/
typedef Angular = {
	/**
		Sets the angular velocity of the body.
		
		In Arcade Physics, bodies cannot rotate. They are always axis-aligned.
		However, they can have angular motion, which is passed on to the Game Object bound to the body,
		causing them to visually rotate, even though the body remains axis-aligned.
	**/
	function setAngularVelocity(value:Float):Angular;
	/**
		Sets the angular acceleration of the body.
		
		In Arcade Physics, bodies cannot rotate. They are always axis-aligned.
		However, they can have angular motion, which is passed on to the Game Object bound to the body,
		causing them to visually rotate, even though the body remains axis-aligned.
	**/
	function setAngularAcceleration(value:Float):Angular;
	/**
		Sets the angular drag of the body. Drag is applied to the current velocity, providing a form of deceleration.
	**/
	function setAngularDrag(value:Float):Angular;
};