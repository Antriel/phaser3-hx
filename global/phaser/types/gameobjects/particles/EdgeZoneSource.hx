package global.phaser.types.gameobjects.particles;

typedef EdgeZoneSource = {
	/**
		A function placing points on the sources edge or edges.
	**/
	dynamic function getPoints(quantity:Float, ?stepRate:Float):Void;
};