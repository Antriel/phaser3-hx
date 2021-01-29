package global.phaser.types.renderer.webgl;

typedef WebGLPipelineShaderConfig = {
	/**
		The name of the shader. Doesn't have to be unique, but makes shader look-up easier if it is.
	**/
	@:optional
	var name : String;
	/**
		The source code, as a string, for the vertex shader. If not given, uses the `Phaser.Types.Renderer.WebGL.WebGLPipelineConfig.vertShader` property instead.
	**/
	@:optional
	var vertShader : String;
	/**
		The source code, as a string, for the fragment shader. Can include `%count%` and `%forloop%` declarations for multi-texture support. If not given, uses the `Phaser.Types.Renderer.WebGL.WebGLPipelineConfig.fragShader` property instead.
	**/
	@:optional
	var fragShader : String;
	/**
		An array of shader attribute data. All shaders bound to this pipeline must use the same attributes.
	**/
	@:optional
	var attributes : WebGLPipelineAttributesConfig;
};