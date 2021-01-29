package global.phaser.types.renderer.webgl;

typedef WebGLConst = {
	/**
		The data type of the attribute, i.e. `gl.BYTE`, `gl.SHORT`, `gl.UNSIGNED_BYTE`, `gl.FLOAT`, etc.
	**/
	@:native("enum")
	var enum_ : Float;
	/**
		The size, in bytes, of the data type.
	**/
	var size : Float;
};