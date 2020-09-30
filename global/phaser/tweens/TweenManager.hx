package global.phaser.tweens;

/**
	The Tween Manager is a default Scene Plugin which controls and updates Tweens and Timelines.
**/
@:native("Phaser.Tweens.TweenManager") extern class TweenManager {
	function new(scene:global.phaser.Scene);
	/**
		The Scene which owns this Tween Manager.
	**/
	var scene : global.phaser.Scene;
	/**
		The Systems object of the Scene which owns this Tween Manager.
	**/
	var systems : global.phaser.scenes.Systems;
	/**
		The time scale of the Tween Manager.
		
		This value scales the time delta between two frames, thus influencing the speed of time for all Tweens owned by this Tween Manager.
	**/
	var timeScale : Float;
	/**
		Create a Tween Timeline and return it, but do NOT add it to the active or pending Tween lists.
	**/
	function createTimeline(?config:global.phaser.types.tweens.TimelineBuilderConfig):Timeline;
	/**
		Create a Tween Timeline and add it to the active Tween list.
	**/
	function timeline(?config:global.phaser.types.tweens.TimelineBuilderConfig):Timeline;
	/**
		Create a Tween and return it, but do NOT add it to the active or pending Tween lists.
	**/
	function create(config:ts.AnyOf2<Dynamic, global.phaser.types.tweens.TweenBuilderConfig>):Tween;
	/**
		Create a Tween and add it to the active Tween list.
	**/
	function add(config:ts.AnyOf2<Dynamic, global.phaser.types.tweens.TweenBuilderConfig>):Tween;
	/**
		Add an existing tween into the active Tween list.
	**/
	function existing(tween:Tween):TweenManager;
	/**
		Create a Number Tween and add it to the active Tween list.
	**/
	function addCounter(config:global.phaser.types.tweens.NumberTweenBuilderConfig):Tween;
	/**
		Creates a Stagger function to be used by a Tween property.
		
		The stagger function will allow you to stagger changes to the value of the property across all targets of the tween.
		
		This is only worth using if the tween has multiple targets.
		
		The following will stagger the delay by 100ms across all targets of the tween, causing them to scale down to 0.2
		over the duration specified:
		
		```javascript
		this.tweens.add({
		     targets: [ ... ],
		     scale: 0.2,
		     ease: 'linear',
		     duration: 1000,
		     delay: this.tweens.stagger(100)
		});
		```
		
		The following will stagger the delay by 500ms across all targets of the tween using a 10 x 6 grid, staggering
		from the center out, using a cubic ease.
		
		```javascript
		this.tweens.add({
		     targets: [ ... ],
		     scale: 0.2,
		     ease: 'linear',
		     duration: 1000,
		     delay: this.tweens.stagger(500, { grid: [ 10, 6 ], from: 'center', ease: 'cubic.out' })
		});
		```
	**/
	function stagger(value:ts.AnyOf2<Float, Array<Float>>, config:global.phaser.types.tweens.StaggerConfig):haxe.Constraints.Function;
	/**
		Updates the Tween Manager's internal lists at the start of the frame.
		
		This method will return immediately if no changes have been indicated.
	**/
	function preUpdate():Void;
	/**
		Updates all Tweens and Timelines of the Tween Manager.
	**/
	function update(timestamp:Float, delta:Float):Void;
	/**
		Removes the given tween from the Tween Manager, regardless of its state (pending or active).
	**/
	function remove(tween:Tween):TweenManager;
	/**
		Checks if a Tween or Timeline is active and adds it to the Tween Manager at the start of the frame if it isn't.
	**/
	function makeActive(tween:Tween):TweenManager;
	/**
		Passes all Tweens to the given callback.
	**/
	function each(callback:haxe.Constraints.Function, ?scope:Dynamic, args:haxe.extern.Rest<Dynamic>):Void;
	/**
		Returns an array of all active Tweens and Timelines in the Tween Manager.
	**/
	function getAllTweens():Array<Tween>;
	/**
		Returns the scale of the time delta for all Tweens and Timelines owned by this Tween Manager.
	**/
	function getGlobalTimeScale():Float;
	/**
		Returns an array of all Tweens or Timelines in the Tween Manager which affect the given target or array of targets.
	**/
	function getTweensOf(target:ts.AnyOf2<Dynamic, Array<Dynamic>>):Array<Tween>;
	/**
		Checks if the given object is being affected by a playing Tween.
	**/
	function isTweening(target:Dynamic):Bool;
	/**
		Stops all Tweens in this Tween Manager. They will be removed at the start of the frame.
	**/
	function killAll():TweenManager;
	/**
		Stops all Tweens which affect the given target or array of targets. The Tweens will be removed from the Tween Manager at the start of the frame.
	**/
	function killTweensOf(target:ts.AnyOf2<Dynamic, Array<Dynamic>>):TweenManager;
	/**
		Pauses all Tweens in this Tween Manager.
	**/
	function pauseAll():TweenManager;
	/**
		Resumes all Tweens in this Tween Manager.
	**/
	function resumeAll():TweenManager;
	/**
		Sets a new scale of the time delta for this Tween Manager.
		
		The time delta is the time elapsed between two consecutive frames and influences the speed of time for this Tween Manager and all Tweens it owns. Values higher than 1 increase the speed of time, while values smaller than 1 decrease it. A value of 0 freezes time and is effectively equivalent to pausing all Tweens.
	**/
	function setGlobalTimeScale(value:Float):TweenManager;
	/**
		The Scene that owns this plugin is shutting down.
		We need to kill and reset all internal properties as well as stop listening to Scene events.
	**/
	function shutdown():Void;
	/**
		The Scene that owns this plugin is being destroyed.
		We need to shutdown and then kill off all external references.
	**/
	function destroy():Void;
	static var prototype : TweenManager;
}