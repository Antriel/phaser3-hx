package global.phaser.display;

/**
	The ColorMatrix class creates a 5x4 matrix that can be used in shaders and graphics
	operations. It provides methods required to modify the color values, such as adjusting
	the brightness, setting a sepia tone, hue rotation and more.
	
	Use the method `getData` to return a Float32Array containing the current color values.
**/
@:native("Phaser.Display.ColorMatrix") extern class ColorMatrix {
	function new();
	/**
		The value that determines how much of the original color is used
		when mixing the colors. A value between 0 (all original) and 1 (all final)
	**/
	var alpha : Float;
	/**
		Sets this ColorMatrix from the given array of color values.
	**/
	function set(value:Array<Float>):ColorMatrix;
	/**
		Resets the ColorMatrix.
	**/
	function reset():ColorMatrix;
	/**
		Gets the ColorMatrix as a Float32Array.
		
		Can be used directly as a 1fv shader uniform value.
	**/
	function getData():js.lib.Float32Array;
	/**
		Changes the brightness of this ColorMatrix by the given amount.
	**/
	function brightness(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Changes the saturation of this ColorMatrix by the given amount.
	**/
	function saturate(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Desaturates this ColorMatrix (removes color from it).
	**/
	function saturation(?multiply:Bool):ColorMatrix;
	/**
		Rotates the hues of this ColorMatrix by the value given.
	**/
	function hue(?rotation:Float, ?multiply:Bool):ColorMatrix;
	/**
		Sets this ColorMatrix to be grayscale.
	**/
	function grayscale(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Sets this ColorMatrix to be black and white.
	**/
	function blackWhite(?multiply:Bool):ColorMatrix;
	/**
		Change the contrast of this ColorMatrix by the amount given.
	**/
	function contrast(?value:Float, ?multiply:Bool):ColorMatrix;
	/**
		Converts this ColorMatrix to have negative values.
	**/
	function negative(?multiply:Bool):ColorMatrix;
	/**
		Apply a desaturated luminance to this ColorMatrix.
	**/
	function desaturateLuminance(?multiply:Bool):ColorMatrix;
	/**
		Applies a sepia tone to this ColorMatrix.
	**/
	function sepia(?multiply:Bool):ColorMatrix;
	/**
		Applies a night vision tone to this ColorMatrix.
	**/
	function night(?intensity:Float, ?multiply:Bool):ColorMatrix;
	/**
		Applies a trippy color tone to this ColorMatrix.
	**/
	function lsd(?multiply:Bool):ColorMatrix;
	/**
		Applies a brown tone to this ColorMatrix.
	**/
	function brown(?multiply:Bool):ColorMatrix;
	/**
		Applies a vintage pinhole color effect to this ColorMatrix.
	**/
	function vintagePinhole(?multiply:Bool):ColorMatrix;
	/**
		Applies a kodachrome color effect to this ColorMatrix.
	**/
	function kodachrome(?multiply:Bool):ColorMatrix;
	/**
		Applies a technicolor color effect to this ColorMatrix.
	**/
	function technicolor(?multiply:Bool):ColorMatrix;
	/**
		Applies a polaroid color effect to this ColorMatrix.
	**/
	function polaroid(?multiply:Bool):ColorMatrix;
	/**
		Shifts the values of this ColorMatrix into BGR order.
	**/
	function shiftToBGR(?multiply:Bool):ColorMatrix;
	/**
		Multiplies the two given matrices.
	**/
	function multiply(a:Array<Float>):ColorMatrix;
	static var prototype : ColorMatrix;
}