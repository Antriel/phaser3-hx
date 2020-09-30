package global.phaser.types.create;

typedef GenerateTextureConfig = {
	/**
		An array of data, where each row is a string of single values 0-9A-F, or the period character.
	**/
	@:optional
	var data : Array<Dynamic>;
	/**
		The HTML Canvas to draw the texture to.
	**/
	@:optional
	var canvas : js.html.CanvasElement;
	/**
		The indexed palette that the data cell values map to.
	**/
	@:optional
	var palette : Palette;
	/**
		The width of each 'pixel' in the generated texture.
	**/
	@:optional
	var pixelWidth : Float;
	/**
		The height of each 'pixel' in the generated texture.
	**/
	@:optional
	var pixelHeight : Float;
	/**
		Should the canvas be resized before the texture is drawn?
	**/
	@:optional
	var resizeCanvas : Bool;
	/**
		Should the canvas be cleared before the texture is drawn?
	**/
	@:optional
	var clearCanvas : Bool;
	/**
		A callback to send the canvas to prior to the texture being drawn.
	**/
	@:optional
	dynamic function preRender(canvas:js.html.CanvasElement, context:js.html.CanvasRenderingContext2D):Void;
	/**
		A callback to send the canvas to after the texture has been drawn.
	**/
	@:optional
	dynamic function postRender(canvas:js.html.CanvasElement, context:js.html.CanvasRenderingContext2D):Void;
};