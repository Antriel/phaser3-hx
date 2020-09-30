package global.phaser.types.scenes;

typedef SceneTransitionConfig = {
	/**
		The Scene key to transition to.
	**/
	var target : String;
	/**
		The duration, in ms, for the transition to last.
	**/
	@:optional
	var duration : Float;
	/**
		Will the Scene responsible for the transition be sent to sleep on completion (`true`), or stopped? (`false`)
	**/
	@:optional
	var sleep : Bool;
	/**
		Will the Scene responsible for the transition be removed from the Scene Manager after the transition completes?
	**/
	@:optional
	var remove : Bool;
	/**
		Will the Scenes Input system be able to process events while it is transitioning in or out?
	**/
	@:optional
	var allowInput : Bool;
	/**
		Move the target Scene to be above this one before the transition starts.
	**/
	@:optional
	var moveAbove : Bool;
	/**
		Move the target Scene to be below this one before the transition starts.
	**/
	@:optional
	var moveBelow : Bool;
	/**
		This callback is invoked every frame for the duration of the transition.
	**/
	@:optional
	var onUpdate : haxe.Constraints.Function;
	/**
		The context in which the callback is invoked.
	**/
	@:optional
	var onUpdateScope : Dynamic;
	/**
		An object containing any data you wish to be passed to the target scene's init / create methods (if sleep is false) or to the target scene's wake event callback (if sleep is true).
	**/
	@:optional
	var data : Dynamic;
};