package global.phaser.math;

@:native("Phaser.Math.Snap") @valueModuleOnly extern class Snap {
	/**
		Snap a value to nearest grid slice, using ceil.
		
		Example: if you have an interval gap of `5` and a position of `12`... you will snap to `15`.
		As will `14` snap to `15`... but `16` will snap to `20`.
	**/
	static function Ceil(value:Float, gap:Float, ?start:Float, ?divide:Bool):Float;
	/**
		Snap a value to nearest grid slice, using floor.
		
		Example: if you have an interval gap of `5` and a position of `12`... you will snap to `10`.
		As will `14` snap to `10`... but `16` will snap to `15`.
	**/
	static function Floor(value:Float, gap:Float, ?start:Float, ?divide:Bool):Float;
	/**
		Snap a value to nearest grid slice, using rounding.
		
		Example: if you have an interval gap of `5` and a position of `12`... you will snap to `10` whereas `14` will snap to `15`.
	**/
	static function To(value:Float, gap:Float, ?start:Float, ?divide:Bool):Float;
}