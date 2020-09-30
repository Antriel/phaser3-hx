package global.phaser.math.easing;

@:native("Phaser.Math.Easing.Quadratic") @valueModuleOnly extern class Quadratic {
	/**
		Quadratic ease-in.
	**/
	static function In(v:Float):Float;
	/**
		Quadratic ease-in/out.
	**/
	static function InOut(v:Float):Float;
	/**
		Quadratic ease-out.
	**/
	static function Out(v:Float):Float;
}