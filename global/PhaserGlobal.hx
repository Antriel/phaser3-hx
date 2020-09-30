package global;

@:native("") extern class PhaserGlobal {
	/**
		Extends the given `myClass` object's prototype with the properties of `definition`.
	**/
	static function extend(ctor:Dynamic, definition:Dynamic, isClassDescriptor:Bool, ?extend:Dynamic):Void;
	/**
		Applies the given `mixins` to the prototype of `myClass`.
	**/
	static function mixin(myClass:Dynamic, mixins:ts.AnyOf2<Dynamic, Array<Dynamic>>):Void;
}