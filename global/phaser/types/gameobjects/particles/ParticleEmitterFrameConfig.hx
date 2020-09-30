package global.phaser.types.gameobjects.particles;

typedef ParticleEmitterFrameConfig = {
	/**
		One or more texture frames.
	**/
	@:optional
	var frames : ts.AnyOf6<String, Float, global.phaser.textures.Frame, Array<String>, Array<Float>, Array<global.phaser.textures.Frame>>;
	/**
		Whether texture frames will be assigned consecutively (true) or at random (false).
	**/
	@:optional
	var cycle : Bool;
	/**
		The number of consecutive particles receiving each texture frame, when `cycle` is true.
	**/
	@:optional
	var quantity : Float;
};