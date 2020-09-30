package global.phaser.types.scenes;

/**
	Can be defined on your own Scenes.
	This method is called by the Scene Manager when the scene starts, before `preload()` and `create()`.
**/
typedef SceneInitCallback = (data:Dynamic) -> Void;