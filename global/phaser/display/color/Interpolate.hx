package global.phaser.display.color;

@:native("Phaser.Display.Color.Interpolate") @valueModuleOnly extern class Interpolate {
	/**
		Interpolates between the two given color ranges over the length supplied.
	**/
	static function RGBWithRGB(r1:Float, g1:Float, b1:Float, r2:Float, g2:Float, b2:Float, ?length:Float, ?index:Float):global.phaser.types.display.ColorObject;
	/**
		Interpolates between the two given color objects over the length supplied.
	**/
	static function ColorWithColor(color1:global.phaser.display.Color, color2:global.phaser.display.Color, ?length:Float, ?index:Float):global.phaser.types.display.ColorObject;
	/**
		Interpolates between the Color object and color values over the length supplied.
	**/
	static function ColorWithRGB(color1:global.phaser.display.Color, r:Float, g:Float, b:Float, ?length:Float, ?index:Float):global.phaser.types.display.ColorObject;
}