package global.phaser.display;

/**
	The Color class holds a single color value and allows for easy modification and reading of it.
**/
@:native("Phaser.Display.Color") extern class Color {
	function new(?red:Float, ?green:Float, ?blue:Float, ?alpha:Float);
	/**
		An array containing the calculated color values for WebGL use.
	**/
	var gl : Array<Float>;
	/**
		Sets this color to be transparent. Sets all values to zero.
	**/
	function transparent():Color;
	/**
		Sets the color of this Color component.
	**/
	function setTo(red:Float, green:Float, blue:Float, ?alpha:Float, ?updateHSV:Bool):Color;
	/**
		Sets the red, green, blue and alpha GL values of this Color component.
	**/
	function setGLTo(red:Float, green:Float, blue:Float, ?alpha:Float):Color;
	/**
		Sets the color based on the color object given.
	**/
	function setFromRGB(color:global.phaser.types.display.InputColorObject):Color;
	/**
		Sets the color based on the hue, saturation and lightness values given.
	**/
	function setFromHSV(h:Float, s:Float, v:Float):Color;
	/**
		Returns a new Color component using the values from this one.
	**/
	function clone():Color;
	/**
		Sets this Color object to be grayscaled based on the shade value given.
	**/
	function gray(shade:Float):Color;
	/**
		Sets this Color object to be a random color between the `min` and `max` values given.
	**/
	function random(?min:Float, ?max:Float):Color;
	/**
		Sets this Color object to be a random grayscale color between the `min` and `max` values given.
	**/
	function randomGray(?min:Float, ?max:Float):Color;
	/**
		Increase the saturation of this Color by the percentage amount given.
		The saturation is the amount of the base color in the hue.
	**/
	function saturate(amount:Float):Color;
	/**
		Decrease the saturation of this Color by the percentage amount given.
		The saturation is the amount of the base color in the hue.
	**/
	function desaturate(amount:Float):Color;
	/**
		Increase the lightness of this Color by the percentage amount given.
	**/
	function lighten(amount:Float):Color;
	/**
		Decrease the lightness of this Color by the percentage amount given.
	**/
	function darken(amount:Float):Color;
	/**
		Brighten this Color by the percentage amount given.
	**/
	function brighten(amount:Float):Color;
	/**
		The color of this Color component, not including the alpha channel.
	**/
	final color : Float;
	/**
		The color of this Color component, including the alpha channel.
	**/
	final color32 : Float;
	/**
		The color of this Color component as a string which can be used in CSS color values.
	**/
	final rgba : String;
	/**
		The red color value, normalized to the range 0 to 1.
	**/
	var redGL : Float;
	/**
		The green color value, normalized to the range 0 to 1.
	**/
	var greenGL : Float;
	/**
		The blue color value, normalized to the range 0 to 1.
	**/
	var blueGL : Float;
	/**
		The alpha color value, normalized to the range 0 to 1.
	**/
	var alphaGL : Float;
	/**
		The red color value, normalized to the range 0 to 255.
	**/
	var red : Float;
	/**
		The green color value, normalized to the range 0 to 255.
	**/
	var green : Float;
	/**
		The blue color value, normalized to the range 0 to 255.
	**/
	var blue : Float;
	/**
		The alpha color value, normalized to the range 0 to 255.
	**/
	var alpha : Float;
	/**
		The hue color value. A number between 0 and 1.
		This is the base color.
	**/
	var h : Float;
	/**
		The saturation color value. A number between 0 and 1.
		This controls how much of the hue will be in the final color, where 1 is fully saturated and 0 will give you white.
	**/
	var s : Float;
	/**
		The lightness color value. A number between 0 and 1.
		This controls how dark the color is. Where 1 is as bright as possible and 0 is black.
	**/
	var v : Float;
	static var prototype : Color;
	/**
		Return an array of Colors in a Color Spectrum.
		
		The spectrum colors flow in the order: red, yellow, green, blue.
		
		By default this function will return an array with 1024 elements in.
		
		However, you can reduce this to a smaller quantity if needed, by specitying the `limit` parameter.
	**/
	static function ColorSpectrum(?limit:Float):Array<global.phaser.types.display.ColorObject>;
	/**
		Converts the given color value into an Object containing r,g,b and a properties.
	**/
	static function ColorToRGBA(color:Float):global.phaser.types.display.ColorObject;
	/**
		Returns a string containing a hex representation of the given color component.
	**/
	static function ComponentToHex(color:Float):String;
	/**
		Given 3 separate color values this will return an integer representation of it.
	**/
	static function GetColor(red:Float, green:Float, blue:Float):Float;
	/**
		Given an alpha and 3 color values this will return an integer representation of it.
	**/
	static function GetColor32(red:Float, green:Float, blue:Float, alpha:Float):Float;
	/**
		Converts HSL (hue, saturation and lightness) values to a Phaser Color object.
	**/
	static function HSLToColor(h:Float, s:Float, l:Float):Color;
	/**
		Get HSV color wheel values in an array which will be 360 elements in size.
	**/
	static function HSVColorWheel(?s:Float, ?v:Float):Array<global.phaser.types.display.ColorObject>;
	/**
		Converts a HSV (hue, saturation and value) color set to RGB.
		
		Conversion formula from https://en.wikipedia.org/wiki/HSL_and_HSV
		
		Assumes HSV values are contained in the set [0, 1].
	**/
	static function HSVToRGB(h:Float, s:Float, v:Float, ?out:ts.AnyOf2<Color, global.phaser.types.display.ColorObject>):ts.AnyOf2<Color, global.phaser.types.display.ColorObject>;
	/**
		Converts a hex string into a Phaser Color object.
		
		The hex string can supplied as `'#0033ff'` or the short-hand format of `'#03f'`; it can begin with an optional "#" or "0x", or be unprefixed.
		
		An alpha channel is _not_ supported.
	**/
	static function HexStringToColor(hex:String):Color;
	/**
		Converts a hue to an RGB color.
		Based on code by Michael Jackson (https://github.com/mjijackson)
	**/
	static function HueToComponent(p:Float, q:Float, t:Float):Float;
	/**
		Converts the given color value into an instance of a Color object.
	**/
	static function IntegerToColor(input:Float):Color;
	/**
		Return the component parts of a color as an Object with the properties alpha, red, green, blue.
		
		Alpha will only be set if it exists in the given color (0xAARRGGBB)
	**/
	static function IntegerToRGB(input:Float):global.phaser.types.display.ColorObject;
	/**
		Converts an object containing `r`, `g`, `b` and `a` properties into a Color class instance.
	**/
	static function ObjectToColor(input:global.phaser.types.display.InputColorObject):Color;
	/**
		Converts a CSS 'web' string into a Phaser Color object.
		
		The web string can be in the format `'rgb(r,g,b)'` or `'rgba(r,g,b,a)'` where r/g/b are in the range [0..255] and a is in the range [0..1].
	**/
	static function RGBStringToColor(rgb:String):Color;
	/**
		Converts an RGB color value to HSV (hue, saturation and value).
		Conversion formula from http://en.wikipedia.org/wiki/HSL_color_space.
		Assumes RGB values are contained in the set [0, 255] and returns h, s and v in the set [0, 1].
		Based on code by Michael Jackson (https://github.com/mjijackson)
	**/
	static function RGBToHSV(r:Float, g:Float, b:Float, ?out:ts.AnyOf2<Color, global.phaser.types.display.HSVColorObject>):ts.AnyOf2<Color, global.phaser.types.display.HSVColorObject>;
	/**
		Converts the color values into an HTML compatible color string, prefixed with either `#` or `0x`.
	**/
	static function RGBToString(r:Float, g:Float, b:Float, ?a:Float, ?prefix:String):String;
	/**
		Creates a new Color object where the r, g, and b values have been set to random values
		based on the given min max values.
	**/
	static function RandomRGB(?min:Float, ?max:Float):Color;
	/**
		Converts the given source color value into an instance of a Color class.
		The value can be either a string, prefixed with `rgb` or a hex string, a number or an Object.
	**/
	static function ValueToColor(input:ts.AnyOf3<String, Float, global.phaser.types.display.InputColorObject>):Color;
}