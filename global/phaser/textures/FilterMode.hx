package global.phaser.textures;

/**
	Filter Types.
**/
@:native("Phaser.Textures.FilterMode") @:enum extern abstract FilterMode(Int) from Int to Int {
	/**
		Linear filter type.
	**/
	var LINEAR;
	/**
		Nearest neighbor filter type.
	**/
	var NEAREST;
}