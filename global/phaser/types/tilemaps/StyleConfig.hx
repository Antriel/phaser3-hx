package global.phaser.types.tilemaps;

typedef StyleConfig = {
	/**
		Color to use for drawing a filled rectangle at non-colliding tile locations. If set to null, non-colliding tiles will not be drawn.
	**/
	@:optional
	var tileColor : ts.AnyOf2<Float, global.phaser.display.Color>;
	/**
		Color to use for drawing a filled rectangle at colliding tile locations. If set to null, colliding tiles will not be drawn.
	**/
	@:optional
	var collidingTileColor : ts.AnyOf2<Float, global.phaser.display.Color>;
	/**
		Color to use for drawing a line at interesting tile faces. If set to null, interesting tile faces will not be drawn.
	**/
	@:optional
	var faceColor : ts.AnyOf2<Float, global.phaser.display.Color>;
};