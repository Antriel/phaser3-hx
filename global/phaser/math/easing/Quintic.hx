package global.phaser.math.easing;

@:native("Phaser.Math.Easing.Quintic") @valueModuleOnly extern class Quintic {
	/**
		Quintic ease-in.
	**/
	static function In(v:Float):Float;
	/**
		Quintic ease-in/out.
	**/
	static function InOut(v:Float):Float;
	/**
		Quintic ease-out.
	**/
	static function Out(v:Float):Float;
}