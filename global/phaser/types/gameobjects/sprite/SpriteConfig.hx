package global.phaser.types.gameobjects.sprite;

typedef SpriteConfig = global.phaser.types.gameobjects.GameObjectConfig & {
	/**
		The key of the Texture this Game Object will use to render with, as stored in the Texture Manager.
	**/
	@:optional
	var key : String;
	/**
		An optional frame from the Texture this Game Object is rendering with.
	**/
	@:optional
	var frame : ts.AnyOf2<String, Float>;
};