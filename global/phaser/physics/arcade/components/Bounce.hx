package global.phaser.physics.arcade.components;

/**
	Provides methods used for setting the bounce properties of an Arcade Physics Body.
**/
typedef Bounce = {
	/**
		Sets the bounce values of this body.
		
		Bounce is the amount of restitution, or elasticity, the body has when it collides with another object.
		A value of 1 means that it will retain its full velocity after the rebound. A value of 0 means it will not rebound at all.
	**/
	function setBounce(x:Float, ?y:Float):Bounce;
	/**
		Sets the horizontal bounce value for this body.
	**/
	function setBounceX(value:Float):Bounce;
	/**
		Sets the vertical bounce value for this body.
	**/
	function setBounceY(value:Float):Bounce;
	/**
		Sets whether this Body collides with the world boundary.
		
		Optionally also sets the World Bounce values. If the `Body.worldBounce` is null, it's set to a new Phaser.Math.Vector2 first.
	**/
	function setCollideWorldBounds(?value:Bool, ?bounceX:Float, ?bounceY:Float):Bounce;
};