package global.phaser.physics.matter.components;

/**
	Provides methods used for getting and setting the static state of a physics body.
**/
typedef Static = {
	/**
		Changes the physics body to be either static `true` or dynamic `false`.
	**/
	function setStatic(value:Bool):global.phaser.gameobjects.GameObject;
	/**
		Returns `true` if the body is static, otherwise `false` for a dynamic body.
	**/
	function isStatic():Bool;
};