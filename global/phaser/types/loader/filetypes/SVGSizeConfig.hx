package global.phaser.types.loader.filetypes;

typedef SVGSizeConfig = {
	/**
		An optional width. The SVG will be resized to this size before being rendered to a texture.
	**/
	@:optional
	var width : Float;
	/**
		An optional height. The SVG will be resized to this size before being rendered to a texture.
	**/
	@:optional
	var height : Float;
	/**
		An optional scale. If given it overrides the width / height properties. The SVG is scaled by the scale factor before being rendered to a texture.
	**/
	@:optional
	var scale : Float;
};