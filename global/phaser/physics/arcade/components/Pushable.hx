package global.phaser.physics.arcade.components;

/**
	Provides methods used for setting the pushable property of an Arcade Physics Body.
**/
typedef Pushable = {
	/**
		Sets if this Body can be pushed by another Body.
		
		A body that cannot be pushed will reflect back all of the velocity it is given to the
		colliding body. If that body is also not pushable, then the separation will be split
		between them evenly.
		
		If you want your body to never move or seperate at all, see the `setImmovable` method.
	**/
	function setPushable(?value:Bool):Pushable;
};