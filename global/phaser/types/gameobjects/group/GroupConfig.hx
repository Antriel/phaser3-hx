package global.phaser.types.gameobjects.group;

typedef GroupConfig = {
	/**
		Sets {@link Phaser.GameObjects.Group#classType}.
	**/
	@:optional
	var classType : haxe.Constraints.Function;
	/**
		Sets {@link Phaser.GameObjects.Group#name}.
	**/
	@:optional
	var name : String;
	/**
		Sets {@link Phaser.GameObjects.Group#active}.
	**/
	@:optional
	var active : Bool;
	/**
		Sets {@link Phaser.GameObjects.Group#maxSize}.
	**/
	@:optional
	var maxSize : Float;
	/**
		Sets {@link Phaser.GameObjects.Group#defaultKey}.
	**/
	@:optional
	var defaultKey : String;
	/**
		Sets {@link Phaser.GameObjects.Group#defaultFrame}.
	**/
	@:optional
	var defaultFrame : ts.AnyOf2<String, Float>;
	/**
		Sets {@link Phaser.GameObjects.Group#runChildUpdate}.
	**/
	@:optional
	var runChildUpdate : Bool;
	/**
		Sets {@link Phaser.GameObjects.Group#createCallback}.
	**/
	@:optional
	dynamic function createCallback(item:global.phaser.gameobjects.GameObject):Void;
	/**
		Sets {@link Phaser.GameObjects.Group#removeCallback}.
	**/
	@:optional
	dynamic function removeCallback(item:global.phaser.gameobjects.GameObject):Void;
	/**
		Sets {@link Phaser.GameObjects.Group#createMultipleCallback}.
	**/
	@:optional
	dynamic function createMultipleCallback(items:Array<global.phaser.gameobjects.GameObject>):Void;
};