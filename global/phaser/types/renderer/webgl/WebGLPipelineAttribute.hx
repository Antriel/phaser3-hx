package global.phaser.types.renderer.webgl;

typedef WebGLPipelineAttribute = {
	/**
		The name of the attribute as defined in the vertex shader.
	**/
	var name : String;
	/**
		The number of components in the attribute, i.e. 1 for a float, 2 for a vec2, 3 for a vec3, etc.
	**/
	var size : Float;
	/**
		The data type of the attribute. Either `gl.BYTE`, `gl.SHORT`, `gl.UNSIGNED_BYTE`, `gl.UNSIGNED_SHORT` or `gl.FLOAT`.
	**/
	var type : Float;
	/**
		The offset, in bytes, of this attribute data in the vertex array. Equivalent to `offsetof(vertex, attrib)` in C.
	**/
	var offset : Float;
	/**
		Should the attribute data be normalized?
	**/
	var normalized : Bool;
	/**
		You should set this to `false` by default. The pipeline will enable it on boot.
	**/
	var enabled : Bool;
	/**
		You should set this to `-1` by default. The pipeline will set it on boot.
	**/
	var location : Float;
};