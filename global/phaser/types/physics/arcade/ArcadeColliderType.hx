package global.phaser.types.physics.arcade;

/**
	An Arcade Physics Collider Type.
**/
typedef ArcadeColliderType = ts.AnyOf13<global.phaser.gameobjects.GameObject, global.phaser.gameobjects.Group, global.phaser.physics.arcade.Sprite, global.phaser.physics.arcade.Image, global.phaser.physics.arcade.StaticGroup, global.phaser.physics.arcade.Group, global.phaser.tilemaps.TilemapLayer, Array<global.phaser.gameobjects.GameObject>, Array<global.phaser.physics.arcade.Sprite>, Array<global.phaser.physics.arcade.Image>, Array<global.phaser.physics.arcade.StaticGroup>, Array<global.phaser.physics.arcade.Group>, Array<global.phaser.tilemaps.TilemapLayer>>;