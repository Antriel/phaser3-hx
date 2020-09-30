package global.phaser.math.easing;

@:native("Phaser.Math.Easing.Expo") @valueModuleOnly extern class Expo {
	/**
		Exponential ease-in.
	**/
	static function In(v:Float):Float;
	/**
		Exponential ease-in/out.
	**/
	static function InOut(v:Float):Float;
	/**
		Exponential ease-out.
	**/
	static function Out(v:Float):Float;
}