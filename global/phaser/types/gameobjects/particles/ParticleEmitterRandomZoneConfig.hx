package global.phaser.types.gameobjects.particles;

typedef ParticleEmitterRandomZoneConfig = {
	/**
		A shape representing the zone. See {@link Phaser.GameObjects.Particles.Zones.RandomZone#source}.
	**/
	var source : RandomZoneSource;
	/**
		'random'.
	**/
	@:optional
	var type : String;
};