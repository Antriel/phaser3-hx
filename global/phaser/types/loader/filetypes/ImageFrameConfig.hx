package global.phaser.types.loader.filetypes;

typedef ImageFrameConfig = {
	/**
		The width of the frame in pixels.
	**/
	var frameWidth : Float;
	/**
		The height of the frame in pixels. Uses the `frameWidth` value if not provided.
	**/
	@:optional
	var frameHeight : Float;
	/**
		The first frame to start parsing from.
	**/
	@:optional
	var startFrame : Float;
	/**
		The frame to stop parsing at. If not provided it will calculate the value based on the image and frame dimensions.
	**/
	@:optional
	var endFrame : Float;
	/**
		The margin in the image. This is the space around the edge of the frames.
	**/
	@:optional
	var margin : Float;
	/**
		The spacing between each frame in the image.
	**/
	@:optional
	var spacing : Float;
};