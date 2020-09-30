package global.phaser.types.renderer.snapshot;

typedef SnapshotState = {
	/**
		The function to call after the snapshot is taken.
	**/
	dynamic function callback(snapshot:ts.AnyOf2<global.phaser.display.Color, js.html.ImageElement>):Void;
	/**
		The format of the image to create, usually `image/png` or `image/jpeg`.
	**/
	@:optional
	var type : String;
	/**
		The image quality, between 0 and 1. Used for image formats with lossy compression, such as `image/jpeg`.
	**/
	@:optional
	var encoderOptions : Float;
	/**
		The x coordinate to start the snapshot from.
	**/
	@:optional
	var x : Float;
	/**
		The y coordinate to start the snapshot from.
	**/
	@:optional
	var y : Float;
	/**
		The width of the snapshot.
	**/
	@:optional
	var width : Float;
	/**
		The height of the snapshot.
	**/
	@:optional
	var height : Float;
	/**
		Is this a snapshot to get a single pixel, or an area?
	**/
	@:optional
	var getPixel : Bool;
	/**
		Is this snapshot grabbing from a frame buffer or a canvas?
	**/
	@:optional
	var isFramebuffer : Bool;
	/**
		The width of the frame buffer, if a frame buffer grab.
	**/
	@:optional
	var bufferWidth : Float;
	/**
		The height of the frame buffer, if a frame buffer grab.
	**/
	@:optional
	var bufferHeight : Float;
};