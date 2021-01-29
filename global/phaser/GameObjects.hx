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
	/**
		Calculates the Transform Matrix of the given Game Object and Camera, factoring in
		the parent matrix if provided.
		
		Note that the object this results contains _references_ to the Transform Matrices,
		not new instances of them. Therefore, you should use their values immediately, or
		copy them to your own matrix, as they will be replaced as soon as another Game
		Object is rendered.
	**/
	static function GetCalcMatrix(src:global.phaser.gameobjects.GameObject, camera:global.phaser.cameras.scene2d.Camera, ?parentMatrix:global.phaser.gameobjects.components.TransformMatrix):global.phaser.types.gameobjects.GetCalcMatrixResults;
	/**
		Returns an object containing dimensions of the Text object.
	**/
	static function GetTextSize(text:global.phaser.gameobjects.Text, size:global.phaser.types.gameobjects.text.TextMetrics, lines:Array<String>):global.phaser.types.gameobjects.text.GetTextSizeObject;
	/**
		Calculates the ascent, descent and fontSize of a given font style.
	**/
	static function MeasureText(textStyle:global.phaser.gameobjects.TextStyle):global.phaser.types.gameobjects.text.TextMetrics;
}