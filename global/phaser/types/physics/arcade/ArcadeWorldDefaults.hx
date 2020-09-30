package global.phaser.types.physics.arcade;

typedef ArcadeWorldDefaults = {
	/**
		Set to `true` to render dynamic body outlines to the debug display.
	**/
	var debugShowBody : Bool;
	/**
		Set to `true` to render static body outlines to the debug display.
	**/
	var debugShowStaticBody : Bool;
	/**
		Set to `true` to render body velocity markers to the debug display.
	**/
	var debugShowVelocity : Bool;
	/**
		The color of dynamic body outlines when rendered to the debug display.
	**/
	var bodyDebugColor : Float;
	/**
		The color of static body outlines when rendered to the debug display.
	**/
	var staticBodyDebugColor : Float;
	/**
		The color of the velocity markers when rendered to the debug display.
	**/
	var velocityDebugColor : Float;
};