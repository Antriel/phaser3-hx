package global.phaser.math;

@:native("Phaser.Math.Interpolation") @valueModuleOnly extern class Interpolation {
	/**
		A bezier interpolation method.
	**/
	static function Bezier(v:Array<Float>, k:Float):Float;
	/**
		A Catmull-Rom interpolation method.
	**/
	static function CatmullRom(v:Array<Float>, k:Float):Float;
	/**
		A cubic bezier interpolation method.
		
		https://medium.com/@adrian_cooney/bezier-interpolation-13b68563313a
	**/
	static function CubicBezier(t:Float, p0:Float, p1:Float, p2:Float, p3:Float):Float;
	/**
		A linear interpolation method.
	**/
	static function Linear(v:Array<Float>, k:Float):Float;
	/**
		A quadratic bezier interpolation method.
	**/
	static function QuadraticBezier(t:Float, p0:Float, p1:Float, p2:Float):Float;
	/**
		A Smoother Step interpolation method.
	**/
	static function SmootherStep(t:Float, min:Float, max:Float):Float;
	/**
		A Smooth Step interpolation method.
	**/
	static function SmoothStep(t:Float, min:Float, max:Float):Float;
}