package global.phaser.physics.arcade.components;

/**
	Provides methods used for setting the immovable properties of an Arcade Physics Body.
**/
typedef Immovable = {
	/**
		Sets if this Body can be separated during collisions with other bodies.
		
		When a body is immovable it means it won't move at all, not even to separate it from collision
		overlap. If you just wish to prevent a body from being knocked around by other bodies, see
		the `setPushable` method instead.
	**/
	function setImmovable(?value:Bool):Immovable;
};