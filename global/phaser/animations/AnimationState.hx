package global.phaser.animations;

/**
	The Animation State Component.
	
	This component provides features to apply animations to Game Objects. It is responsible for
	loading, queuing animations for later playback, mixing between animations and setting
	the current animation frame to the Game Object that owns this component.
	
	This component lives as an instance within any Game Object that has it defined, such as Sprites.
	
	You can access its properties and methods via the `anims` property, i.e. `Sprite.anims`.
	
	As well as playing animations stored in the global Animation Manager, this component
	can also create animations that are stored locally within it. See the `create` method
	for more details.
	
	Prior to Phaser 3.50 this component was called just `Animation` and lived in the
	`Phaser.GameObjects.Components` namespace. It was renamed to `AnimationState`
	in 3.50 to help better identify its true purpose when browsing the documentation.
**/
@:native("Phaser.Animations.AnimationState") extern class AnimationState {
	function new(parent:global.phaser.gameobjects.GameObject);
	/**
		The Game Object to which this animation component belongs.
		
		You can typically access this component from the Game Object
		via the `this.anims` property.
	**/
	var parent : global.phaser.gameobjects.GameObject;
	/**
		A reference to the global Animation Manager.
	**/
	var animationManager : AnimationManager;
	/**
		A reference to the Texture Manager.
	**/
	private var textureManager : global.phaser.textures.TextureManager;
	/**
		The Animations stored locally in this Animation component.
		
		Do not modify the contents of this Map directly, instead use the
		`add`, `create` and `remove` methods of this class instead.
	**/
	private var anims : global.phaser.structs.Map_<String, Animation>;
	/**
		Is an animation currently playing or not?
	**/
	var isPlaying : Bool;
	/**
		Has the current animation started playing, or is it waiting for a delay to expire?
	**/
	var hasStarted : Bool;
	/**
		The current Animation loaded into this Animation component.
		
		Will by `null` if no animation is yet loaded.
	**/
	var currentAnim : Animation;
	/**
		The current AnimationFrame being displayed by this Animation component.
		
		Will by `null` if no animation is yet loaded.
	**/
	var currentFrame : AnimationFrame;
	/**
		The key, instance, or config of the next Animation to be loaded into this Animation component
		when the current animation completes.
		
		Will by `null` if no animation has been queued.
	**/
	var nextAnim : ts.AnyOf3<String, Animation, global.phaser.types.animations.PlayAnimationConfig>;
	/**
		A queue of Animations to be loaded into this Animation component when the current animation completes.
		
		Populate this queue via the `chain` method.
	**/
	var nextAnimsQueue : Array<Dynamic>;
	/**
		The Time Scale factor.
		
		You can adjust this value to modify the passage of time for the animation that is currently
		playing. For example, setting it to 2 will make the animation play twice as fast. Or setting
		it to 0.5 will slow the animation down.
		
		You can change this value at run-time, or set it via the `PlayAnimationConfig`.
		
		Prior to Phaser 3.50 this property was private and called `_timeScale`.
	**/
	var timeScale : Float;
	/**
		The frame rate of playback, of the current animation, in frames per second.
		
		This value is set when a new animation is loaded into this component and should
		be treated as read-only, as changing it once playback has started will not alter
		the animation. To change the frame rate, provide a new value in the `PlayAnimationConfig` object.
	**/
	var frameRate : Float;
	/**
		The duration of the current animation, in milliseconds.
		
		This value is set when a new animation is loaded into this component and should
		be treated as read-only, as changing it once playback has started will not alter
		the animation. To change the duration, provide a new value in the `PlayAnimationConfig` object.
	**/
	var duration : Float;
	/**
		The number of milliseconds per frame, not including frame specific modifiers that may be present in the
		Animation data.
		
		This value is calculated when a new animation is loaded into this component and should
		be treated as read-only. Changing it will not alter playback speed.
	**/
	var msPerFrame : Float;
	/**
		Skip frames if the time lags, or always advanced anyway?
	**/
	var skipMissedFrames : Bool;
	/**
		The delay before starting playback of the current animation, in milliseconds.
		
		This value is set when a new animation is loaded into this component and should
		be treated as read-only, as changing it once playback has started will not alter
		the animation. To change the delay, provide a new value in the `PlayAnimationConfig` object.
		
		Prior to Phaser 3.50 this property was private and called `_delay`.
	**/
	var delay : Float;
	/**
		The number of times to repeat playback of the current animation.
		
		If -1, it means the animation will repeat forever.
		
		This value is set when a new animation is loaded into this component and should
		be treated as read-only, as changing it once playback has started will not alter
		the animation. To change the number of repeats, provide a new value in the `PlayAnimationConfig` object.
		
		Prior to Phaser 3.50 this property was private and called `_repeat`.
	**/
	var repeat : Float;
	/**
		The number of milliseconds to wait before starting the repeat playback of the current animation.
		
		This value is set when a new animation is loaded into this component, but can also be modified
		at run-time.
		
		You can change the repeat delay by providing a new value in the `PlayAnimationConfig` object.
		
		Prior to Phaser 3.50 this property was private and called `_repeatDelay`.
	**/
	var repeatDelay : Float;
	/**
		Should the current animation yoyo? An animation that yoyos will play in reverse, from the end
		to the start, before then repeating or completing. An animation that does not yoyo will just
		play from the start to the end.
		
		This value is set when a new animation is loaded into this component, but can also be modified
		at run-time.
		
		You can change the yoyo by providing a new value in the `PlayAnimationConfig` object.
		
		Prior to Phaser 3.50 this property was private and called `_yoyo`.
	**/
	var yoyo : Bool;
	/**
		Should the GameObject's `visible` property be set to `true` when the animation starts to play?
		
		This will happen _after_ any delay that may have been set.
		
		This value is set when a new animation is loaded into this component, but can also be modified
		at run-time, assuming the animation is currently delayed.
	**/
	var showOnStart : Bool;
	/**
		Should the GameObject's `visible` property be set to `false` when the animation completes?
		
		This value is set when a new animation is loaded into this component, but can also be modified
		at run-time, assuming the animation is still actively playing.
	**/
	var hideOnComplete : Bool;
	/**
		Is the playhead moving forwards (`true`) or in reverse (`false`) ?
	**/
	var forward : Bool;
	/**
		An internal trigger that tells the component if it should plays the animation
		in reverse mode ('true') or not ('false'). This is used because `forward` can
		be changed by the `yoyo` feature.
		
		Prior to Phaser 3.50 this property was private and called `_reverse`.
	**/
	var inReverse : Bool;
	/**
		Internal time overflow accumulator.
		
		This has the `delta` time added to it as part of the `update` step.
	**/
	var accumulator : Float;
	/**
		The time point at which the next animation frame will change.
		
		This value is compared against the `accumulator` as part of the `update` step.
	**/
	var nextTick : Float;
	/**
		A counter keeping track of how much delay time, in milliseconds, is left before playback begins.
		
		This is set via the `playAfterDelay` method, although it can be modified at run-time
		if required, as long as the animation has not already started playing.
	**/
	var delayCounter : Float;
	/**
		A counter that keeps track of how many repeats are left to run.
		
		This value is set when a new animation is loaded into this component, but can also be modified
		at run-time.
	**/
	var repeatCounter : Float;
	/**
		An internal flag keeping track of pending repeats.
	**/
	var pendingRepeat : Bool;
	/**
		Sets an animation, or an array of animations, to be played in the future, after the current one completes or stops.
		
		The current animation must enter a 'completed' state for this to happen, i.e. finish all of its repeats, delays, etc,
		or have one of the `stop` methods called.
		
		An animation set to repeat forever will never enter a completed state unless stopped.
		
		You can chain a new animation at any point, including before the current one starts playing, during it, or when it ends (via its `animationcomplete` event).
		
		Chained animations are specific to a Game Object, meaning different Game Objects can have different chained animations without impacting the global animation they're playing.
		
		Call this method with no arguments to reset all currently chained animations.
	**/
	function chain(key:ts.AnyOf6<String, Animation, Array<String>, Array<Animation>, global.phaser.types.animations.PlayAnimationConfig, Array<global.phaser.types.animations.PlayAnimationConfig>>):global.phaser.gameobjects.GameObject;
	/**
		Returns the key of the animation currently loaded into this component.
		
		Prior to Phaser 3.50 this method was called `getCurrentKey`.
	**/
	function getName():String;
	/**
		Returns the key of the animation frame currently displayed by this component.
	**/
	function getFrameName():String;
	/**
		Internal method used to load an animation into this component.
	**/
	private function load(key:ts.AnyOf2<String, global.phaser.types.animations.PlayAnimationConfig>):global.phaser.gameobjects.GameObject;
	/**
		Pause the current animation and set the `isPlaying` property to `false`.
		You can optionally pause it at a specific frame.
	**/
	function pause(?atFrame:AnimationFrame):global.phaser.gameobjects.GameObject;
	/**
		Resumes playback of a paused animation and sets the `isPlaying` property to `true`.
		You can optionally tell it to start playback from a specific frame.
	**/
	function resume(?fromFrame:AnimationFrame):global.phaser.gameobjects.GameObject;
	/**
		Waits for the specified delay, in milliseconds, then starts playback of the given animation.
		
		If the animation _also_ has a delay value set in its config, it will be **added** to the delay given here.
		
		If an animation is already running and a new animation is given to this method, it will wait for
		the given delay before starting the new animation.
		
		If no animation is currently running, the given one begins after the delay.
		
		Prior to Phaser 3.50 this method was called 'delayedPlay' and the parameters were in the reverse order.
	**/
	function playAfterDelay(key:ts.AnyOf3<String, Animation, global.phaser.types.animations.PlayAnimationConfig>, delay:Float):global.phaser.gameobjects.GameObject;
	/**
		Waits for the current animation to complete the `repeatCount` number of repeat cycles, then starts playback
		of the given animation.
		
		You can use this to ensure there are no harsh jumps between two sets of animations, i.e. going from an
		idle animation to a walking animation, by making them blend smoothly into each other.
		
		If no animation is currently running, the given one will start immediately.
	**/
	function playAfterRepeat(key:ts.AnyOf3<String, Animation, global.phaser.types.animations.PlayAnimationConfig>, ?repeatCount:Float):global.phaser.gameobjects.GameObject;
	/**
		Start playing the given animation on this Sprite.
		
		Animations in Phaser can either belong to the global Animation Manager, or specifically to this Sprite.
		
		The benefit of a global animation is that multiple Sprites can all play the same animation, without
		having to duplicate the data. You can just create it once and then play it on any Sprite.
		
		The following code shows how to create a global repeating animation. The animation will be created
		from all of the frames within the sprite sheet that was loaded with the key 'muybridge':
		
		```javascript
		var config = {
		     key: 'run',
		     frames: 'muybridge',
		     frameRate: 15,
		     repeat: -1
		};
		
		//  This code should be run from within a Scene:
		this.anims.create(config);
		```
		
		However, if you wish to create an animation that is unique to this Sprite, and this Sprite alone,
		you can call the `Animation.create` method instead. It accepts the exact same parameters as when
		creating a global animation, however the resulting data is kept locally in this Sprite.
		
		With the animation created, either globally or locally, you can now play it on this Sprite:
		
		```javascript
		this.add.sprite(x, y).play('run');
		```
		
		Alternatively, if you wish to run it at a different frame rate, for example, you can pass a config
		object instead:
		
		```javascript
		this.add.sprite(x, y).play({ key: 'run', frameRate: 24 });
		```
		
		When playing an animation on a Sprite it will first check to see if it can find a matching key
		locally within the Sprite. If it can, it will play the local animation. If not, it will then
		search the global Animation Manager and look for it there.
		
		If you need a Sprite to be able to play both local and global animations, make sure they don't
		have conflicting keys.
		
		See the documentation for the `PlayAnimationConfig` config object for more details about this.
		
		Also, see the documentation in the Animation Manager for further details on creating animations.
	**/
	function play(key:ts.AnyOf3<String, Animation, global.phaser.types.animations.PlayAnimationConfig>, ?ignoreIfPlaying:Bool):global.phaser.gameobjects.GameObject;
	/**
		Start playing the given animation on this Sprite, in reverse.
		
		Animations in Phaser can either belong to the global Animation Manager, or specifically to this Sprite.
		
		The benefit of a global animation is that multiple Sprites can all play the same animation, without
		having to duplicate the data. You can just create it once and then play it on any Sprite.
		
		The following code shows how to create a global repeating animation. The animation will be created
		from all of the frames within the sprite sheet that was loaded with the key 'muybridge':
		
		```javascript
		var config = {
		     key: 'run',
		     frames: 'muybridge',
		     frameRate: 15,
		     repeat: -1
		};
		
		//  This code should be run from within a Scene:
		this.anims.create(config);
		```
		
		However, if you wish to create an animation that is unique to this Sprite, and this Sprite alone,
		you can call the `Animation.create` method instead. It accepts the exact same parameters as when
		creating a global animation, however the resulting data is kept locally in this Sprite.
		
		With the animation created, either globally or locally, you can now play it on this Sprite:
		
		```javascript
		this.add.sprite(x, y).playReverse('run');
		```
		
		Alternatively, if you wish to run it at a different frame rate, for example, you can pass a config
		object instead:
		
		```javascript
		this.add.sprite(x, y).playReverse({ key: 'run', frameRate: 24 });
		```
		
		When playing an animation on a Sprite it will first check to see if it can find a matching key
		locally within the Sprite. If it can, it will play the local animation. If not, it will then
		search the global Animation Manager and look for it there.
		
		If you need a Sprite to be able to play both local and global animations, make sure they don't
		have conflicting keys.
		
		See the documentation for the `PlayAnimationConfig` config object for more details about this.
		
		Also, see the documentation in the Animation Manager for further details on creating animations.
	**/
	function playReverse(key:ts.AnyOf3<String, Animation, global.phaser.types.animations.PlayAnimationConfig>, ?ignoreIfPlaying:Bool):global.phaser.gameobjects.GameObject;
	/**
		Load the animation based on the key and set-up all of the internal values
		needed for playback to start. If there is no delay, it will also fire the start events.
	**/
	function startAnimation(key:ts.AnyOf2<String, global.phaser.types.animations.PlayAnimationConfig>):global.phaser.gameobjects.GameObject;
	/**
		Reverse the Animation that is already playing on the Game Object.
	**/
	function reverse():global.phaser.gameobjects.GameObject;
	/**
		Returns a value between 0 and 1 indicating how far this animation is through, ignoring repeats and yoyos.
		
		The value is based on the current frame and how far that is in the animation, it is not based on
		the duration of the animation.
	**/
	function getProgress():Float;
	/**
		Takes a value between 0 and 1 and uses it to set how far this animation is through playback.
		
		Does not factor in repeats or yoyos, but does handle playing forwards or backwards.
		
		The value is based on the current frame and how far that is in the animation, it is not based on
		the duration of the animation.
	**/
	function setProgress(?value:Float):global.phaser.gameobjects.GameObject;
	/**
		Sets the number of times that the animation should repeat after its first play through.
		For example, if repeat is 1, the animation will play a total of twice: the initial play plus 1 repeat.
		
		To repeat indefinitely, use -1.
		The value should always be an integer.
		
		Calling this method only works if the animation is already running. Otherwise, any
		value specified here will be overwritten when the next animation loads in. To avoid this,
		use the `repeat` property of the `PlayAnimationConfig` object instead.
	**/
	function setRepeat(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Handle the removal of an animation from the Animation Manager.
	**/
	function globalRemove(?key:String, ?animation:Animation):Void;
	/**
		Restarts the current animation from its beginning.
		
		You can optionally reset the delay and repeat counters as well.
		
		Calling this will fire the `ANIMATION_RESTART` event immediately.
		
		If you `includeDelay` then it will also fire the `ANIMATION_START` event once
		the delay has expired, otherwise, playback will just begin immediately.
	**/
	function restart(?includeDelay:Bool, ?resetRepeats:Bool):global.phaser.gameobjects.GameObject;
	/**
		The current animation has completed. This dispatches the `ANIMATION_COMPLETE` event.
		
		This method is called by the Animation instance and should not usually be invoked directly.
		
		If no animation is loaded, no events will be dispatched.
		
		If another animation has been queued for playback, it will be started after the events fire.
	**/
	function complete():global.phaser.gameobjects.GameObject;
	/**
		Immediately stops the current animation from playing and dispatches the `ANIMATION_STOP` event.
		
		If no animation is running, no events will be dispatched.
		
		If there is another animation in the queue (set via the `chain` method) then it will start playing.
	**/
	function stop():global.phaser.gameobjects.GameObject;
	/**
		Stops the current animation from playing after the specified time delay, given in milliseconds.
		
		It then dispatches the `ANIMATION_STOP` event.
		
		If no animation is running, no events will be dispatched.
		
		If there is another animation in the queue (set via the `chain` method) then it will start playing,
		when the current one stops.
	**/
	function stopAfterDelay(delay:Float):global.phaser.gameobjects.GameObject;
	/**
		Stops the current animation from playing when it next repeats.
		
		It then dispatches the `ANIMATION_STOP` event.
		
		If no animation is running, no events will be dispatched.
		
		If there is another animation in the queue (set via the `chain` method) then it will start playing,
		when the current one stops.
		
		Prior to Phaser 3.50 this method was called `stopOnRepeat` and had no parameters.
	**/
	function stopAfterRepeat(?repeatCount:Float):global.phaser.gameobjects.GameObject;
	/**
		Stops the current animation from playing when it next sets the given frame.
		If this frame doesn't exist within the animation it will not stop it from playing.
		
		It then dispatches the `ANIMATION_STOP` event.
		
		If no animation is running, no events will be dispatched.
		
		If there is another animation in the queue (set via the `chain` method) then it will start playing,
		when the current one stops.
	**/
	function stopOnFrame(frame:AnimationFrame):global.phaser.gameobjects.GameObject;
	/**
		Returns the total number of frames in this animation, or returns zero if no
		animation has been loaded.
	**/
	function getTotalFrames():Float;
	/**
		The internal update loop for the AnimationState Component.
		
		This is called automatically by the `Sprite.preUpdate` method.
	**/
	function update(time:Float, delta:Float):Void;
	/**
		Sets the given Animation Frame as being the current frame
		and applies it to the parent Game Object, adjusting size and origin as needed.
	**/
	function setCurrentFrame(animationFrame:AnimationFrame):global.phaser.gameobjects.GameObject;
	/**
		Advances the animation to the next frame, regardless of the time or animation state.
		If the animation is set to repeat, or yoyo, this will still take effect.
		
		Calling this does not change the direction of the animation. I.e. if it was currently
		playing in reverse, calling this method doesn't then change the direction to forwards.
	**/
	function nextFrame():global.phaser.gameobjects.GameObject;
	/**
		Advances the animation to the previous frame, regardless of the time or animation state.
		If the animation is set to repeat, or yoyo, this will still take effect.
		
		Calling this does not change the direction of the animation. I.e. if it was currently
		playing in forwards, calling this method doesn't then change the direction to backwards.
	**/
	function previousFrame():global.phaser.gameobjects.GameObject;
	/**
		Get an Animation instance that has been created locally on this Sprite.
		
		See the `create` method for more details.
	**/
	function get(key:String):Animation;
	/**
		Checks to see if the given key is already used locally within the animations stored on this Sprite.
	**/
	function exists(key:String):Bool;
	/**
		Creates a new Animation that is local specifically to this Sprite.
		
		When a Sprite owns an animation, it is kept out of the global Animation Manager, which means
		you're free to use keys that may be already defined there. Unless you specifically need a Sprite
		to have a unique animation, you should favor using global animations instead, as they allow for
		the same animation to be used across multiple Sprites, saving on memory. However, if this Sprite
		is the only one to use this animation, it's sensible to create it here.
		
		If an invalid key is given this method will return `false`.
		
		If you pass the key of an animation that already exists locally, that animation will be returned.
		
		A brand new animation is only created if the key is valid and not already in use by this Sprite.
		
		If you wish to re-use an existing key, call the `remove` method first, then this method.
	**/
	function create(config:global.phaser.types.animations.Animation):ts.AnyOf2<Bool, Animation>;
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
		
		It's a helper method, designed to make it easier for you to extract frames from sprite sheets.
		If you're working with a texture atlas, see the `generateFrameNames` method instead.
		
		Example:
		
		If you have a sprite sheet loaded called `explosion` and it contains 12 frames, then you can call this method using:
		`this.anims.generateFrameNumbers('explosion', { start: 0, end: 12 })`.
		
		The `end` value tells it to stop after 12 frames. To create an animation using this method, you can do:
		
		```javascript
		this.anims.create({
		   key: 'boom',
		   frames: this.anims.generateFrameNames('explosion', {
		     start: 0,
		     end: 12
		   })
		});
		```
		
		Note that `start` is optional and you don't need to include it if the animation starts from frame 0.
		
		To specify an animation in reverse, swap the `start` and `end` values.
		
		If the frames are not sequential, you may pass an array of frame numbers instead, for example:
		
		`this.anims.generateFrameNumbers('explosion', { frames: [ 0, 1, 2, 1, 2, 3, 4, 0, 1, 2 ] })`
		
		Please see the animation examples and `GenerateFrameNumbers` config docs for further details.
	**/
	function generateFrameNumbers(key:String, config:global.phaser.types.animations.GenerateFrameNumbers):Array<global.phaser.types.animations.AnimationFrame>;
	/**
		Removes a locally created Animation from this Sprite, based on the given key.
		
		Once an Animation has been removed, this Sprite cannot play it again without re-creating it.
	**/
	function remove(key:String):Animation;
	/**
		Destroy this Animation component.
		
		Unregisters event listeners and cleans up its references.
	**/
	function destroy():Void;
	/**
		`true` if the current animation is paused, otherwise `false`.
	**/
	final isPaused : Bool;
	static var prototype : AnimationState;
}