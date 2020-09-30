package global.phaser.types.physics.arcade;

typedef PhysicsGroupConfig = global.phaser.types.gameobjects.group.GroupConfig & {
	/**
		Sets {@link Phaser.Physics.Arcade.Body#collideWorldBounds}.
	**/
	@:optional
	var collideWorldBounds : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#setBoundsRectangle setBoundsRectangle}.
	**/
	@:optional
	var customBoundsRectangle : global.phaser.geom.Rectangle;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#acceleration acceleration.x}.
	**/
	@:optional
	var accelerationX : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#acceleration acceleration.y}.
	**/
	@:optional
	var accelerationY : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#allowDrag}.
	**/
	@:optional
	var allowDrag : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#allowGravity}.
	**/
	@:optional
	var allowGravity : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#allowRotation}.
	**/
	@:optional
	var allowRotation : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#bounce bounce.x}.
	**/
	@:optional
	var bounceX : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#bounce bounce.y}.
	**/
	@:optional
	var bounceY : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#drag drag.x}.
	**/
	@:optional
	var dragX : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#drag drag.y}.
	**/
	@:optional
	var dragY : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#enable enable}.
	**/
	@:optional
	var enable : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#gravity gravity.x}.
	**/
	@:optional
	var gravityX : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#gravity gravity.y}.
	**/
	@:optional
	var gravityY : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#friction friction.x}.
	**/
	@:optional
	var frictionX : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#friction friction.y}.
	**/
	@:optional
	var frictionY : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#velocity velocity.x}.
	**/
	@:optional
	var velocityX : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#velocity velocity.y}.
	**/
	@:optional
	var velocityY : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#angularVelocity}.
	**/
	@:optional
	var angularVelocity : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#angularAcceleration}.
	**/
	@:optional
	var angularAcceleration : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#angularDrag}.
	**/
	@:optional
	var angularDrag : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#mass}.
	**/
	@:optional
	var mass : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.Body#immovable}.
	**/
	@:optional
	var immovable : Bool;
};