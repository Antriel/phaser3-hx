package global.phaser.gameobjects.particles.zones;

/**
	A Death Zone.
	
	A Death Zone is a special type of zone that will kill a Particle as soon as it either enters, or leaves, the zone.
	
	The zone consists of a `source` which could be a Geometric shape, such as a Rectangle or Ellipse, or your own
	object as long as it includes a `contains` method for which the Particles can be tested against.
**/
@:native("Phaser.GameObjects.Particles.Zones.DeathZone") extern class DeathZone {
	function new(source:global.phaser.types.gameobjects.particles.DeathZoneSource, killOnEnter:Bool);
	/**
		An object instance that has a `contains` method that returns a boolean when given `x` and `y` arguments.
		This could be a Geometry shape, such as `Phaser.Geom.Circle`, or your own custom object.
	**/
	var source : global.phaser.types.gameobjects.particles.DeathZoneSource;
	/**
		Set to `true` if the Particle should be killed if it enters this zone.
		Set to `false` to kill the Particle if it leaves this zone.
	**/
	var killOnEnter : Bool;
	/**
		Checks if the given Particle will be killed or not by this zone.
	**/
	function willKill(particle:global.phaser.gameobjects.particles.Particle):Bool;
	static var prototype : DeathZone;
}