package global.phaser.types.gameobjects.particles;

typedef EmitterOpOnEmitType = ts.AnyOf8<Float, EmitterOpOnEmitCallback, Array<Float>, EmitterOpRandomConfig, EmitterOpRandomMinMaxConfig, EmitterOpRandomStartEndConfig, EmitterOpSteppedConfig, EmitterOpCustomEmitConfig>;