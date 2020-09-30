package global.phaser.types.gameobjects.particles;

/**
	The returned value updates the property for the duration of the particle's life.
**/
typedef EmitterOpOnUpdateCallback = (particle:global.phaser.gameobjects.particles.Particle, key:String, t:Float, value:Float) -> Void;