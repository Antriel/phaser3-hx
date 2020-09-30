package global.phaser.types.animations;

typedef JSONAnimations = {
	/**
		An array of all Animations added to the Animation Manager.
	**/
	var anims : Array<JSONAnimation>;
	/**
		The global time scale of the Animation Manager.
	**/
	var globalTimeScale : Float;
};