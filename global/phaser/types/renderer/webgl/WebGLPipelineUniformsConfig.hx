package global.phaser.types.renderer.webgl;

typedef WebGLPipelineUniformsConfig = {
	/**
		The name of the uniform as defined in the shaders.
	**/
	var name : String;
	/**
		The pipeline will set it when the program is linked.
	**/
	var location : js.html.webgl.UniformLocation;
	/**
		The cached value1.
	**/
	var value1 : Dynamic;
	/**
		The cached value2.
	**/
	var value2 : Dynamic;
	/**
		The cached value3.
	**/
	var value3 : Dynamic;
	/**
		The cached value4.
	**/
	var value4 : Dynamic;
};