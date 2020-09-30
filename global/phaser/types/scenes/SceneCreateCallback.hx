package global.phaser.types.scenes;

/**
	Can be defined on your own Scenes. Use it to create your game objects.
	This method is called by the Scene Manager when the scene starts, after `init()` and `preload()`.
	If the LoaderPlugin started after `preload()`, then this method is called only after loading is complete.
**/
typedef SceneCreateCallback = (data:Dynamic) -> Void;