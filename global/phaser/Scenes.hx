package global.phaser;

@:native("Phaser.Scenes") @valueModuleOnly extern class Scenes {
	/**
		Builds an array of which physics plugins should be activated for the given Scene.
	**/
	static function GetPhysicsPlugins(sys:global.phaser.scenes.Systems):Array<Dynamic>;
	/**
		Builds an array of which plugins (not including physics plugins) should be activated for the given Scene.
	**/
	static function GetScenePlugins(sys:global.phaser.scenes.Systems):Array<Dynamic>;
	/**
		Scene state.
	**/
	static var PENDING : Float;
	/**
		Scene state.
	**/
	static var INIT : Float;
	/**
		Scene state.
	**/
	static var START : Float;
	/**
		Scene state.
	**/
	static var LOADING : Float;
	/**
		Scene state.
	**/
	static var CREATING : Float;
	/**
		Scene state.
	**/
	static var RUNNING : Float;
	/**
		Scene state.
	**/
	static var PAUSED : Float;
	/**
		Scene state.
	**/
	static var SLEEPING : Float;
	/**
		Scene state.
	**/
	static var SHUTDOWN : Float;
	/**
		Scene state.
	**/
	static var DESTROYED : Float;
}