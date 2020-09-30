package global.phaser.math;

@:native("Phaser.Math.Easing") @valueModuleOnly extern class Easing {
	/**
		Linear easing (no variation).
	**/
	static function Linear(v:Float):Float;
	/**
		Stepped easing.
	**/
	static function Stepped(v:Float, ?steps:Float):Float;
}