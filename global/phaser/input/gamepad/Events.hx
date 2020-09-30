package global.phaser.input.gamepad;

@:native("Phaser.Input.Gamepad.Events") @valueModuleOnly extern class Events {
	/**
		The Gamepad Button Down Event.
		
		This event is dispatched by the Gamepad Plugin when a button has been pressed on any active Gamepad.
		
		Listen to this event from within a Scene using: `this.input.gamepad.on('down', listener)`.
		
		You can also listen for a DOWN event from a Gamepad instance. See the [GAMEPAD_BUTTON_DOWN]{@linkcode Phaser.Input.Gamepad.Events#event:GAMEPAD_BUTTON_DOWN} event for details.
	**/
	static final BUTTON_DOWN : Dynamic;
	/**
		The Gamepad Button Up Event.
		
		This event is dispatched by the Gamepad Plugin when a button has been released on any active Gamepad.
		
		Listen to this event from within a Scene using: `this.input.gamepad.on('up', listener)`.
		
		You can also listen for an UP event from a Gamepad instance. See the [GAMEPAD_BUTTON_UP]{@linkcode Phaser.Input.Gamepad.Events#event:GAMEPAD_BUTTON_UP} event for details.
	**/
	static final BUTTON_UP : Dynamic;
	/**
		The Gamepad Connected Event.
		
		This event is dispatched by the Gamepad Plugin when a Gamepad has been connected.
		
		Listen to this event from within a Scene using: `this.input.gamepad.once('connected', listener)`.
		
		Note that the browser may require you to press a button on a gamepad before it will allow you to access it,
		this is for security reasons. However, it may also trust the page already, in which case you won't get the
		'connected' event and instead should check `GamepadPlugin.total` to see if it thinks there are any gamepads
		already connected.
	**/
	static final CONNECTED : Dynamic;
	/**
		The Gamepad Disconnected Event.
		
		This event is dispatched by the Gamepad Plugin when a Gamepad has been disconnected.
		
		Listen to this event from within a Scene using: `this.input.gamepad.once('disconnected', listener)`.
	**/
	static final DISCONNECTED : Dynamic;
	/**
		The Gamepad Button Down Event.
		
		This event is dispatched by a Gamepad instance when a button has been pressed on it.
		
		Listen to this event from a Gamepad instance. Once way to get this is from the `pad1`, `pad2`, etc properties on the Gamepad Plugin:
		`this.input.gamepad.pad1.on('down', listener)`.
		
		Note that you will not receive any Gamepad button events until the browser considers the Gamepad as being 'connected'.
		
		You can also listen for a DOWN event from the Gamepad Plugin. See the [BUTTON_DOWN]{@linkcode Phaser.Input.Gamepad.Events#event:BUTTON_DOWN} event for details.
	**/
	static final GAMEPAD_BUTTON_DOWN : Dynamic;
	/**
		The Gamepad Button Up Event.
		
		This event is dispatched by a Gamepad instance when a button has been released on it.
		
		Listen to this event from a Gamepad instance. Once way to get this is from the `pad1`, `pad2`, etc properties on the Gamepad Plugin:
		`this.input.gamepad.pad1.on('up', listener)`.
		
		Note that you will not receive any Gamepad button events until the browser considers the Gamepad as being 'connected'.
		
		You can also listen for an UP event from the Gamepad Plugin. See the [BUTTON_UP]{@linkcode Phaser.Input.Gamepad.Events#event:BUTTON_UP} event for details.
	**/
	static final GAMEPAD_BUTTON_UP : Dynamic;
}