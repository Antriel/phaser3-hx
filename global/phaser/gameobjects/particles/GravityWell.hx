package global.phaser.gameobjects.particles;

/**
	The GravityWell action applies a force on the particle to draw it towards, or repel it from, a single point.
	
	The force applied is inversely proportional to the square of the distance from the particle to the point, in accordance with Newton's law of gravity.
	
	This simulates the effect of gravity over large distances (as between planets, for example).
**/
@:native("Phaser.GameObjects.Particles.GravityWell") extern class GravityWell {
	function new(?x:ts.AnyOf2<Float, global.phaser.types.gameobjects.particles.GravityWellConfig>, ?y:Float, ?power:Float, ?epsilon:Float, ?gravity:Float);
	/**
		The x coordinate of the Gravity Well, in world space.
	**/
	var x : Float;
	/**
		The y coordinate of the Gravity Well, in world space.
	**/
	var y : Float;
	/**
		The active state of the Gravity Well. An inactive Gravity Well will not influence any particles.
	**/
	var active : Bool;
	/**
		The strength of the gravity force - larger numbers produce a stronger force.
	**/
	var power : Float;
	/**
		The minimum distance for which the gravity force is calculated.
	**/
	var epsilon : Float;
	/**
		Takes a Particle and updates it based on the properties of this Gravity Well.
	**/
	function update(particle:Particle, delta:Float, step:Float):Void;
	static var prototype : GravityWell;
}