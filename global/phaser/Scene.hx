package global.phaser;

/**
	A base Phaser.Scene class which can be extended for your own use.
	
	You can also define the optional methods {@link Phaser.Types.Scenes.SceneInitCallback init()}, {@link Phaser.Types.Scenes.ScenePreloadCallback preload()}, and {@link Phaser.Types.Scenes.SceneCreateCallback create()}.
**/
@:native("Phaser.Scene") extern class Scene {
	function new(config:ts.AnyOf2<String, global.phaser.types.scenes.SettingsConfig>);
	/**
		The Scene Systems. You must never overwrite this property, or all hell will break lose.
	**/
	var sys : global.phaser.scenes.Systems;
	/**
		A reference to the Phaser.Game instance.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var game : Game;
	/**
		A reference to the global Animation Manager.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var anims : global.phaser.animations.AnimationManager;
	/**
		A reference to the global Cache.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var cache : global.phaser.cache.CacheManager;
	/**
		A reference to the game level Data Manager.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var registry : global.phaser.data.DataManager;
	/**
		A reference to the Sound Manager.
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var sound : global.phaser.sound.BaseSoundManager;
	/**
		A reference to the Texture Manager.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var textures : global.phaser.textures.TextureManager;
	/**
		A scene level Event Emitter.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var events : global.phaser.events.EventEmitter;
	/**
		A scene level Camera System.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var cameras : global.phaser.cameras.scene2d.CameraManager;
	/**
		A scene level Game Object Factory.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var add : global.phaser.gameobjects.GameObjectFactory;
	/**
		A scene level Game Object Creator.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var make : global.phaser.gameobjects.GameObjectCreator;
	/**
		A reference to the Scene Manager Plugin.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var scene : global.phaser.scenes.ScenePlugin;
	/**
		A scene level Game Object Display List.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var children : global.phaser.gameobjects.DisplayList;
	/**
		A scene level Lights Manager Plugin.
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var lights : global.phaser.gameobjects.LightsManager;
	/**
		A scene level Data Manager Plugin.
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var data : global.phaser.data.DataManager;
	/**
		A scene level Input Manager Plugin.
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var input : global.phaser.input.InputPlugin;
	/**
		A scene level Loader Plugin.
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var load : global.phaser.loader.LoaderPlugin;
	/**
		A scene level Time and Clock Plugin.
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var time : global.phaser.time.Clock;
	/**
		A scene level Tween Manager Plugin.
		This property will only be available if defined in the Scene Injection Map and the plugin is installed.
	**/
	var tweens : global.phaser.tweens.TweenManager;
	/**
		A scene level Arcade Physics Plugin.
		This property will only be available if defined in the Scene Injection Map, the plugin is installed and configured.
	**/
	var physics : global.phaser.physics.arcade.ArcadePhysics;
	/**
		A scene level Matter Physics Plugin.
		This property will only be available if defined in the Scene Injection Map, the plugin is installed and configured.
	**/
	var matter : global.phaser.physics.matter.MatterPhysics;
	/**
		A scene level Facebook Instant Games Plugin.
		This property will only be available if defined in the Scene Injection Map, the plugin is installed and configured.
	**/
	var facebook : FacebookInstantGamesPlugin;
	/**
		A reference to the global Scale Manager.
		This property will only be available if defined in the Scene Injection Map.
	**/
	var scale : global.phaser.scale.ScaleManager;
	/**
		A reference to the Plugin Manager.
		
		The Plugin Manager is a global system that allows plugins to register themselves with it, and can then install
		those plugins into Scenes as required.
	**/
	var plugins : global.phaser.plugins.PluginManager;
	/**
		Should be overridden by your own Scenes.
		This method is called once per game step while the scene is running.
	**/
	function update(time:Float, delta:Float):Void;
	static var prototype : Scene;
}