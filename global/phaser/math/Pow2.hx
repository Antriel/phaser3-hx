package global.phaser.math;

@:native("Phaser.Math.Pow2") @valueModuleOnly extern class Pow2 {
	/**
		Returns the nearest power of 2 to the given `value`.
	**/
	static function GetNext(value:Float):Float;
	/**
		Checks if the given `width` and `height` are a power of two.
		Useful for checking texture dimensions.
	**/
	static function IsSize(width:Float, height:Float):Bool;
	/**
		Tests the value and returns `true` if it is a power of two.
	**/
	static function IsValue(value:Float):Bool;
}