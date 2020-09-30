package global.phaser;

/**
	The Phaser.Game instance is the main controller for the entire Phaser game. It is responsible
	for handling the boot process, parsing the configuration values, creating the renderer,
	and setting-up all of the global Phaser systems, such as sound and input.
	Once that is complete it will start the Scene Manager and then begin the main game loop.
	
	You should generally avoid accessing any of the systems created by Game, and instead use those
	made available to you via the Phaser.Scene Systems class instead.
**/
@:native("Phaser.Game") extern class Game {
	function new(?GameConfig:global.phaser.types.core.GameConfig);
	/**
		The parsed Game Configuration object.
		
		The values stored within this object are read-only and should not be changed at run-time.
	**/
	final config : global.phaser.core.Config;
	/**
		A reference to either the Canvas or WebGL Renderer that this Game is using.
	**/
	var renderer : ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>;
	/**
		A reference to an HTML Div Element used as the DOM Element Container.
		
		Only set if `createDOMContainer` is `true` in the game config (by default it is `false`) and
		if you provide a parent element to insert the Phaser Game inside.
		
		See the DOM Element Game Object for more details.
	**/
	var domContainer : js.html.DivElement;
	/**
		A reference to the HTML Canvas Element that Phaser uses to render the game.
		This is created automatically by Phaser unless you provide a `canvas` property
		in your Game Config.
	**/
	var canvas : js.html.CanvasElement;
	/**
		A reference to the Rendering Context belonging to the Canvas Element this game is rendering to.
		If the game is running under Canvas it will be a 2d Canvas Rendering Context.
		If the game is running under WebGL it will be a WebGL Rendering Context.
		This context is created automatically by Phaser unless you provide a `context` property
		in your Game Config.
	**/
	var context : ts.AnyOf2<js.html.CanvasRenderingContext2D, js.html.webgl.RenderingContext>;
	/**
		A flag indicating when this Game instance has finished its boot process.
	**/
	final isBooted : Bool;
	/**
		A flag indicating if this Game is currently running its game step or not.
	**/
	final isRunning : Bool;
	/**
		An Event Emitter which is used to broadcast game-level events from the global systems.
	**/
	var events : global.phaser.events.EventEmitter;
	/**
		An instance of the Animation Manager.
		
		The Animation Manager is a global system responsible for managing all animations used within your game.
	**/
	var anims : global.phaser.animations.AnimationManager;
	/**
		An instance of the Texture Manager.
		
		The Texture Manager is a global system responsible for managing all textures being used by your game.
	**/
	var textures : global.phaser.textures.TextureManager;
	/**
		An instance of the Cache Manager.
		
		The Cache Manager is a global system responsible for caching, accessing and releasing external game assets.
	**/
	var cache : global.phaser.cache.CacheManager;
	/**
		An instance of the Data Manager
	**/
	var registry : global.phaser.data.DataManager;
	/**
		An instance of the Input Manager.
		
		The Input Manager is a global system responsible for the capture of browser-level input events.
	**/
	var input : global.phaser.input.InputManager;
	/**
		An instance of the Scene Manager.
		
		The Scene Manager is a global system responsible for creating, modifying and updating the Scenes in your game.
	**/
	var scene : global.phaser.scenes.SceneManager;
	/**
		A reference to the Device inspector.
		
		Contains information about the device running this game, such as OS, browser vendor and feature support.
		Used by various systems to determine capabilities and code paths.
	**/
	var device : DeviceConf;
	/**
		An instance of the Scale Manager.
		
		The Scale Manager is a global system responsible for handling scaling of the game canvas.
	**/
	var scale : global.phaser.scale.ScaleManager;
	/**
		An instance of the base Sound Manager.
		
		The Sound Manager is a global system responsible for the playback and updating of all audio in your game.
		
		You can disable the inclusion of the Sound Manager in your build by toggling the webpack `FEATURE_SOUND` flag.
	**/
	var sound : ts.AnyOf3<global.phaser.sound.NoAudioSoundManager, global.phaser.sound.HTML5AudioSoundManager, global.phaser.sound.WebAudioSoundManager>;
	/**
		An instance of the Time Step.
		
		The Time Step is a global system responsible for setting-up and responding to the browser frame events, processing
		them and calculating delta values. It then automatically calls the game step.
	**/
	var loop : global.phaser.core.TimeStep;
	/**
		An instance of the Plugin Manager.
		
		The Plugin Manager is a global system that allows plugins to register themselves with it, and can then install
		those plugins into Scenes as required.
	**/
	var plugins : global.phaser.plugins.PluginManager;
	/**
		An instance of the Facebook Instant Games Plugin.
		
		This will only be available if the plugin has been built into Phaser,
		or you're using the special Facebook Instant Games custom build.
	**/
	var facebook : FacebookInstantGamesPlugin;
	/**
		Does the window the game is running in currently have focus or not?
		This is modified by the VisibilityHandler.
	**/
	final hasFocus : Bool;
	/**
		This method is called automatically when the DOM is ready. It is responsible for creating the renderer,
		displaying the Debug Header, adding the game canvas to the DOM and emitting the 'boot' event.
		It listens for a 'ready' event from the base systems and once received it will call `Game.start`.
	**/
	private function boot():Void;
	/**
		Called automatically by Game.boot once all of the global systems have finished setting themselves up.
		By this point the Game is now ready to start the main loop running.
		It will also enable the Visibility Handler.
	**/
	private function start():Void;
	/**
		The main Game Step. Called automatically by the Time Step, once per browser frame (typically as a result of
		Request Animation Frame, or Set Timeout on very old browsers.)
		
		The step will update the global managers first, then proceed to update each Scene in turn, via the Scene Manager.
		
		It will then render each Scene in turn, via the Renderer. This process emits `prerender` and `postrender` events.
	**/
	function step(time:Float, delta:Float):Void;
	/**
		A special version of the Game Step for the HEADLESS renderer only.
		
		The main Game Step. Called automatically by the Time Step, once per browser frame (typically as a result of
		Request Animation Frame, or Set Timeout on very old browsers.)
		
		The step will update the global managers first, then proceed to update each Scene in turn, via the Scene Manager.
		
		This process emits `prerender` and `postrender` events, even though nothing actually displays.
	**/
	function headlessStep(time:Float, delta:Float):Void;
	/**
		Called automatically by the Visibility Handler.
		This will pause the main loop and then emit a pause event.
	**/
	private function onHidden():Void;
	/**
		Called automatically by the Visibility Handler.
		This will resume the main loop and then emit a resume event.
	**/
	private function onVisible():Void;
	/**
		Called automatically by the Visibility Handler.
		This will set the main loop into a 'blurred' state, which pauses it.
	**/
	private function onBlur():Void;
	/**
		Called automatically by the Visibility Handler.
		This will set the main loop into a 'focused' state, which resumes it.
	**/
	private function onFocus():Void;
	/**
		Returns the current game frame.
		
		When the game starts running, the frame is incremented every time Request Animation Frame, or Set Timeout, fires.
	**/
	function getFrame():Float;
	/**
		Returns the time that the current game step started at, as based on `performance.now`.
	**/
	function getTime():Float;
	/**
		Flags this Game instance as needing to be destroyed on the _next frame_, making this an asynchronous operation.
		
		It will wait until the current frame has completed and then call `runDestroy` internally.
		
		If you need to react to the games eventual destruction, listen for the `DESTROY` event.
		
		If you **do not** need to run Phaser again on the same web page you can set the `noReturn` argument to `true` and it will free-up
		memory being held by the core Phaser plugins. If you do need to create another game instance on the same page, leave this as `false`.
	**/
	function destroy(removeCanvas:Bool, ?noReturn:Bool):Void;
	static var prototype : Game;
}