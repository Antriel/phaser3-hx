package global.phaser.types.physics.arcade;

typedef ArcadeWorldConfig = {
	/**
		Sets {@link Phaser.Physics.Arcade.World#fps}.
	**/
	@:optional
	var fps : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#fixedStep}.
	**/
	@:optional
	var fixedStep : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.World#timeScale}.
	**/
	@:optional
	var timeScale : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#gravity}.
	**/
	@:optional
	var gravity : global.phaser.types.math.Vector2Like;
	/**
		Sets {@link Phaser.Physics.Arcade.World#bounds bounds.x}.
	**/
	@:optional
	var x : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#bounds bounds.y}.
	**/
	@:optional
	var y : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#bounds bounds.width}.
	**/
	@:optional
	var width : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#bounds bounds.height}.
	**/
	@:optional
	var height : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#checkCollision}.
	**/
	@:optional
	var checkCollision : CheckCollisionObject;
	/**
		Sets {@link Phaser.Physics.Arcade.World#OVERLAP_BIAS}.
	**/
	@:optional
	var overlapBias : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#TILE_BIAS}.
	**/
	@:optional
	var tileBias : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#forceX}.
	**/
	@:optional
	var forceX : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.World#isPaused}.
	**/
	@:optional
	var isPaused : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.World#debug}.
	**/
	@:optional
	var debug : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.World#defaults debugShowBody}.
	**/
	@:optional
	var debugShowBody : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.World#defaults debugShowStaticBody}.
	**/
	@:optional
	var debugShowStaticBody : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.World#defaults debugShowStaticBody}.
	**/
	@:optional
	var debugShowVelocity : Bool;
	/**
		Sets {@link Phaser.Physics.Arcade.World#defaults bodyDebugColor}.
	**/
	@:optional
	var debugBodyColor : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#defaults staticBodyDebugColor}.
	**/
	@:optional
	var debugStaticBodyColor : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#defaults velocityDebugColor}.
	**/
	@:optional
	var debugVelocityColor : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#maxEntries}.
	**/
	@:optional
	var maxEntries : Float;
	/**
		Sets {@link Phaser.Physics.Arcade.World#useTree}.
	**/
	@:optional
	var useTree : Bool;
	/**
		If enabled, you need to call `World.update` yourself.
	**/
	@:optional
	var customUpdate : Bool;
};