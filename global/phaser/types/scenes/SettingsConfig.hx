package global.phaser.types.scenes;

typedef SettingsConfig = {
	/**
		The unique key of this Scene. Must be unique within the entire Game instance.
	**/
	@:optional
	var key : String;
	/**
		Does the Scene start as active or not? An active Scene updates each step.
	**/
	@:optional
	var active : Bool;
	/**
		Does the Scene start as visible or not? A visible Scene renders each step.
	**/
	@:optional
	var visible : Bool;
	/**
		Files to be loaded before the Scene begins.
	**/
	@:optional
	var pack : ts.AnyOf2<Bool, global.phaser.types.loader.filetypes.PackFileSection>;
	/**
		An optional Camera configuration object.
	**/
	@:optional
	var cameras : ts.AnyOf2<global.phaser.types.cameras.scene2d.JSONCamera, Array<global.phaser.types.cameras.scene2d.JSONCamera>>;
	/**
		Overwrites the default injection map for a scene.
	**/
	@:optional
	var map : { };
	/**
		Extends the injection map for a scene.
	**/
	@:optional
	var mapAdd : { };
	/**
		The physics configuration object for the Scene.
	**/
	@:optional
	var physics : global.phaser.types.core.PhysicsConfig;
	/**
		The loader configuration object for the Scene.
	**/
	@:optional
	var loader : global.phaser.types.core.LoaderConfig;
	/**
		The plugin configuration object for the Scene.
	**/
	@:optional
	var plugins : Dynamic;
};