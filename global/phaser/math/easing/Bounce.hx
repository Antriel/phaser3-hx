package global.phaser.math.easing;

@:native("Phaser.Math.Easing.Bounce") @valueModuleOnly extern class Bounce {
	/**
		Bounce ease-in.
	**/
	static function In(v:Float):Float;
	/**
		Bounce ease-in/out.
	**/
	static function InOut(v:Float):Float;
	/**
		Bounce ease-out.
	**/
	static function Out(v:Float):Float;
}