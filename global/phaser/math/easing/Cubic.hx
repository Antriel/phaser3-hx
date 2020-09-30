package global.phaser.math.easing;

@:native("Phaser.Math.Easing.Cubic") @valueModuleOnly extern class Cubic {
	/**
		Cubic ease-in.
	**/
	static function In(v:Float):Float;
	/**
		Cubic ease-in/out.
	**/
	static function InOut(v:Float):Float;
	/**
		Cubic ease-out.
	**/
	static function Out(v:Float):Float;
}