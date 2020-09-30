package global.phaser.gameobjects.particles;

/**
	A Particle is a simple Game Object controlled by a Particle Emitter and Manager, and rendered by the Manager.
	It uses its own lightweight physics system, and can interact only with its Emitter's bounds and zones.
**/
@:native("Phaser.GameObjects.Particles.Particle") extern class Particle {
	function new(emitter:ParticleEmitter);
	/**
		The Emitter to which this Particle belongs.
		
		A Particle can only belong to a single Emitter and is created, updated and destroyed via it.
	**/
	var emitter : ParticleEmitter;
	/**
		The texture frame used to render this Particle.
	**/
	var frame : global.phaser.textures.Frame;
	/**
		The x coordinate of this Particle.
	**/
	var x : Float;
	/**
		The y coordinate of this Particle.
	**/
	var y : Float;
	/**
		The x velocity of this Particle.
	**/
	var velocityX : Float;
	/**
		The y velocity of this Particle.
	**/
	var velocityY : Float;
	/**
		The x acceleration of this Particle.
	**/
	var accelerationX : Float;
	/**
		The y acceleration of this Particle.
	**/
	var accelerationY : Float;
	/**
		The maximum horizontal velocity this Particle can travel at.
	**/
	var maxVelocityX : Float;
	/**
		The maximum vertical velocity this Particle can travel at.
	**/
	var maxVelocityY : Float;
	/**
		The bounciness, or restitution, of this Particle.
	**/
	var bounce : Float;
	/**
		The horizontal scale of this Particle.
	**/
	var scaleX : Float;
	/**
		The vertical scale of this Particle.
	**/
	var scaleY : Float;
	/**
		The alpha value of this Particle.
	**/
	var alpha : Float;
	/**
		The angle of this Particle in degrees.
	**/
	var angle : Float;
	/**
		The angle of this Particle in radians.
	**/
	var rotation : Float;
	/**
		The tint applied to this Particle.
	**/
	var tint : Float;
	/**
		The lifespan of this Particle in ms.
	**/
	var life : Float;
	/**
		The current life of this Particle in ms.
	**/
	var lifeCurrent : Float;
	/**
		The delay applied to this Particle upon emission, in ms.
	**/
	var delayCurrent : Float;
	/**
		The normalized lifespan T value, where 0 is the start and 1 is the end.
	**/
	var lifeT : Float;
	/**
		The data used by the ease equation.
	**/
	var data : Dynamic;
	/**
		Checks to see if this Particle is alive and updating.
	**/
	function isAlive():Bool;
	/**
		Resets the position of this particle back to zero.
	**/
	function resetPosition():Void;
	/**
		Starts this Particle from the given coordinates.
	**/
	function fire(x:Float, y:Float):Void;
	/**
		An internal method that calculates the velocity of the Particle.
	**/
	function computeVelocity(emitter:ParticleEmitter, delta:Float, step:Float, processors:Array<Dynamic>):Void;
	/**
		Checks if this Particle is still within the bounds defined by the given Emitter.
		
		If not, and depending on the Emitter collision flags, the Particle may either stop or rebound.
	**/
	function checkBounds(emitter:ParticleEmitter):Void;
	/**
		The main update method for this Particle.
		
		Updates its life values, computes the velocity and repositions the Particle.
	**/
	function update(delta:Float, step:Float, processors:Array<Dynamic>):Bool;
	static var prototype : Particle;
}