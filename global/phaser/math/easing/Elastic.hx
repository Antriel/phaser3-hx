package global.phaser.math.easing;

@:native("Phaser.Math.Easing.Elastic") @valueModuleOnly extern class Elastic {
	/**
		Elastic ease-in.
	**/
	static function In(v:Float, ?amplitude:Float, ?period:Float):Float;
	/**
		Elastic ease-in/out.
	**/
	static function InOut(v:Float, ?amplitude:Float, ?period:Float):Float;
	/**
		Elastic ease-out.
	**/
	static function Out(v:Float, ?amplitude:Float, ?period:Float):Float;
}