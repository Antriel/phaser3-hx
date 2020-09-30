package global.matterjs;

/**
	The `Matter.Composites` module contains factory methods for creating composite bodies
	with commonly used configurations (such as stacks and chains).
	
	See the included usage [examples](https://github.com/liabru/matter-js/tree/master/examples).
**/
@:native("MatterJS.Composites") extern class Composites {
	function new();
	static var prototype : Composites;
	/**
		Creates a composite with simple car setup of bodies and constraints.
	**/
	static function car(xx:Float, yy:Float, width:Float, height:Float, wheelSize:Float):CompositeType;
	/**
		Chains all bodies in the given composite together using constraints.
	**/
	static function chain(composite:CompositeType, xOffsetA:Float, yOffsetA:Float, xOffsetB:Float, yOffsetB:Float, options:Dynamic):CompositeType;
	/**
		Connects bodies in the composite with constraints in a grid pattern, with optional cross braces.
	**/
	static function mesh(composite:CompositeType, columns:Float, rows:Float, crossBrace:Bool, options:Dynamic):CompositeType;
	/**
		Creates a composite with a Newton's Cradle setup of bodies and constraints.
	**/
	static function newtonsCradle(xx:Float, yy:Float, number:Float, size:Float, length:Float):CompositeType;
	/**
		Create a new composite containing bodies created in the callback in a pyramid arrangement.
		This function uses the body's bounds to prevent overlaps.
	**/
	static function pyramid(xx:Float, yy:Float, columns:Float, rows:Float, columnGap:Float, rowGap:Float, callback:haxe.Constraints.Function):CompositeType;
	/**
		Creates a simple soft body like object.
	**/
	static function softBody(xx:Float, yy:Float, columns:Float, rows:Float, columnGap:Float, rowGap:Float, crossBrace:Bool, particleRadius:Float, particleOptions:Dynamic, constraintOptions:Dynamic):CompositeType;
	/**
		Create a new composite containing bodies created in the callback in a grid arrangement.
		This function uses the body's bounds to prevent overlaps.
	**/
	static function stack(xx:Float, yy:Float, columns:Float, rows:Float, columnGap:Float, rowGap:Float, callback:haxe.Constraints.Function):CompositeType;
}