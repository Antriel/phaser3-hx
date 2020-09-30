package global.phaser.animations;

/**
	A Frame based Animation.
	
	This consists of a key, some default values (like the frame rate) and a bunch of Frame objects.
	
	The Animation Manager creates these. Game Objects don't own an instance of these directly.
	Game Objects have the Animation Component, which are like playheads to global Animations (these objects)
	So multiple Game Objects can have playheads all pointing to this one Animation instance.
**/
@:native("Phaser.Animations.Animation") extern class Animation extends global.phaser.events.EventEmitter {
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
		Called internally when this Animation completes playback.
		Optionally, hides the parent Game Object, then stops playback.
	**/
	private function completeAnimation(component:global.phaser.gameobjects.components.Animation):Void;
	/**
		Called internally when this Animation first starts to play.
		Sets the accumulator and nextTick properties.
	**/
	private function getFirstTick(component:global.phaser.gameobjects.components.Animation, ?includeDelay:Bool):Void;
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
	function getNextTick(component:global.phaser.gameobjects.components.Animation):Void;
	/**
		Returns the frame closest to the given progress value between 0 and 1.
	**/
	function getFrameByProgress(value:Float):AnimationFrame;
	/**
		Advance the animation frame.
	**/
	function nextFrame(component:global.phaser.gameobjects.components.Animation):Void;
	/**
		Returns the animation last frame.
	**/
	function getLastFrame():AnimationFrame;
	/**
		Called internally when the Animation is playing backwards.
		Sets the previous frame, causing a yoyo, repeat, complete or update, accordingly.
	**/
	function previousFrame(component:global.phaser.gameobjects.components.Animation):Void;
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
	function repeatAnimation(component:global.phaser.gameobjects.components.Animation):Void;
	/**
		Sets the texture frame the animation uses for rendering.
	**/
	function setFrame(component:global.phaser.gameobjects.components.Animation):Void;
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
		Add a listener for a given event.
	**/
	function on(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Animation;
	/**
		Add a listener for a given event.
	**/
	function addListener(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Animation;
	/**
		Add a one-time listener for a given event.
	**/
	function once(event:ts.AnyOf2<String, js.lib.Symbol>, fn:haxe.Constraints.Function, ?context:Dynamic):Animation;
	/**
		Remove the listeners of a given event.
	**/
	function removeListener(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Animation;
	/**
		Remove the listeners of a given event.
	**/
	function off(event:ts.AnyOf2<String, js.lib.Symbol>, ?fn:haxe.Constraints.Function, ?context:Dynamic, ?once:Bool):Animation;
	/**
		Remove all listeners, or those of the specified event.
	**/
	function removeAllListeners(?event:ts.AnyOf2<String, js.lib.Symbol>):Animation;
	static var prototype : Animation;
}