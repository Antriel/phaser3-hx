package global.phaser.gameobjects.particles.zones;

/**
	A zone that places particles on a shape's edges.
**/
@:native("Phaser.GameObjects.Particles.Zones.EdgeZone") extern class EdgeZone {
	function new(source:global.phaser.types.gameobjects.particles.EdgeZoneSource, quantity:Float, stepRate:Float, ?yoyo:Bool, ?seamless:Bool);
	/**
		An object instance with a `getPoints(quantity, stepRate)` method returning an array of points.
	**/
	var source : ts.AnyOf2<global.phaser.types.gameobjects.particles.EdgeZoneSource, global.phaser.types.gameobjects.particles.RandomZoneSource>;
	/**
		The points placed on the source edge.
	**/
	var points : Array<global.phaser.geom.Point>;
	/**
		The number of particles to place on the source edge. Set to 0 to use `stepRate` instead.
	**/
	var quantity : Float;
	/**
		The distance between each particle. When set, `quantity` is implied and should be set to 0.
	**/
	var stepRate : Float;
	/**
		Whether particles are placed from start to end and then end to start.
	**/
	var yoyo : Bool;
	/**
		The counter used for iterating the EdgeZone's points.
	**/
	var counter : Float;
	/**
		Whether one endpoint will be removed if it's identical to the other.
	**/
	var seamless : Bool;
	/**
		Update the {@link Phaser.GameObjects.Particles.Zones.EdgeZone#points} from the EdgeZone's
		{@link Phaser.GameObjects.Particles.Zones.EdgeZone#source}.
		
		Also updates internal properties.
	**/
	function updateSource():EdgeZone;
	/**
		Change the source of the EdgeZone.
	**/
	function changeSource(source:global.phaser.types.gameobjects.particles.EdgeZoneSource):EdgeZone;
	/**
		Get the next point in the Zone and set its coordinates on the given Particle.
	**/
	function getPoint(particle:global.phaser.gameobjects.particles.Particle):Void;
	static var prototype : EdgeZone;
}