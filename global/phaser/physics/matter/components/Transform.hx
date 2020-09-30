package global.phaser.physics.matter.components;

/**
	Provides methods used for getting and setting the position, scale and rotation of a Game Object.
**/
typedef Transform = {
	/**
		The x position of this Game Object.
	**/
	var x : Float;
	/**
		The y position of this Game Object.
	**/
	var y : Float;
	/**
		The horizontal scale of this Game Object.
	**/
	var scaleX : Float;
	/**
		The vertical scale of this Game Object.
	**/
	var scaleY : Float;
	/**
		Use `angle` to set or get rotation of the physics body associated to this GameObject.
		Unlike rotation, when using set the value can be in degrees, which will be converted to radians internally.
	**/
	var angle : Float;
	/**
		Use `rotation` to set or get the rotation of the physics body associated with this GameObject.
		The value when set must be in radians.
	**/
	var rotation : Float;
	/**
		Sets the position of the physics body along x and y axes.
		Both the parameters to this function are optional and if not passed any they default to 0.
		Velocity, angle, force etc. are unchanged.
	**/
	function setPosition(?x:Float, ?y:Float):Transform;
	/**
		Immediately sets the angle of the Body.
		Angular velocity, position, force etc. are unchanged.
	**/
	function setRotation(?radians:Float):Transform;
	/**
		Setting fixed rotation sets the Body inertia to Infinity, which stops it
		from being able to rotate when forces are applied to it.
	**/
	function setFixedRotation():Transform;
	/**
		Immediately sets the angle of the Body.
		Angular velocity, position, force etc. are unchanged.
	**/
	function setAngle(?degrees:Float):Transform;
	/**
		Sets the scale of this Game Object.
	**/
	function setScale(?x:Float, ?y:Float, ?point:global.phaser.math.Vector2):Transform;
};