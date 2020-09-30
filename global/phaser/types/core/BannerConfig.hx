package global.phaser.types.core;

typedef BannerConfig = {
	/**
		Omit Phaser's name and version from the banner.
	**/
	@:optional
	var hidePhaser : Bool;
	/**
		The color of the banner text.
	**/
	@:optional
	var text : String;
	/**
		The background colors of the banner.
	**/
	@:optional
	var background : Array<String>;
};