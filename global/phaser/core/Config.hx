package global.phaser.core;

/**
	The active game configuration settings, parsed from a {@link Phaser.Types.Core.GameConfig} object.
**/
@:native("Phaser.Core.Config") extern class Config {
	function new(?GameConfig:global.phaser.types.core.GameConfig);
	/**
		The width of the underlying canvas, in pixels.
	**/
	final width : ts.AnyOf2<String, Float>;
	/**
		The height of the underlying canvas, in pixels.
	**/
	final height : ts.AnyOf2<String, Float>;
	/**
		The zoom factor, as used by the Scale Manager.
	**/
	final zoom : ts.AnyOf2<Float, global.phaser.scale.Zoom>;
	/**
		The canvas device pixel resolution. Currently un-used.
	**/
	final resolution : Float;
	/**
		A parent DOM element into which the canvas created by the renderer will be injected.
	**/
	final parent : Dynamic;
	/**
		The scale mode as used by the Scale Manager. The default is zero, which is no scaling.
	**/
	final scaleMode : global.phaser.scale.ScaleModes;
	/**
		Is the Scale Manager allowed to adjust the CSS height property of the parent to be 100%?
	**/
	final expandParent : Bool;
	/**
		Automatically round the display and style sizes of the canvas. This can help with performance in lower-powered devices.
	**/
	final autoRound : Float;
	/**
		Automatically center the canvas within the parent?
	**/
	final autoCenter : global.phaser.scale.Center;
	/**
		How many ms should elapse before checking if the browser size has changed?
	**/
	final resizeInterval : Float;
	/**
		The DOM element that will be sent into full screen mode, or its `id`. If undefined Phaser will create its own div and insert the canvas into it when entering fullscreen mode.
	**/
	final fullscreenTarget : ts.AnyOf2<String, js.html.Element>;
	/**
		The minimum width, in pixels, the canvas will scale down to. A value of zero means no minimum.
	**/
	final minWidth : Float;
	/**
		The maximum width, in pixels, the canvas will scale up to. A value of zero means no maximum.
	**/
	final maxWidth : Float;
	/**
		The minimum height, in pixels, the canvas will scale down to. A value of zero means no minimum.
	**/
	final minHeight : Float;
	/**
		The maximum height, in pixels, the canvas will scale up to. A value of zero means no maximum.
	**/
	final maxHeight : Float;
	/**
		Force Phaser to use a specific renderer. Can be `CONST.CANVAS`, `CONST.WEBGL`, `CONST.HEADLESS` or `CONST.AUTO` (default)
	**/
	final renderType : Float;
	/**
		Force Phaser to use your own Canvas element instead of creating one.
	**/
	final canvas : js.html.CanvasElement;
	/**
		Force Phaser to use your own Canvas context instead of creating one.
	**/
	final context : ts.AnyOf2<js.html.CanvasRenderingContext2D, js.html.webgl.RenderingContext>;
	/**
		Optional CSS attributes to be set on the canvas object created by the renderer.
	**/
	final canvasStyle : String;
	/**
		Is Phaser running under a custom (non-native web) environment? If so, set this to `true` to skip internal Feature detection. If `true` the `renderType` cannot be left as `AUTO`.
	**/
	final customEnvironment : Bool;
	/**
		The default Scene configuration object.
	**/
	final sceneConfig : Dynamic;
	/**
		A seed which the Random Data Generator will use. If not given, a dynamic seed based on the time is used.
	**/
	final seed : Array<String>;
	/**
		The title of the game.
	**/
	final gameTitle : String;
	/**
		The URL of the game.
	**/
	final gameURL : String;
	/**
		The version of the game.
	**/
	final gameVersion : String;
	/**
		If `true` the window will automatically be given focus immediately and on any future mousedown event.
	**/
	final autoFocus : Bool;
	/**
		Should the game create a div element to act as a DOM Container? Only enable if you're using DOM Element objects. You must provide a parent object if you use this feature.
	**/
	final domCreateContainer : Bool;
	/**
		Should the DOM Container that is created (if `dom.createContainer` is true) be positioned behind (true) or over the top (false, the default) of the game canvas?
	**/
	final domBehindCanvas : Bool;
	/**
		Enable the Keyboard Plugin. This can be disabled in games that don't need keyboard input.
	**/
	final inputKeyboard : Bool;
	/**
		The DOM Target to listen for keyboard events on. Defaults to `window` if not specified.
	**/
	final inputKeyboardEventTarget : Dynamic;
	/**
		`preventDefault` will be called on every non-modified key which has a key code in this array. By default, it is empty.
	**/
	final inputKeyboardCapture : Array<Float>;
	/**
		Enable the Mouse Plugin. This can be disabled in games that don't need mouse input.
	**/
	final inputMouse : ts.AnyOf2<Bool, Dynamic>;
	/**
		The DOM Target to listen for mouse events on. Defaults to the game canvas if not specified.
	**/
	final inputMouseEventTarget : Dynamic;
	/**
		Should mouse events be captured? I.e. have prevent default called on them.
	**/
	final inputMouseCapture : Bool;
	/**
		Enable the Touch Plugin. This can be disabled in games that don't need touch input.
	**/
	final inputTouch : Bool;
	/**
		The DOM Target to listen for touch events on. Defaults to the game canvas if not specified.
	**/
	final inputTouchEventTarget : Dynamic;
	/**
		Should touch events be captured? I.e. have prevent default called on them.
	**/
	final inputTouchCapture : Bool;
	/**
		The number of Pointer objects created by default. In a mouse-only, or non-multi touch game, you can leave this as 1.
	**/
	final inputActivePointers : Float;
	/**
		The smoothing factor to apply during Pointer movement. See {@link Phaser.Input.Pointer#smoothFactor}.
	**/
	final inputSmoothFactor : Float;
	/**
		Should Phaser listen for input events on the Window? If you disable this, events like 'POINTER_UP_OUTSIDE' will no longer fire.
	**/
	final inputWindowEvents : Bool;
	/**
		Enable the Gamepad Plugin. This can be disabled in games that don't need gamepad input.
	**/
	final inputGamepad : Bool;
	/**
		The DOM Target to listen for gamepad events on. Defaults to `window` if not specified.
	**/
	final inputGamepadEventTarget : Dynamic;
	/**
		Set to `true` to disable the right-click context menu.
	**/
	final disableContextMenu : Bool;
	/**
		The Audio Configuration object.
	**/
	final audio : global.phaser.types.core.AudioConfig;
	/**
		Don't write the banner line to the console.log.
	**/
	final hideBanner : Bool;
	/**
		Omit Phaser's name and version from the banner.
	**/
	final hidePhaser : Bool;
	/**
		The color of the banner text.
	**/
	final bannerTextColor : String;
	/**
		The background colors of the banner.
	**/
	final bannerBackgroundColor : Array<String>;
	/**
		The Frame Rate Configuration object, as parsed by the Timestep class.
	**/
	final fps : global.phaser.types.core.FPSConfig;
	/**
		When set to `true`, WebGL uses linear interpolation to draw scaled or rotated textures, giving a smooth appearance. When set to `false`, WebGL uses nearest-neighbor interpolation, giving a crisper appearance. `false` also disables antialiasing of the game canvas itself, if the browser supports it, when the game canvas is scaled.
	**/
	final antialias : Bool;
	/**
		Sets the `antialias` property when the WebGL context is created. Setting this value does not impact any subsequent textures that are created, or the canvas style attributes.
	**/
	final antialiasGL : Bool;
	/**
		Sets the `mipmapFilter` property when the WebGL renderer is created.
	**/
	final mipmapFilter : String;
	/**
		When set to `true` it will create a desynchronized context for both 2D and WebGL. See https://developers.google.com/web/updates/2019/05/desynchronized for details.
	**/
	final desynchronized : Bool;
	/**
		Draw texture-based Game Objects at only whole-integer positions. Game Objects without textures, like Graphics, ignore this property.
	**/
	final roundPixels : Bool;
	/**
		Prevent pixel art from becoming blurred when scaled. It will remain crisp (tells the WebGL renderer to automatically create textures using a linear filter mode).
	**/
	final pixelArt : Bool;
	/**
		Whether the game canvas will have a transparent background.
	**/
	final transparent : Bool;
	/**
		Whether the game canvas will be cleared between each rendering frame. You can disable this if you have a full-screen background image or game object.
	**/
	final clearBeforeRender : Bool;
	/**
		In WebGL mode, sets the drawing buffer to contain colors with pre-multiplied alpha.
	**/
	final premultipliedAlpha : Bool;
	/**
		Let the browser abort creating a WebGL context if it judges performance would be unacceptable.
	**/
	final failIfMajorPerformanceCaveat : Bool;
	/**
		"high-performance", "low-power" or "default". A hint to the browser on how much device power the game might use.
	**/
	final powerPreference : String;
	/**
		The default WebGL Batch size.
	**/
	final batchSize : Float;
	/**
		The maximum number of lights allowed to be visible within range of a single Camera in the LightManager.
	**/
	final maxLights : Float;
	/**
		The background color of the game canvas. The default is black. This value is ignored if `transparent` is set to `true`.
	**/
	final backgroundColor : global.phaser.display.Color;
	/**
		Called before Phaser boots. Useful for initializing anything not related to Phaser that Phaser may require while booting.
	**/
	function preBoot(game:global.phaser.Game):Void;
	/**
		A function to run at the end of the boot sequence. At this point, all the game systems have started and plugins have been loaded.
	**/
	function postBoot(game:global.phaser.Game):Void;
	/**
		The Physics Configuration object.
	**/
	final physics : global.phaser.types.core.PhysicsConfig;
	/**
		The default physics system. It will be started for each scene. Either 'arcade', 'impact' or 'matter'.
	**/
	final defaultPhysicsSystem : ts.AnyOf2<String, Bool>;
	/**
		A URL used to resolve paths given to the loader. Example: 'http://labs.phaser.io/assets/'.
	**/
	final loaderBaseURL : String;
	/**
		A URL path used to resolve relative paths given to the loader. Example: 'images/sprites/'.
	**/
	final loaderPath : String;
	/**
		Maximum parallel downloads allowed for resources (Default to 32).
	**/
	final loaderMaxParallelDownloads : Float;
	/**
		'anonymous', 'use-credentials', or `undefined`. If you're not making cross-origin requests, leave this as `undefined`. See {@link https://developer.mozilla.org/en-US/docs/Web/HTML/CORS_settings_attributes}.
	**/
	final loaderCrossOrigin : Null<String>;
	/**
		The response type of the XHR request, e.g. `blob`, `text`, etc.
	**/
	final loaderResponseType : String;
	/**
		Should the XHR request use async or not?
	**/
	final loaderAsync : Bool;
	/**
		Optional username for all XHR requests.
	**/
	final loaderUser : String;
	/**
		Optional password for all XHR requests.
	**/
	final loaderPassword : String;
	/**
		Optional XHR timeout value, in ms.
	**/
	final loaderTimeout : Float;
	/**
		Optional XHR withCredentials value.
	**/
	final loaderWithCredentials : Bool;
	/**
		An array of global plugins to be installed.
	**/
	final installGlobalPlugins : Dynamic;
	/**
		An array of Scene level plugins to be installed.
	**/
	final installScenePlugins : Dynamic;
	/**
		The plugins installed into every Scene (in addition to CoreScene and Global).
	**/
	final defaultPlugins : Dynamic;
	/**
		A base64 encoded PNG that will be used as the default blank texture.
	**/
	final defaultImage : String;
	/**
		A base64 encoded PNG that will be used as the default texture when a texture is assigned that is missing or not loaded.
	**/
	final missingImage : String;
	static var prototype : Config;
}