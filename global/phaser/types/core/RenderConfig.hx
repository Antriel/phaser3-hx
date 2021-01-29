package global.phaser.types.core;

typedef RenderConfig = {
	/**
		When set to `true`, WebGL uses linear interpolation to draw scaled or rotated textures, giving a smooth appearance. When set to `false`, WebGL uses nearest-neighbor interpolation, giving a crisper appearance. `false` also disables antialiasing of the game canvas itself, if the browser supports it, when the game canvas is scaled.
	**/
	@:optional
	var antialias : Bool;
	/**
		Sets the `antialias` property when the WebGL context is created. Setting this value does not impact any subsequent textures that are created, or the canvas style attributes.
	**/
	@:optional
	var antialiasGL : Bool;
	/**
		When set to `true` it will create a desynchronized context for both 2D and WebGL. See https://developers.google.com/web/updates/2019/05/desynchronized for details.
	**/
	@:optional
	var desynchronized : Bool;
	/**
		Sets `antialias` to false and `roundPixels` to true. This is the best setting for pixel-art games.
	**/
	@:optional
	var pixelArt : Bool;
	/**
		Draw texture-based Game Objects at only whole-integer positions. Game Objects without textures, like Graphics, ignore this property.
	**/
	@:optional
	var roundPixels : Bool;
	/**
		Whether the game canvas will be transparent. Boolean that indicates if the canvas contains an alpha channel. If set to false, the browser now knows that the backdrop is always opaque, which can speed up drawing of transparent content and images.
	**/
	@:optional
	var transparent : Bool;
	/**
		Whether the game canvas will be cleared between each rendering frame.
	**/
	@:optional
	var clearBeforeRender : Bool;
	/**
		In WebGL mode, the drawing buffer contains colors with pre-multiplied alpha.
	**/
	@:optional
	var premultipliedAlpha : Bool;
	/**
		Let the browser abort creating a WebGL context if it judges performance would be unacceptable.
	**/
	@:optional
	var failIfMajorPerformanceCaveat : Bool;
	/**
		"high-performance", "low-power" or "default". A hint to the browser on how much device power the game might use.
	**/
	@:optional
	var powerPreference : String;
	/**
		The default WebGL batch size. Represents the number of _quads_ that can be added to a single batch.
	**/
	@:optional
	var batchSize : Float;
	/**
		The maximum number of lights allowed to be visible within range of a single Camera in the LightManager.
	**/
	@:optional
	var maxLights : Float;
	/**
		When in WebGL mode, this sets the maximum number of GPU Textures to use. The default, -1, will use all available units. The WebGL1 spec says all browsers should provide a minimum of 8.
	**/
	@:optional
	var maxTextures : Float;
	/**
		The mipmap magFilter to be used when creating WebGL textures.
	**/
	@:optional
	var mipmapFilter : String;
	/**
		The WebGL Pipeline configuration object.
	**/
	@:optional
	var pipline : PipelineConfig;
};