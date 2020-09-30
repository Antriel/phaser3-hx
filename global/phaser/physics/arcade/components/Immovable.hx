package global.phaser.physics.arcade.components;

/**
	Provides methods used for setting the immovable properties of an Arcade Physics Body.
**/
typedef Immovable = {
	/**
		Sets Whether this Body can be moved by collisions with another Body.
	**/
	function setImmovable(?value:Bool):Immovable;
};