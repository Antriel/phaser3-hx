package global.phaser.types.gameobjects.particles;

/**
	The returned value sets what the property will be at the START of the particle's life, on emit.
**/
typedef EmitterOpOnEmitCallback = (particle:global.phaser.gameobjects.particles.Particle, key:String, value:Float) -> Void;