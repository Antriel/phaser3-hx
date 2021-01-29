package global.phaser.gameobjects.particles;

/**
	A particle emitter represents a single particle stream.
	It controls a pool of {@link Phaser.GameObjects.Particles.Particle Particles} and is controlled by a {@link Phaser.GameObjects.Particles.ParticleEmitterManager Particle Emitter Manager}.
**/
@:native("Phaser.GameObjects.Particles.ParticleEmitter") extern class ParticleEmitter {
	function new(manager:ParticleEmitterManager, config:global.phaser.types.gameobjects.particles.ParticleEmitterConfig);
	/**
		The Emitter Manager this Emitter belongs to.
	**/
	var manager : ParticleEmitterManager;
	/**
		The texture assigned to particles.
	**/
	var texture : global.phaser.textures.Texture;
	/**
		The texture frames assigned to particles.
	**/
	var frames : Array<global.phaser.textures.Frame>;
	/**
		The default texture frame assigned to particles.
	**/
	var defaultFrame : global.phaser.textures.Frame;
	/**
		Names of simple configuration properties.
	**/
	var configFastMap : Dynamic;
	/**
		Names of complex configuration properties.
	**/
	var configOpMap : Dynamic;
	/**
		The name of this Particle Emitter.
		
		Empty by default and never populated by Phaser, this is left for developers to use.
	**/
	var name : String;
	/**
		The Particle Class which will be emitted by this Emitter.
	**/
	var particleClass : Particle;
	/**
		The x-coordinate of the particle origin (where particles will be emitted).
	**/
	var x : EmitterOp;
	/**
		The y-coordinate of the particle origin (where particles will be emitted).
	**/
	var y : EmitterOp;
	/**
		A radial emitter will emit particles in all directions between angle min and max,
		using {@link Phaser.GameObjects.Particles.ParticleEmitter#speed} as the value. If set to false then this acts as a point Emitter.
		A point emitter will emit particles only in the direction derived from the speedX and speedY values.
	**/
	var radial : Bool;
	/**
		Horizontal acceleration applied to emitted particles, in pixels per second squared.
	**/
	var gravityX : Float;
	/**
		Vertical acceleration applied to emitted particles, in pixels per second squared.
	**/
	var gravityY : Float;
	/**
		Whether accelerationX and accelerationY are non-zero. Set automatically during configuration.
	**/
	var acceleration : Bool;
	/**
		Horizontal acceleration applied to emitted particles, in pixels per second squared.
	**/
	var accelerationX : EmitterOp;
	/**
		Vertical acceleration applied to emitted particles, in pixels per second squared.
	**/
	var accelerationY : EmitterOp;
	/**
		The maximum horizontal velocity of emitted particles, in pixels per second squared.
	**/
	var maxVelocityX : EmitterOp;
	/**
		The maximum vertical velocity of emitted particles, in pixels per second squared.
	**/
	var maxVelocityY : EmitterOp;
	/**
		The initial horizontal speed of emitted particles, in pixels per second.
	**/
	var speedX : EmitterOp;
	/**
		The initial vertical speed of emitted particles, in pixels per second.
	**/
	var speedY : EmitterOp;
	/**
		Whether moveToX and moveToY are nonzero. Set automatically during configuration.
	**/
	var moveTo : Bool;
	/**
		The x-coordinate emitted particles move toward, when {@link Phaser.GameObjects.Particles.ParticleEmitter#moveTo} is true.
	**/
	var moveToX : EmitterOp;
	/**
		The y-coordinate emitted particles move toward, when {@link Phaser.GameObjects.Particles.ParticleEmitter#moveTo} is true.
	**/
	var moveToY : EmitterOp;
	/**
		Whether particles will rebound when they meet the emitter bounds.
	**/
	var bounce : EmitterOp;
	/**
		The horizontal scale of emitted particles.
	**/
	var scaleX : EmitterOp;
	/**
		The vertical scale of emitted particles.
	**/
	var scaleY : EmitterOp;
	/**
		Color tint applied to emitted particles. Value must not include the alpha channel.
	**/
	var tint : EmitterOp;
	/**
		The alpha (transparency) of emitted particles.
	**/
	var alpha : EmitterOp;
	/**
		The lifespan of emitted particles, in ms.
	**/
	var lifespan : EmitterOp;
	/**
		The angle of the initial velocity of emitted particles, in degrees.
	**/
	var angle : EmitterOp;
	/**
		The rotation of emitted particles, in degrees.
	**/
	var rotate : EmitterOp;
	/**
		A function to call when a particle is emitted.
	**/
	dynamic function emitCallback(particle:Particle, emitter:ParticleEmitter):Void;
	/**
		The calling context for {@link Phaser.GameObjects.Particles.ParticleEmitter#emitCallback}.
	**/
	var emitCallbackScope : Dynamic;
	/**
		A function to call when a particle dies.
	**/
	dynamic function deathCallback(particle:Particle):Void;
	/**
		The calling context for {@link Phaser.GameObjects.Particles.ParticleEmitter#deathCallback}.
	**/
	var deathCallbackScope : Dynamic;
	/**
		Set to hard limit the amount of particle objects this emitter is allowed to create.
		0 means unlimited.
	**/
	var maxParticles : Float;
	/**
		How many particles are emitted each time particles are emitted (one explosion or one flow cycle).
	**/
	var quantity : EmitterOp;
	/**
		How many ms to wait after emission before the particles start updating.
	**/
	var delay : EmitterOp;
	/**
		For a flow emitter, the time interval (>= 0) between particle flow cycles in ms.
		A value of 0 means there is one particle flow cycle for each logic update (the maximum flow frequency). This is the default setting.
		For an exploding emitter, this value will be -1.
		Calling {@link Phaser.GameObjects.Particles.ParticleEmitter#flow} also puts the emitter in flow mode (frequency >= 0).
		Calling {@link Phaser.GameObjects.Particles.ParticleEmitter#explode} also puts the emitter in explode mode (frequency = -1).
	**/
	var frequency : Float;
	/**
		Controls if the emitter is currently emitting a particle flow (when frequency >= 0).
		Already alive particles will continue to update until they expire.
		Controlled by {@link Phaser.GameObjects.Particles.ParticleEmitter#start} and {@link Phaser.GameObjects.Particles.ParticleEmitter#stop}.
	**/
	var on : Bool;
	/**
		Newly emitted particles are added to the top of the particle list, i.e. rendered above those already alive.
		Set to false to send them to the back.
	**/
	var particleBringToTop : Bool;
	/**
		The time rate applied to active particles, affecting lifespan, movement, and tweens. Values larger than 1 are faster than normal.
	**/
	var timeScale : Float;
	/**
		An object describing a shape to emit particles from.
	**/
	var emitZone : ts.AnyOf2<global.phaser.gameobjects.particles.zones.EdgeZone, global.phaser.gameobjects.particles.zones.RandomZone>;
	/**
		An object describing a shape that deactivates particles when they interact with it.
	**/
	var deathZone : global.phaser.gameobjects.particles.zones.DeathZone;
	/**
		A rectangular boundary constraining particle movement.
	**/
	var bounds : global.phaser.geom.Rectangle;
	/**
		Whether particles interact with the left edge of the emitter {@link Phaser.GameObjects.Particles.ParticleEmitter#bounds}.
	**/
	var collideLeft : Bool;
	/**
		Whether particles interact with the right edge of the emitter {@link Phaser.GameObjects.Particles.ParticleEmitter#bounds}.
	**/
	var collideRight : Bool;
	/**
		Whether particles interact with the top edge of the emitter {@link Phaser.GameObjects.Particles.ParticleEmitter#bounds}.
	**/
	var collideTop : Bool;
	/**
		Whether particles interact with the bottom edge of the emitter {@link Phaser.GameObjects.Particles.ParticleEmitter#bounds}.
	**/
	var collideBottom : Bool;
	/**
		Whether this emitter updates itself and its particles.
		
		Controlled by {@link Phaser.GameObjects.Particles.ParticleEmitter#pause}
		and {@link Phaser.GameObjects.Particles.ParticleEmitter#resume}.
	**/
	var active : Bool;
	/**
		Set this to false to hide any active particles.
	**/
	var visible : Bool;
	/**
		The blend mode of this emitter's particles.
	**/
	var blendMode : Float;
	/**
		A Game Object whose position is used as the particle origin.
	**/
	var follow : global.phaser.gameobjects.GameObject;
	/**
		The offset of the particle origin from the {@link Phaser.GameObjects.Particles.ParticleEmitter#follow} target.
	**/
	var followOffset : global.phaser.math.Vector2;
	/**
		Whether the emitter's {@link Phaser.GameObjects.Particles.ParticleEmitter#visible} state will track
		the {@link Phaser.GameObjects.Particles.ParticleEmitter#follow} target's visibility state.
	**/
	var trackVisible : Bool;
	/**
		The current texture frame, as an index of {@link Phaser.GameObjects.Particles.ParticleEmitter#frames}.
	**/
	var currentFrame : Float;
	/**
		Whether texture {@link Phaser.GameObjects.Particles.ParticleEmitter#frames} are selected at random.
	**/
	var randomFrame : Bool;
	/**
		The number of consecutive particles that receive a single texture frame (per frame cycle).
	**/
	var frameQuantity : Float;
	/**
		Merges configuration settings into the emitter's current settings.
	**/
	function fromJSON(config:global.phaser.types.gameobjects.particles.ParticleEmitterConfig):ParticleEmitter;
	/**
		Creates a description of this emitter suitable for JSON serialization.
	**/
	function toJSON(?output:Dynamic):Dynamic;
	/**
		Continuously moves the particle origin to follow a Game Object's position.
	**/
	function startFollow(target:global.phaser.gameobjects.GameObject, ?offsetX:Float, ?offsetY:Float, ?trackVisible:Bool):ParticleEmitter;
	/**
		Stops following a Game Object.
	**/
	function stopFollow():ParticleEmitter;
	/**
		Chooses a texture frame from {@link Phaser.GameObjects.Particles.ParticleEmitter#frames}.
	**/
	function getFrame():global.phaser.textures.Frame;
	/**
		Sets a pattern for assigning texture frames to emitted particles.
	**/
	function setFrame(frames:ts.AnyOf4<String, Float, Array<Dynamic>, global.phaser.types.gameobjects.particles.ParticleEmitterFrameConfig>, ?pickRandom:Bool, ?quantity:Float):ParticleEmitter;
	/**
		Turns {@link Phaser.GameObjects.Particles.ParticleEmitter#radial} particle movement on or off.
	**/
	function setRadial(?value:Bool):ParticleEmitter;
	/**
		Sets the position of the emitter's particle origin.
		New particles will be emitted here.
	**/
	function setPosition(x:global.phaser.types.gameobjects.particles.EmitterOpOnEmitType, y:global.phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets or modifies a rectangular boundary constraining the particles.
		
		To remove the boundary, set {@link Phaser.GameObjects.Particles.ParticleEmitter#bounds} to null.
	**/
	function setBounds(x:ts.AnyOf3<Float, global.phaser.types.gameobjects.particles.ParticleEmitterBounds, global.phaser.types.gameobjects.particles.ParticleEmitterBoundsAlt>, y:Float, width:Float, height:Float):ParticleEmitter;
	/**
		Sets the initial horizontal speed of emitted particles.
		Changes the emitter to point mode.
	**/
	function setSpeedX(value:global.phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets the initial vertical speed of emitted particles.
		Changes the emitter to point mode.
	**/
	function setSpeedY(value:global.phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets the initial radial speed of emitted particles.
		Changes the emitter to radial mode.
	**/
	function setSpeed(value:global.phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets the horizontal scale of emitted particles.
	**/
	function setScaleX(value:ts.AnyOf11<Float, global.phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, global.phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, Array<Float>, global.phaser.types.gameobjects.particles.EmitterOpRandomConfig, global.phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, global.phaser.types.gameobjects.particles.EmitterOpRandomStartEndConfig, global.phaser.types.gameobjects.particles.EmitterOpSteppedConfig, global.phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, global.phaser.types.gameobjects.particles.EmitterOpEaseConfig, global.phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig>):ParticleEmitter;
	/**
		Sets the vertical scale of emitted particles.
	**/
	function setScaleY(value:ts.AnyOf11<Float, global.phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, global.phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, Array<Float>, global.phaser.types.gameobjects.particles.EmitterOpRandomConfig, global.phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, global.phaser.types.gameobjects.particles.EmitterOpRandomStartEndConfig, global.phaser.types.gameobjects.particles.EmitterOpSteppedConfig, global.phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, global.phaser.types.gameobjects.particles.EmitterOpEaseConfig, global.phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig>):ParticleEmitter;
	/**
		Sets the scale of emitted particles.
	**/
	function setScale(value:ts.AnyOf11<Float, global.phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, global.phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, Array<Float>, global.phaser.types.gameobjects.particles.EmitterOpRandomConfig, global.phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, global.phaser.types.gameobjects.particles.EmitterOpRandomStartEndConfig, global.phaser.types.gameobjects.particles.EmitterOpSteppedConfig, global.phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, global.phaser.types.gameobjects.particles.EmitterOpEaseConfig, global.phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig>):ParticleEmitter;
	/**
		Sets the horizontal gravity applied to emitted particles.
	**/
	function setGravityX(value:Float):ParticleEmitter;
	/**
		Sets the vertical gravity applied to emitted particles.
	**/
	function setGravityY(value:Float):ParticleEmitter;
	/**
		Sets the gravity applied to emitted particles.
	**/
	function setGravity(x:Float, y:Float):ParticleEmitter;
	/**
		Sets the opacity of emitted particles.
	**/
	function setAlpha(value:ts.AnyOf11<Float, global.phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, global.phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, Array<Float>, global.phaser.types.gameobjects.particles.EmitterOpRandomConfig, global.phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, global.phaser.types.gameobjects.particles.EmitterOpRandomStartEndConfig, global.phaser.types.gameobjects.particles.EmitterOpSteppedConfig, global.phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, global.phaser.types.gameobjects.particles.EmitterOpEaseConfig, global.phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig>):ParticleEmitter;
	/**
		Sets the color tint of emitted particles.
	**/
	function setTint(value:ts.AnyOf11<Float, global.phaser.types.gameobjects.particles.EmitterOpOnEmitCallback, global.phaser.types.gameobjects.particles.EmitterOpOnUpdateCallback, Array<Float>, global.phaser.types.gameobjects.particles.EmitterOpRandomConfig, global.phaser.types.gameobjects.particles.EmitterOpRandomMinMaxConfig, global.phaser.types.gameobjects.particles.EmitterOpRandomStartEndConfig, global.phaser.types.gameobjects.particles.EmitterOpSteppedConfig, global.phaser.types.gameobjects.particles.EmitterOpCustomEmitConfig, global.phaser.types.gameobjects.particles.EmitterOpEaseConfig, global.phaser.types.gameobjects.particles.EmitterOpCustomUpdateConfig>):ParticleEmitter;
	/**
		Sets the angle of a {@link Phaser.GameObjects.Particles.ParticleEmitter#radial} particle stream.
	**/
	function setEmitterAngle(value:global.phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets the angle of a {@link Phaser.GameObjects.Particles.ParticleEmitter#radial} particle stream.
	**/
	function setAngle(value:global.phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets the lifespan of newly emitted particles.
	**/
	function setLifespan(value:global.phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets the number of particles released at each flow cycle or explosion.
	**/
	function setQuantity(quantity:global.phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets the emitter's {@link Phaser.GameObjects.Particles.ParticleEmitter#frequency}
		and {@link Phaser.GameObjects.Particles.ParticleEmitter#quantity}.
	**/
	function setFrequency(frequency:Float, ?quantity:global.phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Sets or removes the {@link Phaser.GameObjects.Particles.ParticleEmitter#emitZone}.
		
		An {@link Phaser.Types.GameObjects.Particles.ParticleEmitterEdgeZoneConfig EdgeZone} places particles on its edges. Its {@link Phaser.Types.GameObjects.Particles.EdgeZoneSource source} can be a Curve, Path, Circle, Ellipse, Line, Polygon, Rectangle, or Triangle; or any object with a suitable {@link Phaser.Types.GameObjects.Particles.EdgeZoneSourceCallback getPoints} method.
		
		A {@link Phaser.Types.GameObjects.Particles.ParticleEmitterRandomZoneConfig RandomZone} places randomly within its interior. Its {@link RandomZoneSource source} can be a Circle, Ellipse, Line, Polygon, Rectangle, or Triangle; or any object with a suitable {@link Phaser.Types.GameObjects.Particles.RandomZoneSourceCallback getRandomPoint} method.
	**/
	function setEmitZone(?zoneConfig:ts.AnyOf2<global.phaser.types.gameobjects.particles.ParticleEmitterEdgeZoneConfig, global.phaser.types.gameobjects.particles.ParticleEmitterRandomZoneConfig>):ParticleEmitter;
	/**
		Sets or removes the {@link Phaser.GameObjects.Particles.ParticleEmitter#deathZone}.
	**/
	function setDeathZone(?zoneConfig:global.phaser.types.gameobjects.particles.ParticleEmitterDeathZoneConfig):ParticleEmitter;
	/**
		Creates inactive particles and adds them to this emitter's pool.
	**/
	function reserve(particleCount:Float):ParticleEmitter;
	/**
		Gets the number of active (in-use) particles in this emitter.
	**/
	function getAliveParticleCount():Float;
	/**
		Gets the number of inactive (available) particles in this emitter.
	**/
	function getDeadParticleCount():Float;
	/**
		Gets the total number of particles in this emitter.
	**/
	function getParticleCount():Float;
	/**
		Whether this emitter is at its limit (if set).
	**/
	function atLimit():Bool;
	/**
		Sets a function to call for each newly emitted particle.
	**/
	function onParticleEmit(callback:global.phaser.types.gameobjects.particles.ParticleEmitterCallback, ?context:Dynamic):ParticleEmitter;
	/**
		Sets a function to call for each particle death.
	**/
	function onParticleDeath(callback:global.phaser.types.gameobjects.particles.ParticleDeathCallback, ?context:Dynamic):ParticleEmitter;
	/**
		Deactivates every particle in this emitter.
	**/
	function killAll():ParticleEmitter;
	/**
		Calls a function for each active particle in this emitter.
	**/
	function forEachAlive(callback:global.phaser.types.gameobjects.particles.ParticleEmitterCallback, context:Dynamic):ParticleEmitter;
	/**
		Calls a function for each inactive particle in this emitter.
	**/
	function forEachDead(callback:global.phaser.types.gameobjects.particles.ParticleEmitterCallback, context:Dynamic):ParticleEmitter;
	/**
		Turns {@link Phaser.GameObjects.Particles.ParticleEmitter#on} the emitter and resets the flow counter.
		
		If this emitter is in flow mode (frequency >= 0; the default), the particle flow will start (or restart).
		
		If this emitter is in explode mode (frequency = -1), nothing will happen.
		Use {@link Phaser.GameObjects.Particles.ParticleEmitter#explode} or {@link Phaser.GameObjects.Particles.ParticleEmitter#flow} instead.
	**/
	function start():ParticleEmitter;
	/**
		Turns {@link Phaser.GameObjects.Particles.ParticleEmitter#on off} the emitter.
	**/
	function stop():ParticleEmitter;
	/**
		{@link Phaser.GameObjects.Particles.ParticleEmitter#active Deactivates} the emitter.
	**/
	function pause():ParticleEmitter;
	/**
		{@link Phaser.GameObjects.Particles.ParticleEmitter#active Activates} the emitter.
	**/
	function resume():ParticleEmitter;
	/**
		Removes the emitter from its manager and the scene.
	**/
	function remove():ParticleEmitter;
	/**
		Sorts active particles with {@link Phaser.GameObjects.Particles.ParticleEmitter#depthSortCallback}.
	**/
	function depthSort():ParticleEmitter;
	/**
		Puts the emitter in flow mode (frequency >= 0) and starts (or restarts) a particle flow.
		
		To resume a flow at the current frequency and quantity, use {@link Phaser.GameObjects.Particles.ParticleEmitter#start} instead.
	**/
	function flow(frequency:Float, ?count:global.phaser.types.gameobjects.particles.EmitterOpOnEmitType):ParticleEmitter;
	/**
		Puts the emitter in explode mode (frequency = -1), stopping any current particle flow, and emits several particles all at once.
	**/
	function explode(count:Float, x:Float, y:Float):Particle;
	/**
		Emits particles at a given position (or the emitter's current position).
	**/
	function emitParticleAt(?x:Float, ?y:Float, ?count:Float):Particle;
	/**
		Emits particles at a given position (or the emitter's current position).
	**/
	function emitParticle(?count:Float, ?x:Float, ?y:Float):Particle;
	/**
		Updates this emitter and its particles.
	**/
	function preUpdate(time:Float, delta:Float):Void;
	/**
		Calculates the difference of two particles, for sorting them by depth.
	**/
	function depthSortCallback(a:Dynamic, b:Dynamic):Float;
	/**
		Sets the Blend Mode being used by this Game Object.
		
		This can be a const, such as `Phaser.BlendModes.SCREEN`, or an integer, such as 4 (for Overlay)
		
		Under WebGL only the following Blend Modes are available:
		
		* ADD
		* MULTIPLY
		* SCREEN
		* ERASE (only works when rendering to a framebuffer, like a Render Texture)
		
		Canvas has more available depending on browser support.
		
		You can also create your own custom Blend Modes in WebGL.
		
		Blend modes have different effects under Canvas and WebGL, and from browser to browser, depending
		on support. Blend Modes also cause a WebGL batch flush should it encounter a new blend mode. For these
		reasons try to be careful about the construction of your Scene and the frequency in which blend modes
		are used.
	**/
	function setBlendMode(value:ts.AnyOf2<String, global.phaser.BlendModes>):ParticleEmitter;
	/**
		The Mask this Game Object is using during render.
	**/
	var mask : ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>;
	/**
		Sets the mask that this Game Object will use to render with.
		
		The mask must have been previously created and can be either a GeometryMask or a BitmapMask.
		Note: Bitmap Masks only work on WebGL. Geometry Masks work on both WebGL and Canvas.
		
		If a mask is already set on this Game Object it will be immediately replaced.
		
		Masks are positioned in global space and are not relative to the Game Object to which they
		are applied. The reason for this is that multiple Game Objects can all share the same mask.
		
		Masks have no impact on physics or input detection. They are purely a rendering component
		that allows you to limit what is visible during the render pass.
	**/
	function setMask(mask:ts.AnyOf2<global.phaser.display.masks.BitmapMask, global.phaser.display.masks.GeometryMask>):ParticleEmitter;
	/**
		Clears the mask that this Game Object was using.
	**/
	function clearMask(?destroyMask:Bool):ParticleEmitter;
	/**
		Creates and returns a Bitmap Mask. This mask can be used by any Game Object,
		including this one.
		
		Note: Bitmap Masks only work on WebGL. Geometry Masks work on both WebGL and Canvas.
		
		To create the mask you need to pass in a reference to a renderable Game Object.
		A renderable Game Object is one that uses a texture to render with, such as an
		Image, Sprite, Render Texture or BitmapText.
		
		If you do not provide a renderable object, and this Game Object has a texture,
		it will use itself as the object. This means you can call this method to create
		a Bitmap Mask from any renderable Game Object.
	**/
	function createBitmapMask(?renderable:global.phaser.gameobjects.GameObject):global.phaser.display.masks.BitmapMask;
	/**
		Creates and returns a Geometry Mask. This mask can be used by any Game Object,
		including this one.
		
		To create the mask you need to pass in a reference to a Graphics Game Object.
		
		If you do not provide a graphics object, and this Game Object is an instance
		of a Graphics object, then it will use itself to create the mask.
		
		This means you can call this method to create a Geometry Mask from any Graphics Game Object.
	**/
	function createGeometryMask(?graphics:global.phaser.gameobjects.Graphics):global.phaser.display.masks.GeometryMask;
	/**
		The horizontal scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorX : Float;
	/**
		The vertical scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	var scrollFactorY : Float;
	/**
		Sets the scroll factor of this Game Object.
		
		The scroll factor controls the influence of the movement of a Camera upon this Game Object.
		
		When a camera scrolls it will change the location at which this Game Object is rendered on-screen.
		It does not change the Game Objects actual position values.
		
		A value of 1 means it will move exactly in sync with a camera.
		A value of 0 means it will not move at all, even if the camera moves.
		Other values control the degree to which the camera movement is mapped to this Game Object.
		
		Please be aware that scroll factor values other than 1 are not taken in to consideration when
		calculating physics collisions. Bodies always collide based on their world position, but changing
		the scroll factor is a visual adjustment to where the textures are rendered, which can offset
		them from physics bodies if not accounted for in your code.
	**/
	function setScrollFactor(x:Float, ?y:Float):ParticleEmitter;
	/**
		Sets the visibility of this Game Object.
		
		An invisible Game Object will skip rendering, but will still process update logic.
	**/
	function setVisible(value:Bool):ParticleEmitter;
	static var prototype : ParticleEmitter;
}