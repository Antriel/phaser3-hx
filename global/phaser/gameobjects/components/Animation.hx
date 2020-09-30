package global.phaser.gameobjects.components;

typedef Animation = {
	/**
		The Game Object to which this animation controller belongs.
	**/
	var parent : global.phaser.gameobjects.GameObject;
	/**
		A reference to the global Animation Manager.
	**/
	var animationManager : global.phaser.animations.AnimationManager;
	/**
		Is an animation currently playing or not?
	**/
	var isPlaying : Bool;
	/**
		The current Animation loaded into this Animation Controller.
	**/
	var currentAnim : global.phaser.animations.Animation;
	/**
		The current AnimationFrame being displayed by this Animation Controller.
	**/
	var currentFrame : global.phaser.animations.AnimationFrame;
	/**
		The key of the next Animation to be loaded into this Animation Controller when the current animation completes.
	**/
	var nextAnim : String;
	/**
		A queue of keys of the next Animations to be loaded into this Animation Controller when the current animation completes.
	**/
	var nextAnimsQueue : Array<String>;
	/**
		The frame rate of playback in frames per second.
		The default is 24 if the `duration` property is `null`.
	**/
	var frameRate : Float;
	/**
		How long the animation should play for, in milliseconds.
		If the `frameRate` property has been set then it overrides this value,
		otherwise the `frameRate` is derived from `duration`.
	**/
	var duration : Float;
	/**
		ms per frame, not including frame specific modifiers that may be present in the Animation data.
	**/
	var msPerFrame : Float;
	/**
		Skip frames if the time lags, or always advanced anyway?
	**/
	var skipMissedFrames : Bool;
	/**
		Will the playhead move forwards (`true`) or in reverse (`false`).
	**/
	var forward : Bool;
	/**
		Internal time overflow accumulator.
	**/
	var accumulator : Float;
	/**
		The time point at which the next animation frame will change.
	**/
	var nextTick : Float;
	/**
		An internal counter keeping track of how many repeats are left to play.
	**/
	var repeatCounter : Float;
	/**
		An internal flag keeping track of pending repeats.
	**/
	var pendingRepeat : Bool;
	/**
		Sets an animation to be played immediately after the current one completes.
		
		The current animation must enter a 'completed' state for this to happen, i.e. finish all of its repeats, delays, etc, or have the `stop` method called directly on it.
		
		An animation set to repeat forever will never enter a completed state.
		
		You can chain a new animation at any point, including before the current one starts playing, during it, or when it ends (via its `animationcomplete` callback).
		Chained animations are specific to a Game Object, meaning different Game Objects can have different chained animations without impacting the global animation they're playing.
		
		Call this method with no arguments to reset the chained animation.
	**/
	function chain(?key:ts.AnyOf2<String, global.phaser.animations.Animation>):global.phaser.gameobjects.GameObject;
	/**
		Sets the amount of time, in milliseconds, that the animation will be delayed before starting playback.
	**/
	function setDelay(?value:Float):global.phaser.gameobjects.GameObject;
	/**
		Gets the amount of time, in milliseconds that the animation will be delayed before starting playback.
	**/
	function getDelay():Float;
	/**
		Waits for the specified delay, in milliseconds, then starts playback of the requested animation.
	**/
	function delayedPlay(delay:Float, key:String, ?startFrame:Float):global.phaser.gameobjects.GameObject;
	/**
		Returns the key of the animation currently loaded into this component.
	**/
	function getCurrentKey():String;
	/**
		Internal method used to load an animation into this component.
	**/
	function load(key:String, ?startFrame:Float):global.phaser.gameobjects.GameObject;
	/**
		Pause the current animation and set the `isPlaying` property to `false`.
		You can optionally pause it at a specific frame.
	**/
	function pause(?atFrame:global.phaser.animations.AnimationFrame):global.phaser.gameobjects.GameObject;
	/**
		Resumes playback of a paused animation and sets the `isPlaying` property to `true`.
		You can optionally tell it to start playback from a specific frame.
	**/
	function resume(?fromFrame:global.phaser.animations.AnimationFrame):global.phaser.gameobjects.GameObject;
	/**
		`true` if the current animation is paused, otherwise `false`.
	**/
	final isPaused : Bool;
	/**
		Plays an Animation on a Game Object that has the Animation component, such as a Sprite.
		
		Animations are stored in the global Animation Manager and are referenced by a unique string-based key.
	**/
	function play(key:ts.AnyOf2<String, global.phaser.animations.Animation>, ?ignoreIfPlaying:Bool, ?startFrame:Float):global.phaser.gameobjects.GameObject;
	/**
		Plays an Animation (in reverse mode) on the Game Object that owns this Animation Component.
	**/
	function playReverse(key:ts.AnyOf2<String, global.phaser.animations.Animation>, ?ignoreIfPlaying:Bool, ?startFrame:Float):global.phaser.gameobjects.GameObject;
	/**
		Load an Animation and fires 'onStartEvent' event, extracted from 'play' method.
	**/
	function _startAnimation(key:String, ?startFrame:Float):global.phaser.gameobjects.GameObject;
	/**
		Reverse the Animation that is already playing on the Game Object.
	**/
	function reverse():global.phaser.gameobjects.GameObject;
	/**
		Returns a value between 0 and 1 indicating how far this animation is through, ignoring repeats and yoyos.
		If the animation has a non-zero repeat defined, `getProgress` and `getTotalProgress` will be different
		because `getProgress` doesn't include any repeats or repeat delays, whereas `getTotalProgress` does.
	**/
	function getProgress():Float;
	/**
		Takes a value between 0 and 1 and uses it to set how far this animation is through playback.
		Does not factor in repeats or yoyos, but does handle playing forwards or backwards.
	**/
	function setProgress(?value:Float):global.phaser.gameobjects.GameObject;
	/**
		Handle the removal of an animation from the Animation Manager.
	**/
	function remove(?key:String, ?animation:global.phaser.animations.Animation):Void;
	/**
		Gets the number of times that the animation will repeat
		after its first iteration. For example, if returns 1, the animation will
		play a total of twice (the initial play plus 1 repeat).
		A value of -1 means the animation will repeat indefinitely.
	**/
	function getRepeat():Float;
	/**
		Sets the number of times that the animation should repeat
		after its first iteration. For example, if repeat is 1, the animation will
		play a total of twice (the initial play plus 1 repeat).
		To repeat indefinitely, use -1. repeat should always be an integer.
	**/
	function setRepeat(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Gets the amount of delay between repeats, if any.
	**/
	function getRepeatDelay():Float;
	/**
		Sets the amount of time in seconds between repeats.
		For example, if `repeat` is 2 and `repeatDelay` is 10, the animation will play initially,
		then wait for 10 seconds before repeating, then play again, then wait another 10 seconds
		before doing its final repeat.
	**/
	function setRepeatDelay(value:Float):global.phaser.gameobjects.GameObject;
	/**
		Restarts the current animation from its beginning, optionally including its delay value.
	**/
	function restart(?includeDelay:Bool):global.phaser.gameobjects.GameObject;
	/**
		Immediately stops the current animation from playing and dispatches the `animationcomplete` event.
		
		If no animation is set, no event will be dispatched.
		
		If there is another animation queued (via the `chain` method) then it will start playing immediately.
	**/
	function stop():global.phaser.gameobjects.GameObject;
	/**
		Stops the current animation from playing after the specified time delay, given in milliseconds.
	**/
	function stopAfterDelay(delay:Float):global.phaser.gameobjects.GameObject;
	/**
		Stops the current animation from playing when it next repeats.
	**/
	function stopOnRepeat():global.phaser.gameobjects.GameObject;
	/**
		Stops the current animation from playing when it next sets the given frame.
		If this frame doesn't exist within the animation it will not stop it from playing.
	**/
	function stopOnFrame(frame:global.phaser.animations.AnimationFrame):global.phaser.gameobjects.GameObject;
	/**
		Sets the Time Scale factor, allowing you to make the animation go go faster or slower than default.
		Where 1 = normal speed (the default), 0.5 = half speed, 2 = double speed, etc.
	**/
	function setTimeScale(?value:Float):global.phaser.gameobjects.GameObject;
	/**
		Gets the Time Scale factor.
	**/
	function getTimeScale():Float;
	/**
		Returns the total number of frames in this animation.
	**/
	function getTotalFrames():Float;
	/**
		The internal update loop for the Animation Component.
	**/
	function update(time:Float, delta:Float):Void;
	/**
		Sets the given Animation Frame as being the current frame
		and applies it to the parent Game Object, adjusting its size and origin as needed.
	**/
	function setCurrentFrame(animationFrame:global.phaser.animations.AnimationFrame):global.phaser.gameobjects.GameObject;
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
		Sets if the current Animation will yoyo when it reaches the end.
		A yoyo'ing animation will play through consecutively, and then reverse-play back to the start again.
	**/
	function setYoyo(?value:Bool):global.phaser.gameobjects.GameObject;
	/**
		Gets if the current Animation will yoyo when it reaches the end.
		A yoyo'ing animation will play through consecutively, and then reverse-play back to the start again.
	**/
	function getYoyo():Bool;
	/**
		Destroy this Animation component.
		
		Unregisters event listeners and cleans up its references.
	**/
	function destroy():Void;
};