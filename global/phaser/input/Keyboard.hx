package global.phaser.input;

@:native("Phaser.Input.Keyboard") @valueModuleOnly extern class Keyboard {
	/**
		Returns `true` if the Key was pressed down within the `duration` value given, based on the current
		game clock time. Or `false` if it either isn't down, or was pressed down longer ago than the given duration.
	**/
	static function DownDuration(key:global.phaser.input.keyboard.Key, ?duration:Float):Bool;
	/**
		The justDown value allows you to test if this Key has just been pressed down or not.
		
		When you check this value it will return `true` if the Key is down, otherwise `false`.
		
		You can only call justDown once per key press. It will only return `true` once, until the Key is released and pressed down again.
		This allows you to use it in situations where you want to check if this key is down without using an event, such as in a core game loop.
	**/
	static function JustDown(key:global.phaser.input.keyboard.Key):Bool;
	/**
		The justUp value allows you to test if this Key has just been released or not.
		
		When you check this value it will return `true` if the Key is up, otherwise `false`.
		
		You can only call JustUp once per key release. It will only return `true` once, until the Key is pressed down and released again.
		This allows you to use it in situations where you want to check if this key is up without using an event, such as in a core game loop.
	**/
	static function JustUp(key:global.phaser.input.keyboard.Key):Bool;
	/**
		Returns `true` if the Key was released within the `duration` value given, based on the current
		game clock time. Or returns `false` if it either isn't up, or was released longer ago than the given duration.
	**/
	static function UpDuration(key:global.phaser.input.keyboard.Key, ?duration:Float):Bool;
}