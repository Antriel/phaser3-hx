package global.phaser.utils;

@:native("Phaser.Utils.Objects") @valueModuleOnly extern class Objects {
	/**
		Shallow Object Clone. Will not clone nested objects.
	**/
	static function Clone(obj:Dynamic):Dynamic;
	/**
		This is a slightly modified version of http://api.jquery.com/jQuery.extend/
	**/
	static function Extend(args:haxe.extern.Rest<Dynamic>):Dynamic;
	/**
		Retrieves a value from an object. Allows for more advanced selection options, including:
		
		Allowed types:
		
		Implicit
		{
		     x: 4
		}
		
		From function
		{
		     x: function ()
		}
		
		Randomly pick one element from the array
		{
		     x: [a, b, c, d, e, f]
		}
		
		Random integer between min and max:
		{
		     x: { randInt: [min, max] }
		}
		
		Random float between min and max:
		{
		     x: { randFloat: [min, max] }
		}
	**/
	static function GetAdvancedValue(source:Dynamic, key:String, defaultValue:Dynamic):Dynamic;
	/**
		Finds the key within the top level of the {@link source} object, or returns {@link defaultValue}
	**/
	static function GetFastValue(source:Dynamic, key:String, ?defaultValue:Dynamic):Dynamic;
	/**
		Retrieves and clamps a numerical value from an object.
	**/
	static function GetMinMaxValue(source:Dynamic, key:String, min:Float, max:Float, defaultValue:Float):Float;
	/**
		Retrieves a value from an object.
	**/
	static function GetValue(source:Dynamic, key:String, defaultValue:Dynamic):Dynamic;
	/**
		Verifies that an object contains all requested keys
	**/
	static function HasAll(source:Dynamic, keys:Array<String>):Bool;
	/**
		Verifies that an object contains at least one of the requested keys
	**/
	static function HasAny(source:Dynamic, keys:Array<String>):Bool;
	/**
		Determine whether the source object has a property with the specified key.
	**/
	static function HasValue(source:Dynamic, key:String):Bool;
	/**
		This is a slightly modified version of jQuery.isPlainObject.
		A plain object is an object whose internal class property is [object Object].
	**/
	static function IsPlainObject(obj:Dynamic):Bool;
	/**
		Creates a new Object using all values from obj1 and obj2.
		If a value exists in both obj1 and obj2, the value in obj1 is used.
		
		This is only a shallow copy. Deeply nested objects are not cloned, so be sure to only use this
		function on shallow objects.
	**/
	static function Merge(obj1:Dynamic, obj2:Dynamic):Dynamic;
	/**
		Creates a new Object using all values from obj1.
		
		Then scans obj2. If a property is found in obj2 that *also* exists in obj1, the value from obj2 is used, otherwise the property is skipped.
	**/
	static function MergeRight(obj1:Dynamic, obj2:Dynamic):Dynamic;
	/**
		Returns a new object that only contains the `keys` that were found on the object provided.
		If no `keys` are found, an empty object is returned.
	**/
	static function Pick(object:Dynamic, keys:Array<Dynamic>):Dynamic;
	/**
		Sets a value in an object, allowing for dot notation to control the depth of the property.
		
		For example:
		
		```javascript
		var data = {
		   world: {
		     position: {
		       x: 200,
		       y: 100
		     }
		   }
		};
		
		SetValue(data, 'world.position.y', 300);
		
		console.log(data.world.position.y); // 300
		```
	**/
	static function SetValue(source:Dynamic, key:String, value:Dynamic):Bool;
}