package global.phaser.physics.matter.components;

/**
	Enables a Matter-enabled Game Object to set its Body. Should be used as a mixin and not directly.
**/
typedef SetBody = {
	/**
		Set the body on a Game Object to a rectangle.
		
		Calling this methods resets previous properties you may have set on the body, including
		plugins, mass, friction, etc. So be sure to re-apply these in the options object if needed.
	**/
	function setRectangle(width:Float, height:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.phaser.gameobjects.GameObject;
	/**
		Set the body on a Game Object to a circle.
		
		Calling this methods resets previous properties you may have set on the body, including
		plugins, mass, friction, etc. So be sure to re-apply these in the options object if needed.
	**/
	function setCircle(radius:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.phaser.gameobjects.GameObject;
	/**
		Set the body on the Game Object to a polygon shape.
		
		Calling this methods resets previous properties you may have set on the body, including
		plugins, mass, friction, etc. So be sure to re-apply these in the options object if needed.
	**/
	function setPolygon(sides:Float, radius:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.phaser.gameobjects.GameObject;
	/**
		Set the body on the Game Object to a trapezoid shape.
		
		Calling this methods resets previous properties you may have set on the body, including
		plugins, mass, friction, etc. So be sure to re-apply these in the options object if needed.
	**/
	function setTrapezoid(width:Float, height:Float, slope:Float, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.phaser.gameobjects.GameObject;
	/**
		Set this Game Object to use the given existing Matter Body.
		
		The body is first removed from the world before being added to this Game Object.
	**/
	function setExistingBody(body:global.matterjs.BodyType, ?addToWorld:Bool):global.phaser.gameobjects.GameObject;
	/**
		Set this Game Object to create and use a new Body based on the configuration object given.
		
		Calling this method resets previous properties you may have set on the body, including
		plugins, mass, friction, etc. So be sure to re-apply these in the options object if needed.
	**/
	function setBody(config:ts.AnyOf2<String, global.phaser.types.physics.matter.MatterSetBodyConfig>, ?options:global.phaser.types.physics.matter.MatterBodyConfig):global.phaser.gameobjects.GameObject;
};