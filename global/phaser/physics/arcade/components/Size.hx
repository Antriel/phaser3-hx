package global.phaser.physics.arcade.components;

/**
	Provides methods for setting the size of an Arcade Physics Game Object.
	Should be applied as a mixin and not used directly.
**/
typedef Size = {
	/**
		Sets the body offset. This allows you to adjust the difference between the center of the body
		and the x and y coordinates of the parent Game Object.
	**/
	function setOffset(x:Float, ?y:Float):Size;
	/**
		**DEPRECATED**: Please use `setBodySize` instead.
		
		Sets the size of this physics body. Setting the size does not adjust the dimensions of the parent Game Object.
	**/
	function setSize(width:Float, height:Float, ?center:Bool):Size;
	/**
		Sets the size of this physics body. Setting the size does not adjust the dimensions of the parent Game Object.
	**/
	function setBodySize(width:Float, height:Float, ?center:Bool):Size;
	/**
		Sets this physics body to use a circle for collision instead of a rectangle.
	**/
	function setCircle(radius:Float, ?offsetX:Float, ?offsetY:Float):Size;
};