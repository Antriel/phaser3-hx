package global.phaser.math;

@:native("Phaser.Math.Fuzzy") @valueModuleOnly extern class Fuzzy {
	/**
		Calculate the fuzzy ceiling of the given value.
	**/
	static function Ceil(value:Float, ?epsilon:Float):Float;
	/**
		Check whether the given values are fuzzily equal.
		
		Two numbers are fuzzily equal if their difference is less than `epsilon`.
	**/
	static function Equal(a:Float, b:Float, ?epsilon:Float):Bool;
	/**
		Calculate the fuzzy floor of the given value.
	**/
	static function Floor(value:Float, ?epsilon:Float):Float;
	/**
		Check whether `a` is fuzzily greater than `b`.
		
		`a` is fuzzily greater than `b` if it is more than `b - epsilon`.
	**/
	static function GreaterThan(a:Float, b:Float, ?epsilon:Float):Bool;
	/**
		Check whether `a` is fuzzily less than `b`.
		
		`a` is fuzzily less than `b` if it is less than `b + epsilon`.
	**/
	static function LessThan(a:Float, b:Float, ?epsilon:Float):Bool;
}