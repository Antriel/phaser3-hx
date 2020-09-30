package global.phaser.types.scenes;

typedef SettingsObject = {
	/**
		The current status of the Scene. Maps to the Scene constants.
	**/
	var status : Float;
	/**
		The unique key of this Scene. Unique within the entire Game instance.
	**/
	var key : String;
	/**
		The active state of this Scene. An active Scene updates each step.
	**/
	var active : Bool;
	/**
		The visible state of this Scene. A visible Scene renders each step.
	**/
	var visible : Bool;
	/**
		Has the Scene finished booting?
	**/
	var isBooted : Bool;
	/**
		Is the Scene in a state of transition?
	**/
	var isTransition : Bool;
	/**
		The Scene this Scene is transitioning from, if set.
	**/
	var transitionFrom : global.phaser.Scene;
	/**
		The duration of the transition, if set.
	**/
	var transitionDuration : Float;
	/**
		Is this Scene allowed to receive input during transitions?
	**/
	var transitionAllowInput : Bool;
	/**
		a data bundle passed to this Scene from the Scene Manager.
	**/
	var data : Dynamic;
	/**
		Files to be loaded before the Scene begins.
	**/
	var pack : ts.AnyOf2<Bool, global.phaser.types.loader.filetypes.PackFileSection>;
	/**
		The Camera configuration object.
	**/
	var cameras : ts.AnyOf2<global.phaser.types.cameras.scene2d.JSONCamera, Array<global.phaser.types.cameras.scene2d.JSONCamera>>;
	/**
		The Scene's Injection Map.
	**/
	var map : { };
	/**
		The physics configuration object for the Scene.
	**/
	var physics : global.phaser.types.core.PhysicsConfig;
	/**
		The loader configuration object for the Scene.
	**/
	var loader : global.phaser.types.core.LoaderConfig;
	/**
		The plugin configuration object for the Scene.
	**/
	var plugins : Dynamic;
};