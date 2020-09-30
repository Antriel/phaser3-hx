package global.phaser.math.easing;

@:native("Phaser.Math.Easing.Back") @valueModuleOnly extern class Back {
	/**
		Back ease-in.
	**/
	static function In(v:Float, ?overshoot:Float):Float;
	/**
		Back ease-in/out.
	**/
	static function InOut(v:Float, ?overshoot:Float):Float;
	/**
		Back ease-out.
	**/
	static function Out(v:Float, ?overshoot:Float):Float;
}