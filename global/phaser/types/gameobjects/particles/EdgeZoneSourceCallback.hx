package global.phaser.types.gameobjects.particles;

typedef EdgeZoneSourceCallback = ts.AnyOf2<(quantity:Float) -> Void, (quantity:Float, stepRate:Float) -> Void>;