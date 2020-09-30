package global.phaser.math.easing;

@:native("Phaser.Math.Easing.Circular") @valueModuleOnly extern class Circular {
	/**
		Circular ease-in.
	**/
	static function In(v:Float):Float;
	/**
		Circular ease-in/out.
	**/
	static function InOut(v:Float):Float;
	/**
		Circular ease-out.
	**/
	static function Out(v:Float):Float;
}