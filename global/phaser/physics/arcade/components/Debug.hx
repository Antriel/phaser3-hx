package global.phaser.physics.arcade.components;

/**
	Provides methods used for setting the debug properties of an Arcade Physics Body.
**/
typedef Debug = {
	/**
		Sets the debug values of this body.
		
		Bodies will only draw their debug if debug has been enabled for Arcade Physics as a whole.
		Note that there is a performance cost in drawing debug displays. It should never be used in production.
	**/
	function setDebug(showBody:Bool, showVelocity:Bool, bodyColor:Float):Debug;
	/**
		Sets the color of the body outline when it renders to the debug display.
	**/
	function setDebugBodyColor(value:Float):Debug;
	/**
		Set to `true` to have this body render its outline to the debug display.
	**/
	var debugShowBody : Bool;
	/**
		Set to `true` to have this body render a velocity marker to the debug display.
	**/
	var debugShowVelocity : Bool;
	/**
		The color of the body outline when it renders to the debug display.
	**/
	var debugBodyColor : Float;
};