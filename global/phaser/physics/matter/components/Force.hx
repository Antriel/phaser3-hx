package global.phaser.physics.matter.components;

/**
	A component to apply force to Matter.js bodies.
**/
typedef Force = {
	/**
		Applies a force to a body.
	**/
	function applyForce(force:global.phaser.math.Vector2):global.phaser.gameobjects.GameObject;
	/**
		Applies a force to a body from a given position.
	**/
	function applyForceFrom(position:global.phaser.math.Vector2, force:global.phaser.math.Vector2):global.phaser.gameobjects.GameObject;
	/**
		Apply thrust to the forward position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrust(speed:Float):global.phaser.gameobjects.GameObject;
	/**
		Apply thrust to the left position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrustLeft(speed:Float):global.phaser.gameobjects.GameObject;
	/**
		Apply thrust to the right position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrustRight(speed:Float):global.phaser.gameobjects.GameObject;
	/**
		Apply thrust to the back position of the body.
		
		Use very small values, such as 0.1, depending on the mass and required speed.
	**/
	function thrustBack(speed:Float):global.phaser.gameobjects.GameObject;
};