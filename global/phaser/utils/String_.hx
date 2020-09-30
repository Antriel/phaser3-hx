package global.phaser.utils;

@:native("Phaser.Utils.String") @valueModuleOnly extern class String_ {
	/**
		Takes a string and replaces instances of markers with values in the given array.
		The markers take the form of `%1`, `%2`, etc. I.e.:
		
		`Format("The %1 is worth %2 gold", [ 'Sword', 500 ])`
	**/
	static function Format(string:String, values:Array<Dynamic>):String;
	/**
		Takes the given string and pads it out, to the length required, using the character
		specified. For example if you need a string to be 6 characters long, you can call:
		
		`pad('bob', 6, '-', 2)`
		
		This would return: `bob---` as it has padded it out to 6 characters, using the `-` on the right.
		
		You can also use it to pad numbers (they are always returned as strings):
		
		`pad(512, 6, '0', 1)`
		
		Would return: `000512` with the string padded to the left.
		
		If you don't specify a direction it'll pad to both sides:
		
		`pad('c64', 7, '*')`
		
		Would return: `**c64**`
	**/
	static function Pad(str:ts.AnyOf3<String, Float, Dynamic>, ?len:Float, ?pad:String, ?dir:Float):String;
	/**
		Takes the given string and reverses it, returning the reversed string.
		For example if given the string `Atari 520ST` it would return `TS025 iratA`.
	**/
	static function Reverse(string:String):String;
	/**
		Capitalizes the first letter of a string if there is one.
	**/
	static function UppercaseFirst(str:String):String;
	/**
		Creates and returns an RFC4122 version 4 compliant UUID.
		
		The string is in the form: `xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx` where each `x` is replaced with a random
		hexadecimal digit from 0 to f, and `y` is replaced with a random hexadecimal digit from 8 to b.
	**/
	static function UUID():String;
}