package global.matterjs;

@:native("MatterJS.CompositesFactory") extern class CompositesFactory {
	function new();
	/**
		Creates a composite with simple car setup of bodies and constraints.
	**/
	function car(xx:Float, yy:Float, width:Float, height:Float, wheelSize:Float):CompositeType;
	/**
		Chains all bodies in the given composite together using constraints.
	**/
	function chain(composite:CompositeType, xOffsetA:Float, yOffsetA:Float, xOffsetB:Float, yOffsetB:Float, options:Dynamic):CompositeType;
	/**
		Connects bodies in the composite with constraints in a grid pattern, with optional cross braces.
	**/
	function mesh(composite:CompositeType, columns:Float, rows:Float, crossBrace:Bool, options:Dynamic):CompositeType;
	/**
		Creates a composite with a Newton's Cradle setup of bodies and constraints.
	**/
	function newtonsCradle(xx:Float, yy:Float, number:Float, size:Float, length:Float):CompositeType;
	/**
		Create a new composite containing bodies created in the callback in a pyramid arrangement.
		This function uses the body's bounds to prevent overlaps.
	**/
	function pyramid(xx:Float, yy:Float, columns:Float, rows:Float, columnGap:Float, rowGap:Float, callback:haxe.Constraints.Function):CompositeType;
	/**
		Creates a simple soft body like object.
	**/
	function softBody(xx:Float, yy:Float, columns:Float, rows:Float, columnGap:Float, rowGap:Float, crossBrace:Bool, particleRadius:Float, particleOptions:Dynamic, constraintOptions:Dynamic):CompositeType;
	/**
		Create a new composite containing bodies created in the callback in a grid arrangement.
		This function uses the body's bounds to prevent overlaps.
	**/
	function stack(xx:Float, yy:Float, columns:Float, rows:Float, columnGap:Float, rowGap:Float, callback:haxe.Constraints.Function):CompositeType;
	static var prototype : CompositesFactory;
}