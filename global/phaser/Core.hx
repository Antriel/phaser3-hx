package global.phaser;

@:native("Phaser.Core") @valueModuleOnly extern class Core {
	/**
		Called automatically by Phaser.Game and responsible for creating the renderer it will use.
		
		Relies upon two webpack global flags to be defined: `WEBGL_RENDERER` and `CANVAS_RENDERER` during build time, but not at run-time.
	**/
	static function CreateRenderer(game:Game):Void;
	/**
		Called automatically by Phaser.Game and responsible for creating the console.log debug header.
		
		You can customize or disable the header via the Game Config object.
	**/
	static function DebugHeader(game:Game):Void;
	/**
		The Visibility Handler is responsible for listening out for document level visibility change events.
		This includes `visibilitychange` if the browser supports it, and blur and focus events. It then uses
		the provided Event Emitter and fires the related events.
	**/
	static function VisibilityHandler(game:Game):Void;
}