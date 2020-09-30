package global.phaser.scenes;

/**
	The Scene Systems class.
	
	This class is available from within a Scene under the property `sys`.
	It is responsible for managing all of the plugins a Scene has running, including the display list, and
	handling the update step and renderer. It also contains references to global systems belonging to Game.
**/
@:native("Phaser.Scenes.Systems") extern class Systems {
	function new(scene:global.phaser.Scene, config:ts.AnyOf2<String, global.phaser.types.scenes.SettingsConfig>);
	/**
		A reference to the Scene that these Systems belong to.
	**/
	var scene : global.phaser.Scene;
	/**
		A reference to the Phaser Game instance.
	**/
	var game : global.phaser.Game;
	/**
		A reference to either the Canvas or WebGL Renderer that this Game is using.
	**/
	var renderer : ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>;
	/**
		The Facebook Instant Games Plugin.
	**/
	var facebook : global.phaser.FacebookInstantGamesPlugin;
	/**
		The Scene Configuration object, as passed in when creating the Scene.
	**/
	var config : ts.AnyOf2<String, global.phaser.types.scenes.SettingsConfig>;
	/**
		The Scene Settings. This is the parsed output based on the Scene configuration.
	**/
	var settings : global.phaser.types.scenes.SettingsObject;
	/**
		A handy reference to the Scene canvas / context.
	**/
	var canvas : js.html.CanvasElement;
	/**
		A reference to the Canvas Rendering Context being used by the renderer.
	**/
	var context : js.html.CanvasRenderingContext2D;
	/**
		A reference to the global Animations Manager.
		
		In the default set-up you can access this from within a Scene via the `this.anims` property.
	**/
	var anims : global.phaser.animations.AnimationManager;
	/**
		A reference to the global Cache. The Cache stores all files bought in to Phaser via
		the Loader, with the exception of images. Images are stored in the Texture Manager.
		
		In the default set-up you can access this from within a Scene via the `this.cache` property.
	**/
	var cache : global.phaser.cache.CacheManager;
	/**
		A reference to the global Plugins Manager.
		
		In the default set-up you can access this from within a Scene via the `this.plugins` property.
	**/
	var plugins : global.phaser.plugins.PluginManager;
	/**
		A reference to the global registry. This is a game-wide instance of the Data Manager, allowing
		you to exchange data between Scenes via a universal and shared point.
		
		In the default set-up you can access this from within a Scene via the `this.registry` property.
	**/
	var registry : global.phaser.data.DataManager;
	/**
		A reference to the global Scale Manager.
		
		In the default set-up you can access this from within a Scene via the `this.scale` property.
	**/
	var scale : global.phaser.scale.ScaleManager;
	/**
		A reference to the global Sound Manager.
		
		In the default set-up you can access this from within a Scene via the `this.sound` property.
	**/
	var sound : ts.AnyOf3<global.phaser.sound.NoAudioSoundManager, global.phaser.sound.HTML5AudioSoundManager, global.phaser.sound.WebAudioSoundManager>;
	/**
		A reference to the global Texture Manager.
		
		In the default set-up you can access this from within a Scene via the `this.textures` property.
	**/
	var textures : global.phaser.textures.TextureManager;
	/**
		A reference to the Scene's Game Object Factory.
		
		Use this to quickly and easily create new Game Object's.
		
		In the default set-up you can access this from within a Scene via the `this.add` property.
	**/
	var add : global.phaser.gameobjects.GameObjectFactory;
	/**
		A reference to the Scene's Camera Manager.
		
		Use this to manipulate and create Cameras for this specific Scene.
		
		In the default set-up you can access this from within a Scene via the `this.cameras` property.
	**/
	var cameras : global.phaser.cameras.scene2d.CameraManager;
	/**
		A reference to the Scene's Display List.
		
		Use this to organize the children contained in the display list.
		
		In the default set-up you can access this from within a Scene via the `this.children` property.
	**/
	var displayList : global.phaser.gameobjects.DisplayList;
	/**
		A reference to the Scene's Event Manager.
		
		Use this to listen for Scene specific events, such as `pause` and `shutdown`.
		
		In the default set-up you can access this from within a Scene via the `this.events` property.
	**/
	var events : global.phaser.events.EventEmitter;
	/**
		A reference to the Scene's Game Object Creator.
		
		Use this to quickly and easily create new Game Object's. The difference between this and the
		Game Object Factory, is that the Creator just creates and returns Game Object instances, it
		doesn't then add them to the Display List or Update List.
		
		In the default set-up you can access this from within a Scene via the `this.make` property.
	**/
	var make : global.phaser.gameobjects.GameObjectCreator;
	/**
		A reference to the Scene Manager Plugin.
		
		Use this to manipulate both this and other Scene's in your game, for example to launch a parallel Scene,
		or pause or resume a Scene, or switch from this Scene to another.
		
		In the default set-up you can access this from within a Scene via the `this.scene` property.
	**/
	var scenePlugin : ScenePlugin;
	/**
		A reference to the Scene's Update List.
		
		Use this to organize the children contained in the update list.
		
		The Update List is responsible for managing children that need their `preUpdate` methods called,
		in order to process so internal components, such as Sprites with Animations.
		
		In the default set-up there is no reference to this from within the Scene itself.
	**/
	var updateList : global.phaser.gameobjects.UpdateList;
	/**
		This method is called only once by the Scene Manager when the Scene is instantiated.
		It is responsible for setting up all of the Scene plugins and references.
		It should never be called directly.
	**/
	private function init(game:global.phaser.Game):Void;
	/**
		A single game step. Called automatically by the Scene Manager as a result of a Request Animation
		Frame or Set Timeout call to the main Game instance.
	**/
	function step(time:Float, delta:Float):Void;
	/**
		Called automatically by the Scene Manager.
		Instructs the Scene to render itself via its Camera Manager to the renderer given.
	**/
	function render(renderer:ts.AnyOf2<global.phaser.renderer.canvas.CanvasRenderer, global.phaser.renderer.webgl.WebGLRenderer>):Void;
	/**
		Force a sort of the display list on the next render.
	**/
	function queueDepthSort():Void;
	/**
		Immediately sorts the display list if the flag is set.
	**/
	function depthSort():Void;
	/**
		Pause this Scene.
		A paused Scene still renders, it just doesn't run ANY of its update handlers or systems.
	**/
	function pause(?data:Dynamic):Systems;
	/**
		Resume this Scene from a paused state.
	**/
	function resume(?data:Dynamic):Systems;
	/**
		Send this Scene to sleep.
		
		A sleeping Scene doesn't run its update step or render anything, but it also isn't shut down
		or has any of its systems or children removed, meaning it can be re-activated at any point and
		will carry on from where it left off. It also keeps everything in memory and events and callbacks
		from other Scenes may still invoke changes within it, so be careful what is left active.
	**/
	function sleep(?data:Dynamic):Systems;
	/**
		Wake-up this Scene if it was previously asleep.
	**/
	function wake(?data:Dynamic):Systems;
	/**
		Returns any data that was sent to this Scene by another Scene.
		
		The data is also passed to `Scene.init` and in various Scene events, but
		you can access it at any point via this method.
	**/
	function getData():Dynamic;
	/**
		Is this Scene sleeping?
	**/
	function isSleeping():Bool;
	/**
		Is this Scene running?
	**/
	function isActive():Bool;
	/**
		Is this Scene paused?
	**/
	function isPaused():Bool;
	/**
		Is this Scene currently transitioning out to, or in from another Scene?
	**/
	function isTransitioning():Bool;
	/**
		Is this Scene currently transitioning out from itself to another Scene?
	**/
	function isTransitionOut():Bool;
	/**
		Is this Scene currently transitioning in from another Scene?
	**/
	function isTransitionIn():Bool;
	/**
		Is this Scene visible and rendering?
	**/
	function isVisible():Bool;
	/**
		Sets the visible state of this Scene.
		An invisible Scene will not render, but will still process updates.
	**/
	function setVisible(value:Bool):Systems;
	/**
		Set the active state of this Scene.
		
		An active Scene will run its core update loop.
	**/
	function setActive(value:Bool, ?data:Dynamic):Systems;
	/**
		Start this Scene running and rendering.
		Called automatically by the SceneManager.
	**/
	function start(data:Dynamic):Void;
	/**
		Shutdown this Scene and send a shutdown event to all of its systems.
		A Scene that has been shutdown will not run its update loop or render, but it does
		not destroy any of its plugins or references. It is put into hibernation for later use.
		If you don't ever plan to use this Scene again, then it should be destroyed instead
		to free-up resources.
	**/
	function shutdown(?data:Dynamic):Void;
	static var prototype : Systems;
}