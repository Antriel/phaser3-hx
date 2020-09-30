package global.phaser.scale;

/**
	Phaser Scale Manager constants for the different scale modes available.
**/
@:native("Phaser.Scale.ScaleModes") @:enum extern abstract ScaleModes(Int) from Int to Int {
	/**
		No scaling happens at all. The canvas is set to the size given in the game config and Phaser doesn't change it
		again from that point on. If you change the canvas size, either via CSS, or directly via code, then you need
		to call the Scale Managers `resize` method to give the new dimensions, or input events will stop working.
	**/
	var NONE;
	/**
		The height is automatically adjusted based on the width.
	**/
	var WIDTH_CONTROLS_HEIGHT;
	/**
		The width is automatically adjusted based on the height.
	**/
	var HEIGHT_CONTROLS_WIDTH;
	/**
		The width and height are automatically adjusted to fit inside the given target area,
		while keeping the aspect ratio. Depending on the aspect ratio there may be some space
		inside the area which is not covered.
	**/
	var FIT;
	/**
		The width and height are automatically adjusted to make the size cover the entire target
		area while keeping the aspect ratio. This may extend further out than the target size.
	**/
	var ENVELOP;
	/**
		The Canvas is resized to fit all available _parent_ space, regardless of aspect ratio.
	**/
	var RESIZE;
}