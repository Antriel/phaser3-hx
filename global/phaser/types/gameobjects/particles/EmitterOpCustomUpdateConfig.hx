package global.phaser.types.gameobjects.particles;

typedef EmitterOpCustomUpdateConfig = {
	/**
		A callback that is invoked each time the emitter emits a particle.
	**/
	@:optional
	dynamic function onEmit(particle:global.phaser.gameobjects.particles.Particle, key:String, value:Float):Void;
	/**
		A callback that is invoked each time the emitter updates.
	**/
	dynamic function onUpdate(particle:global.phaser.gameobjects.particles.Particle, key:String, t:Float, value:Float):Void;
};