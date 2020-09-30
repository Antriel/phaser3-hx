package global.phaser.math.easing;

@:native("Phaser.Math.Easing.Sine") @valueModuleOnly extern class Sine {
	/**
		Sinusoidal ease-in.
	**/
	static function In(v:Float):Float;
	/**
		Sinusoidal ease-in/out.
	**/
	static function InOut(v:Float):Float;
	/**
		Sinusoidal ease-out.
	**/
	static function Out(v:Float):Float;
}