package global.phaser.gameobjects.particles.zones;

/**
	A zone that places particles randomly within a shapes area.
**/
@:native("Phaser.GameObjects.Particles.Zones.RandomZone") extern class RandomZone {
	function new(source:global.phaser.types.gameobjects.particles.RandomZoneSource);
	/**
		An object instance with a `getRandomPoint(point)` method.
	**/
	var source : global.phaser.types.gameobjects.particles.RandomZoneSource;
	/**
		Get the next point in the Zone and set its coordinates on the given Particle.
	**/
	function getPoint(particle:global.phaser.gameobjects.particles.Particle):Void;
	static var prototype : RandomZone;
}