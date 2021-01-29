package global.phaser.types.tilemaps;

typedef DebugStyleOptions = {
	/**
		Color to use for drawing a filled rectangle at
		non-colliding tile locations. If set to null, non-colliding tiles will not be drawn.
	**/
	@:optional
	@:native("styleConfig.tileColor")
	var styleConfig_tileColor : global.phaser.display.Color;
	/**
		Color to use for drawing a filled
		rectangle at colliding tile locations. If set to null, colliding tiles will not be drawn.
	**/
	@:optional
	@:native("styleConfig.collidingTileColor")
	var styleConfig_collidingTileColor : global.phaser.display.Color;
	/**
		Color to use for drawing a line at interesting
		tile faces. If set to null, interesting tile faces will not be drawn.
	**/
	@:optional
	@:native("styleConfig.faceColor")
	var styleConfig_faceColor : global.phaser.display.Color;
};