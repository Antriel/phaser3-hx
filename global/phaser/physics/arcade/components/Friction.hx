package global.phaser.physics.arcade.components;

/**
	Methods for setting the friction of an Arcade Physics Body.
	
	In Arcade Physics, friction is a special case of motion transfer from an "immovable" body to a riding body.
**/
typedef Friction = {
	/**
		Sets the friction of this game object's physics body.
		In Arcade Physics, friction is a special case of motion transfer from an "immovable" body to a riding body.
	**/
	function setFriction(x:Float, ?y:Float):Friction;
	/**
		Sets the horizontal friction of this game object's physics body.
		This can move a riding body horizontally when it collides with this one on the vertical axis.
	**/
	function setFrictionX(x:Float):Friction;
	/**
		Sets the vertical friction of this game object's physics body.
		This can move a riding body vertically when it collides with this one on the horizontal axis.
	**/
	function setFrictionY(y:Float):Friction;
};