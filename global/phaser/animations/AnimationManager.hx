package global.phaser.animations;

/**
	The Animation Manager.
	
	Animations are managed by the global Animation Manager. This is a singleton class that is
	responsible for creating and delivering animations and their corresponding data to all Game Objects.
	Unlike plugins it is owned by the Game instance, not the Scene.
	
	Sprites and other Game Objects get the data they need from the AnimationManager.
**/
@:native("Phaser.Animations.AnimationManager") extern class AnimationManager extends global.phaser.events.EventEmitter {
	function new(game:global.phaser.Game);
	/**
		A reference to the Phaser.Game instance.
	**/
	private var game : global.phaser.Game;
	/**
		A reference to the Texture Manager.
	**/
	private var textureManager : global.phaser.textures.TextureManager;
	/**
		The global time scale of the Animation Manager.
		
		This scales the time delta between two frames, thus influencing the speed of time for the Animation Manager.
	**/
	var globalTimeScale : Float;
	/**
		The Animations registered in the Animation Manager.
		
		This map should be modified with the {@link #add} and {@link #create} methods of the Animation Manager.
	**/
	private var anims : global.phaser.structs.Map_<String, Animation>;
	/**
		Whether the Animation Manager is paused along with all of its Animations.
	**/
	var paused : Bool;
	/**
		The name of this Animation Manager.
	**/
	var name : String;
	/**
		Registers event listeners after the Game boots.
	**/
	function boot():Void;
	/**
		Adds an existing Animation to the Animation Manager.
	**/
	function add(key:String, animation:Animation):AnimationManager;
	/**
		Checks to see if the given key is already in use within the Animation Manager or not.
		
		Animations are global. Keys created in one scene can be used from any other Scene in your game. They are not Scene specific.
	**/
	function exists(key:String):Bool;
	/**
		Creates a new Animation and adds it to the Animation Manager.
		
		Animations are global. Once created, you can use them in any Scene in your game. They are not Scene specific.
		
		If an invalid key is given this method will return `false`.
		
		If you pass the key of an animation that already exists in the Animation Manager, that animation will be returned.
		
		A brand new animation is only created if the key is valid and not already in use.
		
		If you wish to re-use an existing key, call `AnimationManager.remove` first, then this method.
	**/
	function create(config:global.phaser.types.animations.Animation):ts.AnyOf2<Bool, Animation>;
	/**
		Loads this Animation Manager's Animations and settings from a JSON object.
	**/
	function fromJSON(data:ts.AnyOf3<String, global.phaser.types.animations.JSONAnimation, global.phaser.types.animations.JSONAnimations>, ?clearCurrentAnimations:Bool):Array<Animation>;
	/**
		Generate an array of {@link Phaser.Types.Animations.AnimationFrame} objects from a texture key and configuration object.
		
		Generates objects with string based frame names, as configured by the given {@link Phaser.Types.Animations.GenerateFrameNames}.
		
		It's a helper method, designed to make it easier for you to extract all of the frame names from texture atlases.
		If you're working with a sprite sheet, see the `generateFrameNumbers` method instead.
		
		Example:
		
		If you have a texture atlases loaded called `gems` and it contains 6 frames called `ruby_0001`, `ruby_0002`, and so on,
		then you can call this method using: `this.anims.generateFrameNames('gems', { prefix: 'ruby_', end: 6, zeroPad: 4 })`.
		
		The `end` value tells it to look for 6 frames, incrementally numbered, all starting with the prefix `ruby_`. The `zeroPad`
		value tells it how many zeroes pad out the numbers. To create an animation using this method, you can do:
		
		```javascript
		this.anims.create({
		   key: 'ruby',
		   repeat: -1,
		   frames: this.anims.generateFrameNames('gems', {
		     prefix: 'ruby_',
		     end: 6,
		     zeroPad: 4
		   })
		});
		```
		
		Please see the animation examples for further details.
	**/
	function generateFrameNames(key:String, ?config:global.phaser.types.animations.GenerateFrameNames):Array<global.phaser.types.animations.AnimationFrame>;
	/**
		Generate an array of {@link Phaser.Types.Animations.AnimationFrame} objects from a texture key and configuration object.
		
		Generates objects with numbered frame names, as configured by the given {@link Phaser.Types.Animations.GenerateFrameNumbers}.
		
		If you're working with a texture atlas, see the `generateFrameNames` method instead.
	**/
	function generateFrameNumbers(key:String, config:global.phaser.types.animations.GenerateFrameNumbers):Array<global.phaser.types.animations.AnimationFrame>;
	/**
		Get an Animation.
	**/
	function get(key:String):Animation;
	/**
		Load an Animation into a Game Object's Animation Component.
	**/
	function load(child:global.phaser.gameobjects.GameObject, key:String, ?startFrame:ts.AnyOf2<String, Float>):global.phaser.gameobjects.GameObject;
	/**
		Pause all animations.
	**/
	function pauseAll():AnimationManager;
	/**
		Play an animation on the given Game Objects that have an Animation Component.
	**/
	function play(key:String, child:ts.AnyOf2<global.phaser.gameobjects.GameObject, Array<global.phaser.gameobjects.GameObject>>):AnimationManager;
	/**
		Removes an Animation from this Animation Manager, based on the given key.
		
		This is a global action. Once an Animation has been removed, no Game Objects
		can carry on using it.
	**/
	function remove(key:String):Animation;
	/**
		Resume all paused animations.
	**/
	function resumeAll():AnimationManager;
	/**
		Takes an array of Game Objects that have an Animation Component and then
		starts the given animation playing on them, each one offset by the
		`stagger` amount given to this method.
	**/
	function staggerPlay<G>(key:String, children:ts.AnyOf2<global.phaser.gameobjects.GameObject, Array<global.phaser.gameobjects.GameObject>>, ?stagger:Float):G;
	/**
		Returns the Animation data as JavaScript object based on the given key.
		Or, if not key is defined, it will return the data of all animations as array of objects.
	**/
	function toJSON(?key:String):global.phaser.types.animations.JSONAnimations;
	/**
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):AnimationManager;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):AnimationManager;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):AnimationManager;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):AnimationManager;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):AnimationManager;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):AnimationManager;
	static var prototype : AnimationManager;
}