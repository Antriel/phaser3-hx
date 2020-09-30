package global.phaser.types.gameobjects.particles;

typedef GravityWellConfig = {
	/**
		The x coordinate of the Gravity Well, in world space.
	**/
	@:optional
	var x : Float;
	/**
		The y coordinate of the Gravity Well, in world space.
	**/
	@:optional
	var y : Float;
	/**
		The strength of the gravity force - larger numbers produce a stronger force.
	**/
	@:optional
	var power : Float;
	/**
		The minimum distance for which the gravity force is calculated.
	**/
	@:optional
	var epsilon : Float;
	/**
		The gravitational force of this Gravity Well.
	**/
	@:optional
	var gravity : Float;
};