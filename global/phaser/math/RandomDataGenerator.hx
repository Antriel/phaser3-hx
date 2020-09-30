package global.phaser.math;

/**
	A seeded Random Data Generator.
	
	Access via `Phaser.Math.RND` which is an instance of this class pre-defined
	by Phaser. Or, create your own instance to use as you require.
	
	The `Math.RND` generator is seeded by the Game Config property value `seed`.
	If no such config property exists, a random number is used.
	
	If you create your own instance of this class you should provide a seed for it.
	If no seed is given it will use a 'random' one based on Date.now.
**/
@:native("Phaser.Math.RandomDataGenerator") extern class RandomDataGenerator {
	function new(?seeds:ts.AnyOf2<String, Array<String>>);
	/**
		Signs to choose from.
	**/
	var signs : Array<Float>;
	/**
		Initialize the state of the random data generator.
	**/
	function init(seeds:ts.AnyOf2<String, Array<String>>):Void;
	/**
		Reset the seed of the random data generator.
		
		_Note_: the seed array is only processed up to the first `undefined` (or `null`) value, should such be present.
	**/
	function sow(seeds:Array<String>):Void;
	/**
		Returns a random integer between 0 and 2^32.
	**/
	function integer():Float;
	/**
		Returns a random real number between 0 and 1.
	**/
	function frac():Float;
	/**
		Returns a random real number between 0 and 2^32.
	**/
	function real():Float;
	/**
		Returns a random integer between and including min and max.
	**/
	function integerInRange(min:Float, max:Float):Float;
	/**
		Returns a random integer between and including min and max.
		This method is an alias for RandomDataGenerator.integerInRange.
	**/
	function between(min:Float, max:Float):Float;
	/**
		Returns a random real number between min and max.
	**/
	function realInRange(min:Float, max:Float):Float;
	/**
		Returns a random real number between -1 and 1.
	**/
	function normal():Float;
	/**
		Returns a valid RFC4122 version4 ID hex string from https://gist.github.com/1308368
	**/
	function uuid():String;
	/**
		Returns a random element from within the given array.
	**/
	function pick<T>(array:Array<T>):T;
	/**
		Returns a sign to be used with multiplication operator.
	**/
	function sign():Float;
	/**
		Returns a random element from within the given array, favoring the earlier entries.
	**/
	function weightedPick<T>(array:Array<T>):T;
	/**
		Returns a random timestamp between min and max, or between the beginning of 2000 and the end of 2020 if min and max aren't specified.
	**/
	function timestamp(min:Float, max:Float):Float;
	/**
		Returns a random angle between -180 and 180.
	**/
	function angle():Float;
	/**
		Returns a random rotation in radians, between -3.141 and 3.141
	**/
	function rotation():Float;
	/**
		Gets or Sets the state of the generator. This allows you to retain the values
		that the generator is using between games, i.e. in a game save file.
		
		To seed this generator with a previously saved state you can pass it as the
		`seed` value in your game config, or call this method directly after Phaser has booted.
		
		Call this method with no parameters to return the current state.
		
		If providing a state it should match the same format that this method
		returns, which is a string with a header `!rnd` followed by the `c`,
		`s0`, `s1` and `s2` values respectively, each comma-delimited.
	**/
	function state(?state:String):String;
	/**
		Shuffles the given array, using the current seed.
	**/
	function shuffle<T>(?array:Array<T>):Array<T>;
	static var prototype : RandomDataGenerator;
}