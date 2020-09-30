package global.phaser.renderer;

@:native("Phaser.Renderer.Snapshot") @valueModuleOnly extern class Snapshot {
	/**
		Takes a snapshot of an area from the current frame displayed by a canvas.
		
		This is then copied to an Image object. When this loads, the results are sent
		to the callback provided in the Snapshot Configuration object.
	**/
	static function Canvas(sourceCanvas:js.html.CanvasElement, config:global.phaser.types.renderer.snapshot.SnapshotState):Void;
	/**
		Takes a snapshot of an area from the current frame displayed by a WebGL canvas.
		
		This is then copied to an Image object. When this loads, the results are sent
		to the callback provided in the Snapshot Configuration object.
	**/
	static function WebGL(sourceCanvas:js.html.CanvasElement, config:global.phaser.types.renderer.snapshot.SnapshotState):Void;
}