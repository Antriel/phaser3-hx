package global.phaser.physics.arcade.components;

/**
	Provides methods used for setting the enable properties of an Arcade Physics Body.
**/
typedef Enable = {
	/**
		Enables this Game Object's Body.
	**/
	function enableBody(reset:Bool, x:Float, y:Float, enableGameObject:Bool, showGameObject:Bool):Enable;
	/**
		Stops and disables this Game Object's Body.
	**/
	function disableBody(?disableGameObject:Bool, ?hideGameObject:Bool):Enable;
	/**
		Syncs the Body's position and size with its parent Game Object.
		You don't need to call this for Dynamic Bodies, as it happens automatically.
		But for Static bodies it's a useful way of modifying the position of a Static Body
		in the Physics World, based on its Game Object.
	**/
	function refreshBody():Enable;
};