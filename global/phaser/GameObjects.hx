package global.phaser;

@:native("Phaser.GameObjects") @valueModuleOnly extern class GameObjects {
	/**
		Builds a Game Object using the provided configuration object.
	**/
	static function BuildGameObject(scene:Scene, gameObject:global.phaser.gameobjects.GameObject, config:global.phaser.types.gameobjects.GameObjectConfig):global.phaser.gameobjects.GameObject;
	/**
		Adds an Animation component to a Sprite and populates it based on the given config.
	**/
	static function BuildGameObjectAnimation(sprite:global.phaser.gameobjects.Sprite, config:Dynamic):global.phaser.gameobjects.Sprite;
}