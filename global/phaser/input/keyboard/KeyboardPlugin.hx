package global.phaser.input.keyboard;

/**
	The Keyboard Plugin is an input plugin that belongs to the Scene-owned Input system.
	
	Its role is to listen for native DOM Keyboard Events and then process them.
	
	You do not need to create this class directly, the Input system will create an instance of it automatically.
	
	You can access it from within a Scene using `this.input.keyboard`. For example, you can do:
	
	```javascript
	this.input.keyboard.on('keydown', callback, context);
	```
	
	Or, to listen for a specific key:
	
	```javascript
	this.input.keyboard.on('keydown-A', callback, context);
	```
	
	You can also create Key objects, which you can then poll in your game loop:
	
	```javascript
	var spaceBar = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.SPACE);
	```
	
	If you have multiple parallel Scenes, each trying to get keyboard input, be sure to disable capture on them to stop them from
	stealing input from another Scene in the list. You can do this with `this.input.keyboard.enabled = false` within the
	Scene to stop all input, or `this.input.keyboard.preventDefault = false` to stop a Scene halting input on another Scene.
	
	_Note_: Many keyboards are unable to process certain combinations of keys due to hardware limitations known as ghosting.
	See http://www.html5gamedevs.com/topic/4876-impossible-to-use-more-than-2-keyboard-input-buttons-at-the-same-time/ for more details.
	
	Also please be aware that certain browser extensions can disable or override Phaser keyboard handling.
	For example the Chrome extension vimium is known to disable Phaser from using the D key, while EverNote disables the backtick key.
	And there are others. So, please check your extensions before opening Phaser issues about keys that don't work.
**/
@:native("Phaser.Input.Keyboard.KeyboardPlugin") extern class KeyboardPlugin extends global.phaser.events.EventEmitter {
	function new(sceneInputPlugin:global.phaser.input.InputPlugin);
	/**
		A reference to the core game, so we can listen for visibility events.
	**/
	var game : global.phaser.Game;
	/**
		A reference to the Scene that this Input Plugin is responsible for.
	**/
	var scene : global.phaser.Scene;
	/**
		A reference to the Scene Systems Settings.
	**/
	var settings : global.phaser.types.scenes.SettingsObject;
	/**
		A reference to the Scene Input Plugin that created this Keyboard Plugin.
	**/
	var sceneInputPlugin : global.phaser.input.InputPlugin;
	/**
		A reference to the global Keyboard Manager.
	**/
	var manager : global.phaser.input.InputPlugin;
	/**
		A boolean that controls if this Keyboard Plugin is enabled or not.
		Can be toggled on the fly.
	**/
	var enabled : Bool;
	/**
		An array of Key objects to process.
	**/
	var keys : Array<Key>;
	/**
		An array of KeyCombo objects to process.
	**/
	var combos : Array<KeyCombo>;
	/**
		Checks to see if both this plugin and the Scene to which it belongs is active.
	**/
	function isActive():Bool;
	/**
		By default when a key is pressed Phaser will not stop the event from propagating up to the browser.
		There are some keys this can be annoying for, like the arrow keys or space bar, which make the browser window scroll.
		
		This `addCapture` method enables consuming keyboard events for specific keys, so they don't bubble up the browser
		and cause the default behaviors.
		
		Please note that keyboard captures are global. This means that if you call this method from within a Scene, to say prevent
		the SPACE BAR from triggering a page scroll, then it will prevent it for any Scene in your game, not just the calling one.
		
		You can pass a single key code value:
		
		```javascript
		this.input.keyboard.addCapture(62);
		```
		
		An array of key codes:
		
		```javascript
		this.input.keyboard.addCapture([ 62, 63, 64 ]);
		```
		
		Or, a comma-delimited string:
		
		```javascript
		this.input.keyboard.addCapture('W,S,A,D');
		```
		
		To use non-alpha numeric keys, use a string, such as 'UP', 'SPACE' or 'LEFT'.
		
		You can also provide an array mixing both strings and key code integers.
	**/
	function addCapture(keycode:ts.AnyOf4<String, Float, Array<Dynamic>, Array<Float>>):KeyboardPlugin;
	/**
		Removes an existing key capture.
		
		Please note that keyboard captures are global. This means that if you call this method from within a Scene, to remove
		the capture of a key, then it will remove it for any Scene in your game, not just the calling one.
		
		You can pass a single key code value:
		
		```javascript
		this.input.keyboard.removeCapture(62);
		```
		
		An array of key codes:
		
		```javascript
		this.input.keyboard.removeCapture([ 62, 63, 64 ]);
		```
		
		Or, a comma-delimited string:
		
		```javascript
		this.input.keyboard.removeCapture('W,S,A,D');
		```
		
		To use non-alpha numeric keys, use a string, such as 'UP', 'SPACE' or 'LEFT'.
		
		You can also provide an array mixing both strings and key code integers.
	**/
	function removeCapture(keycode:ts.AnyOf4<String, Float, Array<Dynamic>, Array<Float>>):KeyboardPlugin;
	/**
		Returns an array that contains all of the keyboard captures currently enabled.
	**/
	function getCaptures():Array<Float>;
	/**
		Allows Phaser to prevent any key captures you may have defined from bubbling up the browser.
		You can use this to re-enable event capturing if you had paused it via `disableGlobalCapture`.
	**/
	function enableGlobalCapture():KeyboardPlugin;
	/**
		Disables Phaser from preventing any key captures you may have defined, without actually removing them.
		You can use this to temporarily disable event capturing if, for example, you swap to a DOM element.
	**/
	function disableGlobalCapture():KeyboardPlugin;
	/**
		Removes all keyboard captures.
		
		Note that this is a global change. It will clear all event captures across your game, not just for this specific Scene.
	**/
	function clearCaptures():KeyboardPlugin;
	/**
		Creates and returns an object containing 4 hotkeys for Up, Down, Left and Right, and also Space Bar and shift.
	**/
	function createCursorKeys():global.phaser.types.input.keyboard.CursorKeys;
	/**
		A practical way to create an object containing user selected hotkeys.
		
		For example:
		
		```javascript
		this.input.keyboard.addKeys({ 'up': Phaser.Input.Keyboard.KeyCodes.W, 'down': Phaser.Input.Keyboard.KeyCodes.S });
		```
		
		would return an object containing the properties (`up` and `down`) mapped to W and S {@link Phaser.Input.Keyboard.Key} objects.
		
		You can also pass in a comma-separated string:
		
		```javascript
		this.input.keyboard.addKeys('W,S,A,D');
		```
		
		Which will return an object with the properties W, S, A and D mapped to the relevant Key objects.
		
		To use non-alpha numeric keys, use a string, such as 'UP', 'SPACE' or 'LEFT'.
	**/
	function addKeys(keys:ts.AnyOf2<String, Dynamic>, ?enableCapture:Bool, ?emitOnRepeat:Bool):Dynamic;
	/**
		Adds a Key object to this Keyboard Plugin.
		
		The given argument can be either an existing Key object, a string, such as `A` or `SPACE`, or a key code value.
		
		If a Key object is given, and one already exists matching the same key code, the existing one is replaced with the new one.
	**/
	function addKey(key:ts.AnyOf3<String, Float, Key>, ?enableCapture:Bool, ?emitOnRepeat:Bool):Key;
	/**
		Removes a Key object from this Keyboard Plugin.
		
		The given argument can be either a Key object, a string, such as `A` or `SPACE`, or a key code value.
	**/
	function removeKey(key:ts.AnyOf3<String, Float, Key>, ?destroy:Bool):KeyboardPlugin;
	/**
		Removes all Key objects created by _this_ Keyboard Plugin.
	**/
	function removeAllKeys(?destroy:Bool):KeyboardPlugin;
	/**
		Creates a new KeyCombo.
		
		A KeyCombo will listen for a specific string of keys from the Keyboard, and when it receives them
		it will emit a `keycombomatch` event from this Keyboard Plugin.
		
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
	function createCombo(keys:ts.AnyOf3<String, Array<Float>, Array<Dynamic>>, ?config:global.phaser.types.input.keyboard.KeyComboConfig):KeyCombo;
	/**
		Checks if the given Key object is currently being held down.
		
		The difference between this method and checking the `Key.isDown` property directly is that you can provide
		a duration to this method. For example, if you wanted a key press to fire a bullet, but you only wanted
		it to be able to fire every 100ms, then you can call this method with a `duration` of 100 and it
		will only return `true` every 100ms.
		
		If the Keyboard Plugin has been disabled, this method will always return `false`.
	**/
	function checkDown(key:Key, ?duration:Float):Bool;
	/**
		Resets all Key objects created by _this_ Keyboard Plugin back to their default un-pressed states.
		This can only reset keys created via the `addKey`, `addKeys` or `createCursorKeys` methods.
		If you have created a Key object directly you'll need to reset it yourself.
		
		This method is called automatically when the Keyboard Plugin shuts down, but can be
		invoked directly at any time you require.
	**/
	function resetKeys():KeyboardPlugin;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):KeyboardPlugin;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):KeyboardPlugin;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):KeyboardPlugin;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):KeyboardPlugin;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):KeyboardPlugin;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):KeyboardPlugin;
	static var prototype : KeyboardPlugin;
}