package global.phaser.scale;

/**
	Phaser Scale Manager constants for centering the game canvas.
**/
@:native("Phaser.Scale.Center") @:enum extern abstract Center(Int) from Int to Int {
	/**
		The game canvas is not centered within the parent by Phaser.
		You can still center it yourself via CSS.
	**/
	var NO_CENTER;
	/**
		The game canvas is centered both horizontally and vertically within the parent.
		To do this, the parent has to have a bounds that can be calculated and not be empty.
		
		Centering is achieved by setting the margin left and top properties of the
		game canvas, and does not factor in any other CSS styles you may have applied.
	**/
	var CENTER_BOTH;
	/**
		The game canvas is centered horizontally within the parent.
		To do this, the parent has to have a bounds that can be calculated and not be empty.
		
		Centering is achieved by setting the margin left and top properties of the
		game canvas, and does not factor in any other CSS styles you may have applied.
	**/
	var CENTER_HORIZONTALLY;
	/**
		The game canvas is centered both vertically within the parent.
		To do this, the parent has to have a bounds that can be calculated and not be empty.
		
		Centering is achieved by setting the margin left and top properties of the
		game canvas, and does not factor in any other CSS styles you may have applied.
	**/
	var CENTER_VERTICALLY;
}