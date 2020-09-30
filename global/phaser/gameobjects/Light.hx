package global.phaser.gameobjects;

/**
	A 2D point light.
	
	These are typically created by a {@link Phaser.GameObjects.LightsManager}, available from within a scene via `this.lights`.
	
	Any Game Objects using the Light2D pipeline will then be affected by these Lights.
	
	They can also simply be used to represent a point light for your own purposes.
**/
@:native("Phaser.GameObjects.Light") extern class Light {
	function new(x:Float, y:Float, radius:Float, r:Float, g:Float, b:Float, intensity:Float);
	/**
		The horizontal position of the light.
	**/
	var x : Float;
	/**
		The vertical position of the light.
	**/
	var y : Float;
	/**
		The radius of the light.
	**/
	var radius : Float;
	/**
		The red color of the light. A value between 0 and 1.
	**/
	var r : Float;
	/**
		The green color of the light. A value between 0 and 1.
	**/
	var g : Float;
	/**
		The blue color of the light. A value between 0 and 1.
	**/
	var b : Float;
	/**
		The intensity of the light.
	**/
	var intensity : Float;
	/**
		The horizontal scroll factor of the light.
	**/
	var scrollFactorX : Float;
	/**
		The vertical scroll factor of the light.
	**/
	var scrollFactorY : Float;
	/**
		Set the properties of the light.
		
		Sets both horizontal and vertical scroll factor to 1. Use {@link Phaser.GameObjects.Light#setScrollFactor} to set
		the scroll factor.
	**/
	function set(x:Float, y:Float, radius:Float, r:Float, g:Float, b:Float, intensity:Float):Light;
	/**
		Set the scroll factor of the light.
	**/
	function setScrollFactor(x:Float, y:Float):Light;
	/**
		Set the color of the light from a single integer RGB value.
	**/
	function setColor(rgb:Float):Light;
	/**
		Set the intensity of the light.
	**/
	function setIntensity(intensity:Float):Light;
	/**
		Set the position of the light.
	**/
	function setPosition(x:Float, y:Float):Light;
	/**
		Set the radius of the light.
	**/
	function setRadius(radius:Float):Light;
	static var prototype : Light;
}