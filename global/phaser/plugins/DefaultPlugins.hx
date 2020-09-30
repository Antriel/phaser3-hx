package global.phaser.plugins;

typedef DefaultPlugins = {
	/**
		These are the Global Managers that are created by the Phaser.Game instance.
	**/
	var Global : Array<Dynamic>;
	/**
		These are the core plugins that are installed into every Scene.Systems instance, no matter what.
	**/
	var CoreScene : Array<Dynamic>;
	/**
		These plugins are created in Scene.Systems in addition to the CoreScenePlugins.
	**/
	var DefaultScene : Array<Dynamic>;
};