package global.phaser.types.core;

typedef ScaleConfig = {
	/**
		The base width of your game. Can be an integer or a string: '100%'. If a string it will only work if you have set a parent element that has a size.
	**/
	@:optional
	var width : ts.AnyOf2<String, Float>;
	/**
		The base height of your game. Can be an integer or a string: '100%'. If a string it will only work if you have set a parent element that has a size.
	**/
	@:optional
	var height : ts.AnyOf2<String, Float>;
	/**
		The zoom value of the game canvas.
	**/
	@:optional
	var zoom : ts.AnyOf2<Float, global.phaser.scale.Zoom>;
	/**
		The rendering resolution of the canvas. This is reserved for future use and is currently ignored.
	**/
	@:optional
	var resolution : Float;
	/**
		The DOM element that will contain the game canvas, or its `id`. If undefined, or if the named element doesn't exist, the game canvas is inserted directly into the document body. If `null` no parent will be used and you are responsible for adding the canvas to your environment.
	**/
	@:optional
	var parent : ts.AnyOf2<String, js.html.Element>;
	/**
		Is the Scale Manager allowed to adjust the CSS height property of the parent and/or document body to be 100%?
	**/
	@:optional
	var expandParent : Bool;
	/**
		The scale mode.
	**/
	@:optional
	var mode : global.phaser.scale.ScaleModes;
	/**
		The minimum width and height the canvas can be scaled down to.
	**/
	@:optional
	var min : WidthHeight;
	/**
		The maximum width the canvas can be scaled up to.
	**/
	@:optional
	var max : WidthHeight;
	/**
		Automatically round the display and style sizes of the canvas. This can help with performance in lower-powered devices.
	**/
	@:optional
	var autoRound : Bool;
	/**
		Automatically center the canvas within the parent?
	**/
	@:optional
	var autoCenter : global.phaser.scale.Center;
	/**
		How many ms should elapse before checking if the browser size has changed?
	**/
	@:optional
	var resizeInterval : Float;
	/**
		The DOM element that will be sent into full screen mode, or its `id`. If undefined Phaser will create its own div and insert the canvas into it when entering fullscreen mode.
	**/
	@:optional
	var fullscreenTarget : ts.AnyOf2<String, js.html.Element>;
};