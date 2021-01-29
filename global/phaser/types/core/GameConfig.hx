package global.phaser.types.core;

typedef GameConfig = {
	/**
		The width of the game, in game pixels.
	**/
	@:optional
	var width : ts.AnyOf2<String, Float>;
	/**
		The height of the game, in game pixels.
	**/
	@:optional
	var height : ts.AnyOf2<String, Float>;
	/**
		Simple scale applied to the game canvas. 2 is double size, 0.5 is half size, etc.
	**/
	@:optional
	var zoom : Float;
	/**
		Which renderer to use. Phaser.AUTO, Phaser.CANVAS, Phaser.HEADLESS, or Phaser.WEBGL. AUTO picks WEBGL if available, otherwise CANVAS.
	**/
	@:optional
	var type : Float;
	/**
		The DOM element that will contain the game canvas, or its `id`. If undefined, or if the named element doesn't exist, the game canvas is appended to the document body. If `null` no parent will be used and you are responsible for adding the canvas to the dom.
	**/
	@:optional
	var parent : ts.AnyOf2<String, js.html.Element>;
	/**
		Provide your own Canvas element for Phaser to use instead of creating one.
	**/
	@:optional
	var canvas : js.html.CanvasElement;
	/**
		CSS styles to apply to the game canvas instead of Phasers default styles.
	**/
	@:optional
	var canvasStyle : String;
	/**
		Is Phaser running under a custom (non-native web) environment? If so, set this to `true` to skip internal Feature detection. If `true` the `renderType` cannot be left as `AUTO`.
	**/
	@:optional
	var customEnvironment : Bool;
	/**
		Provide your own Canvas Context for Phaser to use, instead of creating one.
	**/
	@:optional
	var context : js.html.CanvasRenderingContext2D;
	/**
		A scene or scenes to add to the game. If several are given, the first is started; the remainder are started only if they have `{ active: true }`. See the `sceneConfig` argument in `Phaser.Scenes.SceneManager#add`.
	**/
	@:optional
	var scene : ts.AnyOf8<haxe.Constraints.Function, Array<haxe.Constraints.Function>, global.phaser.Scene, Array<global.phaser.Scene>, global.phaser.types.scenes.SettingsConfig, Array<global.phaser.types.scenes.SettingsConfig>, global.phaser.types.scenes.CreateSceneFromObjectConfig, Array<global.phaser.types.scenes.CreateSceneFromObjectConfig>>;
	/**
		Seed for the random number generator.
	**/
	@:optional
	var seed : Array<String>;
	/**
		The title of the game. Shown in the browser console.
	**/
	@:optional
	var title : String;
	/**
		The URL of the game. Shown in the browser console.
	**/
	@:optional
	var url : String;
	/**
		The version of the game. Shown in the browser console.
	**/
	@:optional
	var version : String;
	/**
		Automatically call window.focus() when the game boots. Usually necessary to capture input events if the game is in a separate frame.
	**/
	@:optional
	var autoFocus : Bool;
	/**
		Input configuration, or `false` to disable all game input.
	**/
	@:optional
	var input : ts.AnyOf2<Bool, InputConfig>;
	/**
		Disable the browser's default 'contextmenu' event (usually triggered by a right-button mouse click).
	**/
	@:optional
	var disableContextMenu : Bool;
	/**
		Whether the game canvas will have a transparent background.
	**/
	@:optional
	var transparent : Bool;
	/**
		Configuration for the banner printed in the browser console when the game starts.
	**/
	@:optional
	var banner : ts.AnyOf2<Bool, BannerConfig>;
	/**
		The DOM Container configuration object.
	**/
	@:optional
	var dom : DOMContainerConfig;
	/**
		Game loop configuration.
	**/
	@:optional
	var fps : FPSConfig;
	/**
		Game renderer configuration.
	**/
	@:optional
	var render : RenderConfig;
	/**
		The background color of the game canvas. The default is black.
	**/
	@:optional
	var backgroundColor : ts.AnyOf2<String, Float>;
	/**
		Optional callbacks to run before or after game boot.
	**/
	@:optional
	var callbacks : CallbacksConfig;
	/**
		Loader configuration.
	**/
	@:optional
	var loader : LoaderConfig;
	/**
		Images configuration.
	**/
	@:optional
	var images : ImagesConfig;
	/**
		Physics configuration.
	**/
	@:optional
	var physics : PhysicsConfig;
	/**
		Plugins to install.
	**/
	@:optional
	var plugins : ts.AnyOf2<PluginObject, Array<PluginObjectItem>>;
	/**
		The Scale Manager configuration.
	**/
	@:optional
	var scale : ScaleConfig;
	/**
		The Audio Configuration object.
	**/
	@:optional
	var audio : AudioConfig;
	/**
		A WebGL Pipeline configuration object. Can also be part of the `RenderConfig`.
	**/
	@:optional
	var pipeline : PipelineConfig;
};