package global.phaser.gameobjects.components;

/**
	Provides methods used for setting the visibility of a Game Object.
	Should be applied as a mixin and not used directly.
**/
typedef Visible = {
	/**
		The visible state of the Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	var visible : Bool;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):Visible;
};