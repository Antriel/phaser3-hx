package global.phaser.physics.arcade;

@:native("Phaser.Physics.Arcade.Events") @valueModuleOnly extern class Events {
	/**
		The Arcade Physics World Collide Event.
		
		This event is dispatched by an Arcade Physics World instance if two bodies collide _and_ at least
		one of them has their [onCollide]{@link Phaser.Physics.Arcade.Body#onCollide} property set to `true`.
		
		It provides an alternative means to handling collide events rather than using the callback approach.
		
		Listen to it from a Scene using: `this.physics.world.on('collide', listener)`.
		
		Please note that 'collide' and 'overlap' are two different things in Arcade Physics.
	**/
	static final COLLIDE : Dynamic;
	/**
		The Arcade Physics World Overlap Event.
		
		This event is dispatched by an Arcade Physics World instance if two bodies overlap _and_ at least
		one of them has their [onOverlap]{@link Phaser.Physics.Arcade.Body#onOverlap} property set to `true`.
		
		It provides an alternative means to handling overlap events rather than using the callback approach.
		
		Listen to it from a Scene using: `this.physics.world.on('overlap', listener)`.
		
		Please note that 'collide' and 'overlap' are two different things in Arcade Physics.
	**/
	static final OVERLAP : Dynamic;
	/**
		The Arcade Physics World Pause Event.
		
		This event is dispatched by an Arcade Physics World instance when it is paused.
		
		Listen to it from a Scene using: `this.physics.world.on('pause', listener)`.
	**/
	static final PAUSE : Dynamic;
	/**
		The Arcade Physics World Resume Event.
		
		This event is dispatched by an Arcade Physics World instance when it resumes from a paused state.
		
		Listen to it from a Scene using: `this.physics.world.on('resume', listener)`.
	**/
	static final RESUME : Dynamic;
	/**
		The Arcade Physics Tile Collide Event.
		
		This event is dispatched by an Arcade Physics World instance if a body collides with a Tile _and_
		has its [onCollide]{@link Phaser.Physics.Arcade.Body#onCollide} property set to `true`.
		
		It provides an alternative means to handling collide events rather than using the callback approach.
		
		Listen to it from a Scene using: `this.physics.world.on('tilecollide', listener)`.
		
		Please note that 'collide' and 'overlap' are two different things in Arcade Physics.
	**/
	static final TILE_COLLIDE : Dynamic;
	/**
		The Arcade Physics Tile Overlap Event.
		
		This event is dispatched by an Arcade Physics World instance if a body overlaps with a Tile _and_
		has its [onOverlap]{@link Phaser.Physics.Arcade.Body#onOverlap} property set to `true`.
		
		It provides an alternative means to handling overlap events rather than using the callback approach.
		
		Listen to it from a Scene using: `this.physics.world.on('tileoverlap', listener)`.
		
		Please note that 'collide' and 'overlap' are two different things in Arcade Physics.
	**/
	static final TILE_OVERLAP : Dynamic;
	/**
		The Arcade Physics World Bounds Event.
		
		This event is dispatched by an Arcade Physics World instance if a body makes contact with the world bounds _and_
		it has its [onWorldBounds]{@link Phaser.Physics.Arcade.Body#onWorldBounds} property set to `true`.
		
		It provides an alternative means to handling collide events rather than using the callback approach.
		
		Listen to it from a Scene using: `this.physics.world.on('worldbounds', listener)`.
	**/
	static final WORLD_BOUNDS : Dynamic;
	/**
		The Arcade Physics World Step Event.
		
		This event is dispatched by an Arcade Physics World instance whenever a physics step is run.
		It is emitted _after_ the bodies and colliders have been updated.
		
		In high framerate settings this can be multiple times per game frame.
		
		Listen to it from a Scene using: `this.physics.world.on('worldstep', listener)`.
	**/
	static final WORLD_STEP : Dynamic;
}