package global.phaser.physics.matter.components;

/**
	Contains methods for changing the friction of a Game Object's Matter Body. Should be used a mixin, not called directly.
**/
typedef Friction = {
	/**
		Sets new friction values for this Game Object's Matter Body.
	**/
	function setFriction(value:Float, ?air:Float, ?fstatic:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets a new air resistance for this Game Object's Matter Body.
		A value of 0 means the Body will never slow as it moves through space.
		The higher the value, the faster a Body slows when moving through space.
	**/
	function setFrictionAir(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets a new static friction for this Game Object's Matter Body.
		A value of 0 means the Body will never "stick" when it is nearly stationary.
		The higher the value (e.g. 10), the more force it will take to initially get the Body moving when it is nearly stationary.
	**/
	function setFrictionStatic(value:Float):global.phaser.gameobjects.GameObject;
};