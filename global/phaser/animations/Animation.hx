package global.phaser.animations;

/**
	A Frame based Animation.
	
	Animations in Phaser consist of a sequence of `AnimationFrame` objects, which are managed by
	this class, along with properties that impact playback, such as the animations frame rate
	or delay.
	
	This class contains all of the properties and methods needed to handle playback of the animation
	directly to an `AnimationState` instance, which is owned by a Sprite, or similar Game Object.
	
	You don't typically create an instance of this class directly, but instead go via
	either the `AnimationManager` or the `AnimationState` and use their `create` methods,
	depending on if you need a global animation, or local to a specific Sprite.
**/
@:native("Phaser.Animations.Animation") extern class Animation {
	function new(manager:AnimationManager, key:String, config:global.phaser.types.animations.Animation);
	/**
		A reference to the global Animation Manager.
	**/
	var manager : AnimationManager;
	/**
		The unique identifying string for this animation.
	**/
	var key : String;
	/**
		A frame based animation (as opposed to a bone based animation)
	**/
	var type : String;
	/**
		Extract all the frame data into the frames array.
	**/
	var frames : Array<AnimationFrame>;
	/**
		The frame rate of playback in frames per second (default 24 if duration is null)
	**/
	var frameRate : Float;
	/**
		How long the animation should play for, in milliseconds.
		If the `frameRate` property has been set then it overrides this value,
		otherwise the `frameRate` is derived from `duration`.
	**/
	var duration : Float;
	/**
		How many ms per frame, not including frame specific modifiers.
	**/
	var msPerFrame : Float;
	/**
		Skip frames if the time lags, or always advanced anyway?
	**/
	var skipMissedFrames : Bool;
	/**
		The delay in ms before the playback will begin.
	**/
	var delay : Float;
	/**
		Number of times to repeat the animation. Set to -1 to repeat forever.
	**/
	var repeat : Float;
	/**
		The delay in ms before the a repeat play starts.
	**/
	var repeatDelay : Float;
	/**
		Should the animation yoyo (reverse back down to the start) before repeating?
	**/
	var yoyo : Bool;
	/**
		Should the GameObject's `visible` property be set to `true` when the animation starts to play?
	**/
	var showOnStart : Bool;
	/**
		Should the GameObject's `visible` property be set to `false` when the animation finishes?
	**/
	var hideOnComplete : Bool;
	/**
		Global pause. All Game Objects using this Animation instance are impacted by this property.
	**/
	var paused : Bool;
	/**
		Gets the total number of frames in this animation.
	**/
	function getTotalFrames():Float;
	/**
		Calculates the duration, frame rate and msPerFrame values.
	**/
	function calculateDuration(target:Animation, totalFrames:Float, duration:Float, frameRate:Float):Void;
	/**
		Add frames to the end of the animation.
	**/
	function addFrame(config:ts.AnyOf2<String, Array<global.phaser.types.animations.AnimationFrame>>):Animation;
	/**
		Add frame/s into the animation.
	**/
	function addFrameAt(index:Float, config:ts.AnyOf2<String, Array<global.phaser.types.animations.AnimationFrame>>):Animation;
	/**
		Check if the given frame index is valid.
	**/
	function checkFrame(index:Float):Bool;
	/**
		Called internally when this Animation first starts to play.
		Sets the accumulator and nextTick properties.
	**/
	private function getFirstTick(state:AnimationState):Void;
	/**
		Returns the AnimationFrame at the provided index
	**/
	private function getFrameAt(index:Float):AnimationFrame;
	/**
		Creates AnimationFrame instances based on the given frame data.
	**/
	function getFrames(textureManager:global.phaser.textures.TextureManager, frames:ts.AnyOf2<String, Array<global.phaser.types.animations.AnimationFrame>>, ?defaultTextureKey:String):Array<AnimationFrame>;
	/**
		Called internally. Sets the accumulator and nextTick values of the current Animation.
	**/
	function getNextTick(state:AnimationState):Void;
	/**
		Returns the frame closest to the given progress value between 0 and 1.
	**/
	function getFrameByProgress(value:Float):AnimationFrame;
	/**
		Advance the animation frame.
	**/
	function nextFrame(state:AnimationState):Void;
	/**
		Returns the animation last frame.
	**/
	function getLastFrame():AnimationFrame;
	/**
		Called internally when the Animation is playing backwards.
		Sets the previous frame, causing a yoyo, repeat, complete or update, accordingly.
	**/
	function previousFrame(state:AnimationState):Void;
	/**
		Removes the given AnimationFrame from this Animation instance.
		This is a global action. Any Game Object using this Animation will be impacted by this change.
	**/
	function removeFrame(frame:AnimationFrame):Animation;
	/**
		Removes a frame from the AnimationFrame array at the provided index
		and updates the animation accordingly.
	**/
	function removeFrameAt(index:Float):Animation;
	/**
		Called internally during playback. Forces the animation to repeat, providing there are enough counts left
		in the repeat counter.
	**/
	function repeatAnimation(state:AnimationState):Void;
	/**
		Converts the animation data to JSON.
	**/
	function toJSON():global.phaser.types.animations.JSONAnimation;
	/**
		Called internally whenever frames are added to, or removed from, this Animation.
	**/
	function updateFrameSequence():Animation;
	/**
		Pauses playback of this Animation. The paused state is set immediately.
	**/
	function pause():Animation;
	/**
		Resumes playback of this Animation. The paused state is reset immediately.
	**/
	function resume():Animation;
	/**
		Destroys this Animation instance. It will remove all event listeners,
		remove this animation and its key from the global Animation Manager,
		and then destroy all Animation Frames in turn.
	**/
	function destroy():Void;
	static var prototype : Animation;
}