package global.phaser.types.gameobjects.particles;

typedef ParticleEmitterDeathZoneConfig = {
	/**
		A shape representing the zone. See {@link Phaser.GameObjects.Particles.Zones.DeathZone#source}.
	**/
	var source : DeathZoneSource;
	/**
		'onEnter' or 'onLeave'.
	**/
	@:optional
	var type : String;
};