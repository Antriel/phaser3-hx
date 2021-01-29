package global.phaser.types.renderer.webgl;

typedef WebGLPipelineAttributesConfig = {
	/**
		The name of the attribute as defined in the vertex shader.
	**/
	var name : String;
	/**
		The number of components in the attribute, i.e. 1 for a float, 2 for a vec2, 3 for a vec3, etc.
	**/
	var size : Float;
	/**
		The data type of the attribute, one of the `WEBGL_CONST` values, i.e. `WEBGL_CONST.FLOAT`, `WEBGL_CONST.UNSIGNED_BYTE`, etc.
	**/
	var type : WebGLConst;
	/**
		Should the attribute data be normalized?
	**/
	@:optional
	var normalized : Bool;
};