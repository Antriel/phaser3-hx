package global.phaser.types.gameobjects.particles;

typedef RandomZoneSource = {
	/**
		A function modifying its point argument.
	**/
	dynamic function getRandomPoint(point:global.phaser.math.Vector2):Void;
};