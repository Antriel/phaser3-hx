package global.phaser.physics.matter.components;

/**
	A component to manipulate world gravity for Matter.js bodies.
**/
typedef Gravity = {
	/**
		A togglable function for ignoring world gravity in real-time on the current body.
	**/
	function setIgnoreGravity(value:Bool):global.phaser.gameobjects.GameObject;
};