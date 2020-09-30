package global.phaser.display.canvas;

@:native("Phaser.Display.Canvas.Smoothing") @valueModuleOnly extern class Smoothing {
	/**
		Gets the Smoothing Enabled vendor prefix being used on the given context, or null if not set.
	**/
	static function getPrefix(context:ts.AnyOf2<js.html.CanvasRenderingContext2D, js.html.webgl.RenderingContext>):String;
	/**
		Sets the Image Smoothing property on the given context. Set to false to disable image smoothing.
		By default browsers have image smoothing enabled, which isn't always what you visually want, especially
		when using pixel art in a game. Note that this sets the property on the context itself, so that any image
		drawn to the context will be affected. This sets the property across all current browsers but support is
		patchy on earlier browsers, especially on mobile.
	**/
	static function enable(context:ts.AnyOf2<js.html.CanvasRenderingContext2D, js.html.webgl.RenderingContext>):ts.AnyOf2<js.html.CanvasRenderingContext2D, js.html.webgl.RenderingContext>;
	/**
		Sets the Image Smoothing property on the given context. Set to false to disable image smoothing.
		By default browsers have image smoothing enabled, which isn't always what you visually want, especially
		when using pixel art in a game. Note that this sets the property on the context itself, so that any image
		drawn to the context will be affected. This sets the property across all current browsers but support is
		patchy on earlier browsers, especially on mobile.
	**/
	static function disable(context:ts.AnyOf2<js.html.CanvasRenderingContext2D, js.html.webgl.RenderingContext>):ts.AnyOf2<js.html.CanvasRenderingContext2D, js.html.webgl.RenderingContext>;
	/**
		Returns `true` if the given context has image smoothing enabled, otherwise returns `false`.
		Returns null if no smoothing prefix is available.
	**/
	static function isEnabled(context:ts.AnyOf2<js.html.CanvasRenderingContext2D, js.html.webgl.RenderingContext>):Bool;
}