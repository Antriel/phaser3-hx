package global.phaser.math.easing;

@:native("Phaser.Math.Easing.Quartic") @valueModuleOnly extern class Quartic {
	/**
		Quartic ease-in.
	**/
	static function In(v:Float):Float;
	/**
		Quartic ease-in/out.
	**/
	static function InOut(v:Float):Float;
	/**
		Quartic ease-out.
	**/
	static function Out(v:Float):Float;
}