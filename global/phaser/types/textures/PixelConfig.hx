package global.phaser.types.textures;

/**
	An object containing the position and color data for a single pixel in a CanvasTexture.
**/
typedef PixelConfig = {
	/**
		The x-coordinate of the pixel.
	**/
	var x : Float;
	/**
		The y-coordinate of the pixel.
	**/
	var y : Float;
	/**
		The color of the pixel, not including the alpha channel.
	**/
	var color : Float;
	/**
		The alpha of the pixel, between 0 and 1.
	**/
	var alpha : Float;
};