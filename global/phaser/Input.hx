package global.phaser;

@:native("Phaser.Input") @valueModuleOnly extern class Input {
	/**
		Creates a new Interactive Object.
		
		This is called automatically by the Input Manager when you enable a Game Object for input.
		
		The resulting Interactive Object is mapped to the Game Object's `input` property.
	**/
	static function CreateInteractiveObject(gameObject:global.phaser.gameobjects.GameObject, hitArea:Dynamic, hitAreaCallback:global.phaser.types.input.HitAreaCallback):global.phaser.types.input.InteractiveObject;
	/**
		Creates a new Pixel Perfect Handler function.
		
		Access via `InputPlugin.makePixelPerfect` rather than calling it directly.
	**/
	static function CreatePixelPerfectHandler(textureManager:global.phaser.textures.TextureManager, alphaTolerance:Float):haxe.Constraints.Function;
	/**
		The mouse pointer is being held down.
	**/
	static var MOUSE_DOWN : Float;
	/**
		The mouse pointer is being moved.
	**/
	static var MOUSE_MOVE : Float;
	/**
		The mouse pointer is released.
	**/
	static var MOUSE_UP : Float;
	/**
		A touch pointer has been started.
	**/
	static var TOUCH_START : Float;
	/**
		A touch pointer has been started.
	**/
	static var TOUCH_MOVE : Float;
	/**
		A touch pointer has been started.
	**/
	static var TOUCH_END : Float;
	/**
		The pointer lock has changed.
	**/
	static var POINTER_LOCK_CHANGE : Float;
	/**
		A touch pointer has been been cancelled by the browser.
	**/
	static var TOUCH_CANCEL : Float;
	/**
		The mouse wheel changes.
	**/
	static var MOUSE_WHEEL : Float;
}