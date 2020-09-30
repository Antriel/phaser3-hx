package global.phaser.gameobjects.components;

/**
	Provides methods used for managing a Game Object following a Path.
	Should be applied as a mixin and not used directly.
**/
typedef PathFollower = {
	/**
		The Path this PathFollower is following. It can only follow one Path at a time.
	**/
	var path : global.phaser.curves.Path;
	/**
		Should the PathFollower automatically rotate to point in the direction of the Path?
	**/
	var rotateToPath : Bool;
	/**
		Set the Path that this PathFollower should follow.
		
		Optionally accepts {@link Phaser.Types.GameObjects.PathFollower.PathConfig} settings.
	**/
	function setPath(path:global.phaser.curves.Path, ?config:ts.AnyOf3<Float, global.phaser.types.gameobjects.pathfollower.PathConfig, global.phaser.types.tweens.NumberTweenBuilderConfig>):PathFollower;
	/**
		Set whether the PathFollower should automatically rotate to point in the direction of the Path.
	**/
	function setRotateToPath(value:Bool, ?offset:Float):PathFollower;
	/**
		Is this PathFollower actively following a Path or not?
		
		To be considered as `isFollowing` it must be currently moving on a Path, and not paused.
	**/
	function isFollowing():Bool;
	/**
		Starts this PathFollower following its given Path.
	**/
	function startFollow(?config:ts.AnyOf3<Float, global.phaser.types.gameobjects.pathfollower.PathConfig, global.phaser.types.tweens.NumberTweenBuilderConfig>, ?startAt:Float):PathFollower;
	/**
		Pauses this PathFollower. It will still continue to render, but it will remain motionless at the
		point on the Path at which you paused it.
	**/
	function pauseFollow():PathFollower;
	/**
		Resumes a previously paused PathFollower.
		
		If the PathFollower was not paused this has no effect.
	**/
	function resumeFollow():PathFollower;
	/**
		Stops this PathFollower from following the path any longer.
		
		This will invoke any 'stop' conditions that may exist on the Path, or for the follower.
	**/
	function stopFollow():PathFollower;
	/**
		Internal update handler that advances this PathFollower along the path.
		
		Called automatically by the Scene step, should not typically be called directly.
	**/
	function pathUpdate():Void;
};