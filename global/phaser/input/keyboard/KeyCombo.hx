package global.phaser.input.keyboard;

/**
	A KeyCombo will listen for a specific string of keys from the Keyboard, and when it receives them
	it will emit a `keycombomatch` event from the Keyboard Manager.
	
	The keys to be listened for can be defined as:
	
	A string (i.e. 'ATARI')
	An array of either integers (key codes) or strings, or a mixture of both
	An array of objects (such as Key objects) with a public 'keyCode' property
	
	For example, to listen for the Konami code (up, up, down, down, left, right, left, right, b, a, enter)
	you could pass the following array of key codes:
	
	```javascript
	this.input.keyboard.createCombo([ 38, 38, 40, 40, 37, 39, 37, 39, 66, 65, 13 ], { resetOnMatch: true });
	
	this.input.keyboard.on('keycombomatch', function (event) {
	     console.log('Konami Code entered!');
	});
	```
	
	Or, to listen for the user entering the word PHASER:
	
	```javascript
	this.input.keyboard.createCombo('PHASER');
	```
**/
@:native("Phaser.Input.Keyboard.KeyCombo") extern class KeyCombo {
	function new(keyboardPlugin:KeyboardPlugin, keys:ts.AnyOf3<String, Array<Float>, Array<Dynamic>>, ?config:global.phaser.types.input.keyboard.KeyComboConfig);
	/**
		A reference to the Keyboard Manager
	**/
	var manager : KeyboardPlugin;
	/**
		A flag that controls if this Key Combo is actively processing keys or not.
	**/
	var enabled : Bool;
	/**
		An array of the keycodes that comprise this combo.
	**/
	var keyCodes : Array<Dynamic>;
	/**
		The current keyCode the combo is waiting for.
	**/
	var current : Float;
	/**
		The current index of the key being waited for in the 'keys' string.
	**/
	var index : Float;
	/**
		The length of this combo (in keycodes)
	**/
	var size : Float;
	/**
		The time the previous key in the combo was matched.
	**/
	var timeLastMatched : Float;
	/**
		Has this Key Combo been matched yet?
	**/
	var matched : Bool;
	/**
		The time the entire combo was matched.
	**/
	var timeMatched : Float;
	/**
		If they press the wrong key do we reset the combo?
	**/
	var resetOnWrongKey : Bool;
	/**
		The max delay in ms between each key press. Above this the combo is reset. 0 means disabled.
	**/
	var maxKeyDelay : Float;
	/**
		If previously matched and they press the first key of the combo again, will it reset?
	**/
	var resetOnMatch : Bool;
	/**
		If the combo matches, will it delete itself?
	**/
	var deleteOnMatch : Bool;
	/**
		How far complete is this combo? A value between 0 and 1.
	**/
	final progress : Float;
	/**
		Destroys this Key Combo and all of its references.
	**/
	function destroy():Void;
	static var prototype : KeyCombo;
}