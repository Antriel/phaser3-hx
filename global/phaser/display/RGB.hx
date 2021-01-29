package global.phaser.display;

/**
	The RGB class holds a single color value and allows for easy modification and reading of it,
	with optional on-change callback notification and a dirty flag.
**/
@:native("Phaser.Display.RGB") extern class RGB {
	function new(?red:Float, ?green:Float, ?blue:Float);
	/**
		This callback will be invoked each time one of the RGB color values change.
		
		The callback is sent the new color values as the parameters.
	**/
	var onChangeCallback : haxe.Constraints.Function;
	/**
		Is this color dirty?
	**/
	var dirty : Bool;
	/**
		Sets the red, green and blue values of this RGB object, flags it as being
		dirty and then invokes the `onChangeCallback`, if set.
	**/
	function set(?red:Float, ?green:Float, ?blue:Float):RGB;
	/**
		Compares the given rgb parameters with those in this object and returns
		a boolean `true` value if they are equal, otherwise it returns `false`.
	**/
	function equals(red:Float, green:Float, blue:Float):Bool;
	/**
		Internal on change handler. Sets this object as being dirty and
		then invokes the `onChangeCallback`, if set, passing in the
		new RGB values.
	**/
	function onChange():Void;
	/**
		The red color value. Between 0 and 1.
		
		Changing this property will flag this RGB object as being dirty
		and invoke the `onChangeCallback` , if set.
	**/
	var r : Float;
	/**
		The green color value. Between 0 and 1.
		
		Changing this property will flag this RGB object as being dirty
		and invoke the `onChangeCallback` , if set.
	**/
	var g : Float;
	/**
		The blue color value. Between 0 and 1.
		
		Changing this property will flag this RGB object as being dirty
		and invoke the `onChangeCallback` , if set.
	**/
	var b : Float;
	/**
		Nulls any external references this object contains.
	**/
	function destroy():Void;
	static var prototype : RGB;
}