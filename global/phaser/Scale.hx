package global.phaser;

@:native("Phaser.Scale") @valueModuleOnly extern class Scale {
	/**
		The game canvas is not centered within the parent by Phaser.
		You can still center it yourself via CSS.
	**/
	static final NO_CENTER : Float;
	/**
		The game canvas is centered both horizontally and vertically within the parent.
		To do this, the parent has to have a bounds that can be calculated and not be empty.
		
		Centering is achieved by setting the margin left and top properties of the
		game canvas, and does not factor in any other CSS styles you may have applied.
	**/
	static final CENTER_BOTH : Float;
	/**
		The game canvas is centered horizontally within the parent.
		To do this, the parent has to have a bounds that can be calculated and not be empty.
		
		Centering is achieved by setting the margin left and top properties of the
		game canvas, and does not factor in any other CSS styles you may have applied.
	**/
	static final CENTER_HORIZONTALLY : Float;
	/**
		The game canvas is centered both vertically within the parent.
		To do this, the parent has to have a bounds that can be calculated and not be empty.
		
		Centering is achieved by setting the margin left and top properties of the
		game canvas, and does not factor in any other CSS styles you may have applied.
	**/
	static final CENTER_VERTICALLY : Float;
	/**
		A landscape orientation.
	**/
	static final LANDSCAPE : String;
	/**
		A portrait orientation.
	**/
	static final PORTRAIT : String;
	/**
		No scaling happens at all. The canvas is set to the size given in the game config and Phaser doesn't change it
		again from that point on. If you change the canvas size, either via CSS, or directly via code, then you need
		to call the Scale Managers `resize` method to give the new dimensions, or input events will stop working.
	**/
	static final NONE : Float;
	/**
		The height is automatically adjusted based on the width.
	**/
	static final WIDTH_CONTROLS_HEIGHT : Float;
	/**
		The width is automatically adjusted based on the height.
	**/
	static final HEIGHT_CONTROLS_WIDTH : Float;
	/**
		The width and height are automatically adjusted to fit inside the given target area,
		while keeping the aspect ratio. Depending on the aspect ratio there may be some space
		inside the area which is not covered.
	**/
	static final FIT : Float;
	/**
		The width and height are automatically adjusted to make the size cover the entire target
		area while keeping the aspect ratio. This may extend further out than the target size.
	**/
	static final ENVELOP : Float;
	/**
		The Canvas is resized to fit all available _parent_ space, regardless of aspect ratio.
	**/
	static final RESIZE : Float;
	/**
		The game canvas will not be zoomed by Phaser.
	**/
	static final NO_ZOOM : Float;
	/**
		The game canvas will be 2x zoomed by Phaser.
	**/
	static final ZOOM_2X : Float;
	/**
		The game canvas will be 4x zoomed by Phaser.
	**/
	static final ZOOM_4X : Float;
	/**
		Calculate the zoom value based on the maximum multiplied game size that will
		fit into the parent, or browser window if no parent is set.
	**/
	static final MAX_ZOOM : Float;
}