package global.phaser.display;

@:native("Phaser.Display.Canvas") @valueModuleOnly extern class Canvas {
	/**
		Sets the touch-action property on the canvas style. Can be used to disable default browser touch actions.
	**/
	static function TouchAction(canvas:js.html.CanvasElement, ?value:String):js.html.CanvasElement;
	/**
		Sets the user-select property on the canvas style. Can be used to disable default browser selection actions.
	**/
	static function UserSelect(canvas:js.html.CanvasElement, ?value:String):js.html.CanvasElement;
}