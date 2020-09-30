package global.phaser.gameobjects.particles;

/**
	A Particle Emitter property.
	
	Facilitates changing Particle properties as they are emitted and throughout their lifetime.
**/
@:native("Phaser.GameObjects.Particles.EmitterOp") extern class EmitterOp {
	function new(config:global.phaser.types.gameobjects.particles.ParticleEmitterConfig, key:String, defaultValue:Float, ?emitOnly:Bool);
	/**
		The name of this property.
	**/
	var propertyKey : String;
	/**
		The value of this property.
	**/
	var propertyValue : Float;
	/**
		The default value of this property.
	**/
	var defaultValue : Float;
	/**
		The number of steps for stepped easing between {@link Phaser.GameObjects.Particles.EmitterOp#start} and
		{@link Phaser.GameObjects.Particles.EmitterOp#end} values, per emit.
	**/
	var steps : Float;
	/**
		The step counter for stepped easing, per emit.
	**/
	var counter : Float;
	/**
		The start value for this property to ease between.
	**/
	var start : Float;
	/**
		The end value for this property to ease between.
	**/
	var end : Float;
	/**
		The easing function to use for updating this property.
	**/
	var ease : haxe.Constraints.Function;
	/**
		Whether this property can only be modified when a Particle is emitted.
		
		Set to `true` to allow only {@link Phaser.GameObjects.Particles.EmitterOp#onEmit} callbacks to be set and
		affect this property.
		
		Set to `false` to allow both {@link Phaser.GameObjects.Particles.EmitterOp#onEmit} and
		{@link Phaser.GameObjects.Particles.EmitterOp#onUpdate} callbacks to be set and affect this property.
	**/
	var emitOnly : Bool;
	/**
		The callback to run for Particles when they are emitted from the Particle Emitter.
	**/
	dynamic function onEmit(particle:Particle, key:String, value:Float):Void;
	/**
		The callback to run for Particles when they are updated.
	**/
	dynamic function onUpdate(particle:Particle, key:String, t:Float, value:Float):Void;
	/**
		Load the property from a Particle Emitter configuration object.
		
		Optionally accepts a new property key to use, replacing the current one.
	**/
	function loadConfig(?config:global.phaser.types.gameobjects.particles.ParticleEmitterConfig, ?newKey:String):Void;
	/**
		Build a JSON representation of this Particle Emitter property.
	**/
	function toJSON():Dynamic;
	/**
		Change the current value of the property and update its callback methods.
	**/
	function onChange(value:Float):EmitterOp;
	/**
		Update the {@link Phaser.GameObjects.Particles.EmitterOp#onEmit} and
		{@link Phaser.GameObjects.Particles.EmitterOp#onUpdate} callbacks based on the type of the current
		{@link Phaser.GameObjects.Particles.EmitterOp#propertyValue}.
	**/
	function setMethods():EmitterOp;
	/**
		Check whether an object has the given property.
	**/
	function has(object:Dynamic, key:String):Bool;
	/**
		Check whether an object has both of the given properties.
	**/
	function hasBoth(object:Dynamic, key1:String, key2:String):Bool;
	/**
		Check whether an object has at least one of the given properties.
	**/
	function hasEither(object:Dynamic, key1:String, key2:String):Bool;
	/**
		The returned value sets what the property will be at the START of the particles life, on emit.
	**/
	function defaultEmit(particle:Particle, key:String, ?value:Float):Float;
	/**
		The returned value updates the property for the duration of the particles life.
	**/
	function defaultUpdate(particle:Particle, key:String, t:Float, value:Float):Float;
	/**
		An `onEmit` callback that returns the current value of the property.
	**/
	function staticValueEmit():Float;
	/**
		An `onUpdate` callback that returns the current value of the property.
	**/
	function staticValueUpdate():Float;
	/**
		An `onEmit` callback that returns a random value from the current value array.
	**/
	function randomStaticValueEmit():Float;
	/**
		An `onEmit` callback that returns a value between the {@link Phaser.GameObjects.Particles.EmitterOp#start} and
		{@link Phaser.GameObjects.Particles.EmitterOp#end} range.
	**/
	function randomRangedValueEmit(particle:Particle, key:String):Float;
	/**
		An `onEmit` callback that returns a stepped value between the
		{@link Phaser.GameObjects.Particles.EmitterOp#start} and {@link Phaser.GameObjects.Particles.EmitterOp#end}
		range.
	**/
	function steppedEmit():Float;
	/**
		An `onEmit` callback for an eased property.
		
		It prepares the particle for easing by {@link Phaser.GameObjects.Particles.EmitterOp#easeValueUpdate}.
	**/
	function easedValueEmit(particle:Particle, key:String):Float;
	/**
		An `onUpdate` callback that returns an eased value between the
		{@link Phaser.GameObjects.Particles.EmitterOp#start} and {@link Phaser.GameObjects.Particles.EmitterOp#end}
		range.
	**/
	function easeValueUpdate(particle:Particle, key:String, t:Float):Float;
	static var prototype : EmitterOp;
}