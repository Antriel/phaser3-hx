package global.phaser.physics.matter.components;

/**
	Allows accessing the mass, density, and center of mass of a Matter-enabled Game Object. Should be used as a mixin and not directly.
**/
typedef Mass = {
	/**
		Sets the mass of the Game Object's Matter Body.
	**/
	function setMass(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets density of the body.
	**/
	function setDensity(value:Float):global.phaser.gameobjects.GameObject;
	/**
		The body's center of mass.
		
		Calling this creates a new `Vector2 each time to avoid mutation.
		
		If you only need to read the value and won't change it, you can get it from `GameObject.body.centerOfMass`.
	**/
	final centerOfMass : global.phaser.math.Vector2;
};