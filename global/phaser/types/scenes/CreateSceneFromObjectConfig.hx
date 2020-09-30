package global.phaser.types.scenes;

typedef CreateSceneFromObjectConfig = {
	/**
		The scene's init callback.
	**/
	@:optional
	dynamic function init(data:Dynamic):Void;
	/**
		The scene's preload callback.
	**/
	@:optional
	dynamic function preload():Void;
	/**
		The scene's create callback.
	**/
	@:optional
	dynamic function create(data:Dynamic):Void;
	/**
		The scene's update callback. See {@link Phaser.Scene#update}.
	**/
	@:optional
	var update : haxe.Constraints.Function;
	/**
		Any additional properties, which will be copied to the Scene after it's created (except `data` or `sys`).
	**/
	@:optional
	var extend : Dynamic;
	/**
		Any values, which will be merged into the Scene's Data Manager store.
	**/
	@:optional
	@:native("extend.data")
	var extend_data : Dynamic;
};