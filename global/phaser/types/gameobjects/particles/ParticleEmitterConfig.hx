package global.phaser.types.gameobjects.particles;

typedef ParticleEmitterConfig = {
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#active}.
	**/
	@:optional
	var active : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#blendMode}.
	**/
	@:optional
	var blendMode : ts.AnyOf2<String, global.phaser.BlendModes>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#deathCallbackScope} and {@link Phaser.GameObjects.Particles.ParticleEmitter#emitCallbackScope}.
	**/
	@:optional
	var callbackScope : Dynamic;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#collideBottom}.
	**/
	@:optional
	var collideBottom : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#collideLeft}.
	**/
	@:optional
	var collideLeft : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#collideRight}.
	**/
	@:optional
	var collideRight : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#collideTop}.
	**/
	@:optional
	var collideTop : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#deathCallback}.
	**/
	@:optional
	var deathCallback : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#deathCallbackScope}.
	**/
	@:optional
	var deathCallbackScope : Dynamic;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#emitCallback}.
	**/
	@:optional
	var emitCallback : haxe.Constraints.Function;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#emitCallbackScope}.
	**/
	@:optional
	var emitCallbackScope : Dynamic;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#follow}.
	**/
	@:optional
	var follow : global.phaser.gameobjects.GameObject;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#frequency}.
	**/
	@:optional
	var frequency : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#gravityX}.
	**/
	@:optional
	var gravityX : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#gravityY}.
	**/
	@:optional
	var gravityY : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#maxParticles}.
	**/
	@:optional
	var maxParticles : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#name}.
	**/
	@:optional
	var name : String;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#on}.
	**/
	@:optional
	var on : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleBringToTop}.
	**/
	@:optional
	var particleBringToTop : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#particleClass}.
	**/
	@:optional
	var particleClass : global.phaser.gameobjects.particles.Particle;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#radial}.
	**/
	@:optional
	var radial : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#timeScale}.
	**/
	@:optional
	var timeScale : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#trackVisible}.
	**/
	@:optional
	var trackVisible : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#visible}.
	**/
	@:optional
	var visible : Bool;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#accelerationX} (emit only).
	**/
	@:optional
	var accelerationX : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#accelerationY} (emit only).
	**/
	@:optional
	var accelerationY : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#alpha}.
	**/
	@:optional
	var alpha : ts.AnyOf11<Float, EmitterOpOnEmitCallback, EmitterOpOnUpdateCallback, Array<Float>, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpRandomStartEndConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#angle} (emit only).
	**/
	@:optional
	var angle : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#bounce} (emit only).
	**/
	@:optional
	var bounce : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#delay} (emit only).
	**/
	@:optional
	var delay : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#lifespan} (emit only).
	**/
	@:optional
	var lifespan : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#maxVelocityX} (emit only).
	**/
	@:optional
	var maxVelocityX : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#maxVelocityY} (emit only).
	**/
	@:optional
	var maxVelocityY : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#moveToX} (emit only).
	**/
	@:optional
	var moveToX : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#moveToY} (emit only).
	**/
	@:optional
	var moveToY : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#quantity} (emit only).
	**/
	@:optional
	var quantity : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#rotate}.
	**/
	@:optional
	var rotate : ts.AnyOf11<Float, EmitterOpOnEmitCallback, EmitterOpOnUpdateCallback, Array<Float>, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpRandomStartEndConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig>;
	/**
		As {@link Phaser.GameObjects.Particles.ParticleEmitter#setScale}.
	**/
	@:optional
	var scale : ts.AnyOf11<Float, EmitterOpOnEmitCallback, EmitterOpOnUpdateCallback, Array<Float>, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpRandomStartEndConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#scaleX}.
	**/
	@:optional
	var scaleX : ts.AnyOf11<Float, EmitterOpOnEmitCallback, EmitterOpOnUpdateCallback, Array<Float>, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpRandomStartEndConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#scaleY}.
	**/
	@:optional
	var scaleY : ts.AnyOf11<Float, EmitterOpOnEmitCallback, EmitterOpOnUpdateCallback, Array<Float>, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpRandomStartEndConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig>;
	/**
		As {@link Phaser.GameObjects.Particles.ParticleEmitter#setSpeed} (emit only).
	**/
	@:optional
	var speed : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#speedX} (emit only).
	**/
	@:optional
	var speedX : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#speedY} (emit only).
	**/
	@:optional
	var speedY : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#tint}.
	**/
	@:optional
	var tint : ts.AnyOf11<Float, EmitterOpOnEmitCallback, EmitterOpOnUpdateCallback, Array<Float>, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpRandomStartEndConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig, EmitterOpEaseConfig, EmitterOpCustomUpdateConfig>;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#x} (emit only).
	**/
	@:optional
	var x : EmitterOpOnEmitType;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#y} (emit only).
	**/
	@:optional
	var y : EmitterOpOnEmitType;
	/**
		As {@link Phaser.GameObjects.Particles.ParticleEmitter#setEmitZone}.
	**/
	@:optional
	var emitZone : Dynamic;
	/**
		As {@link Phaser.GameObjects.Particles.ParticleEmitter#setBounds}.
	**/
	@:optional
	var bounds : ts.AnyOf2<ParticleEmitterBounds, ParticleEmitterBoundsAlt>;
	/**
		Assigns to {@link Phaser.GameObjects.Particles.ParticleEmitter#followOffset}.
	**/
	@:optional
	var followOffset : Dynamic;
	/**
		x-coordinate of the offset.
	**/
	@:optional
	@:native("followOffset.x")
	var followOffset_x : Float;
	/**
		y-coordinate of the offset.
	**/
	@:optional
	@:native("followOffset.y")
	var followOffset_y : Float;
	/**
		Sets {@link Phaser.GameObjects.Particles.ParticleEmitter#frames}.
	**/
	@:optional
	var frame : ts.AnyOf7<String, Float, global.phaser.textures.Frame, Array<String>, Array<Float>, Array<global.phaser.textures.Frame>, ParticleEmitterFrameConfig>;
};