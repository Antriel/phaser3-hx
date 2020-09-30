package global.phaser.types.gameobjects.particles;

typedef ParticleEmitterEdgeZoneConfig = {
	/**
		A shape representing the zone. See {@link Phaser.GameObjects.Particles.Zones.EdgeZone#source}.
	**/
	var source : EdgeZoneSource;
	/**
		'edge'.
	**/
	var type : String;
	/**
		The number of particles to place on the source edge. Set to 0 to use `stepRate` instead.
	**/
	var quantity : Float;
	/**
		The distance between each particle. When set, `quantity` is implied and should be set to 0.
	**/
	@:optional
	var stepRate : Float;
	/**
		Whether particles are placed from start to end and then end to start.
	**/
	@:optional
	var yoyo : Bool;
	/**
		Whether one endpoint will be removed if it's identical to the other.
	**/
	@:optional
	var seamless : Bool;
};