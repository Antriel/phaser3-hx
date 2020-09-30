package global.phaser.display.canvas;

@:native("Phaser.Display.Canvas.CanvasInterpolation") @valueModuleOnly extern class CanvasInterpolation {
	/**
		Sets the CSS image-rendering property on the given canvas to be 'crisp' (aka 'optimize contrast' on webkit).
	**/
	static function setCrisp(canvas:js.html.CanvasElement):js.html.CanvasElement;
	/**
		Sets the CSS image-rendering property on the given canvas to be 'bicubic' (aka 'auto').
	**/
	static function setBicubic(canvas:js.html.CanvasElement):js.html.CanvasElement;
}