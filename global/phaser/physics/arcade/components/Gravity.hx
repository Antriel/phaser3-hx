package global.phaser.physics.arcade.components;

/**
	Provides methods for setting the gravity properties of an Arcade Physics Game Object.
	Should be applied as a mixin and not used directly.
**/
typedef Gravity = {
	/**
		Set the X and Y values of the gravitational pull to act upon this Arcade Physics Game Object. Values can be positive or negative. Larger values result in a stronger effect.
		
		If only one value is provided, this value will be used for both the X and Y axis.
	**/
	function setGravity(x:Float, ?y:Float):Gravity;
	/**
		Set the gravitational force to be applied to the X axis. Value can be positive or negative. Larger values result in a stronger effect.
	**/
	function setGravityX(x:Float):Gravity;
	/**
		Set the gravitational force to be applied to the Y axis. Value can be positive or negative. Larger values result in a stronger effect.
	**/
	function setGravityY(y:Float):Gravity;
};