package global.phaser.physics.matter.components;

/**
	Enables a Matter-enabled Game Object to be a sensor. Should be used as a mixin and not directly.
**/
typedef Sensor = {
	/**
		Set the body belonging to this Game Object to be a sensor.
		Sensors trigger collision events, but don't react with colliding body physically.
	**/
	function setSensor(value:Bool):global.phaser.gameobjects.GameObject;
	/**
		Is the body belonging to this Game Object a sensor or not?
	**/
	function isSensor():Bool;
};